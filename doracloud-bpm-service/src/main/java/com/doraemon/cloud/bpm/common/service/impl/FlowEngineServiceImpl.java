package com.doraemon.cloud.bpm.common.service.impl;


import com.doraemon.cloud.bpm.common.service.FlowEngineService;
import com.doraemon.cloud.bpm.constant.ResultInfo;
import com.doraemon.cloud.bpm.constant.SysConstant;
import com.doraemon.cloud.bpm.model.FlowTask;
import com.doraemon.cloud.bpm.model.ProcessDo;
import com.doraemon.cloud.bpm.utils.ActivitiUtil;
import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricVariableInstance;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description:
 * @Author lw
 * @date 2018/8/22 17:08
 */
@Service
public class FlowEngineServiceImpl implements FlowEngineService {
    @Resource
    private RuntimeService runtimeService;
    @Resource
    private IdentityService identityService;
    @Resource
    private TaskService taskService;
    @Resource
    private HistoryService historyService;

    @Override
    public ResultInfo startFlow(ProcessDo processDo) {
        identityService.setAuthenticatedUserId(processDo.getCurrentUser());
        // 开始流程
        ProcessInstance vacationInstance = runtimeService.startProcessInstanceByKey(processDo.getProcessKey());
        // 查询当前任务
        Task currentTask = taskService.createTaskQuery().processInstanceId(vacationInstance.getId()).singleResult();
        // 申明任务
        taskService.claim(currentTask.getId(), processDo.getCurrentUser());

        Map<String, Object> vars = new HashMap<>(4);
        vars.put("currentUser", processDo.getCurrentUser());
        vars.put(processDo.getProcessParamName(), processDo.getProcessParamValue());
        taskService.complete(currentTask.getId(), vars);
        ResultInfo resultInfo = new ResultInfo();
        resultInfo.setType(true);
        resultInfo.setCode(SysConstant.CODE_SUCCESS);
        resultInfo.setMsg(SysConstant.MSG_SUCCESS);
        return resultInfo;
    }

    @Override
    public ResultInfo flowRecord(ProcessDo processDo) {
        List<HistoricProcessInstance> hisProInstance = historyService.createHistoricProcessInstanceQuery()
                .processDefinitionKey(processDo.getProcessKey()).startedBy(processDo.getCreatedBy()).finished()
                .orderByProcessInstanceEndTime().desc().list();

        List<ProcessDo> flowList = new ArrayList<>();
        for (HistoricProcessInstance hisInstance : hisProInstance) {
            ProcessDo flow = new ProcessDo();
            flow.setCreatedBy(hisInstance.getStartUserId());
            flow.setCreatedDate(hisInstance.getStartTime());
            flow.setProcessParamValue("申请结束");
            List<HistoricVariableInstance> varInstanceList = historyService.createHistoricVariableInstanceQuery()
                    .processInstanceId(hisInstance.getId()).list();
            ActivitiUtil.setVars(flow, varInstanceList);
            flowList.add(flow);
        }
        ResultInfo<List<ProcessDo>> resultInfo = new ResultInfo();
        resultInfo.setData(flowList);
        return resultInfo;
    }

    /**
     * 查看审批流程
     *
     * @param processDo
     * @return
     */
    @Override
    public ResultInfo flowTask(ProcessDo processDo) {
        List<Task> taskList = taskService.createTaskQuery().taskCandidateUser(processDo.getNextAudit())
                .orderByTaskCreateTime().desc().list();
        List<FlowTask> flowTaskList = new ArrayList<>();
        ResultInfo resultInfo = new ResultInfo();
        for (Task task : taskList) {
            FlowTask flowTask = new FlowTask();
            flowTask.setId(task.getId());
            flowTask.setName(task.getName());
            flowTask.setCreateTime(task.getCreateTime());
            String instanceId = task.getProcessInstanceId();
            ProcessInstance instance = runtimeService.createProcessInstanceQuery().processInstanceId(instanceId).singleResult();
            ProcessDo vac = getFlow(instance);
            flowTask.setProcessDo(vac);
            flowTaskList.add(flowTask);
        }
        resultInfo.setData(flowTaskList);
        return resultInfo;
    }

    /**
     * 流程审批
     *
     * @param processDo
     * @return
     */
    @Override
    public ResultInfo flowAudit(ProcessDo processDo) {
        return null;
    }

    private ProcessDo getFlow(ProcessInstance instance) {
        ProcessDo flow = new ProcessDo();
        Map<String, Object> variableMap = instance.getProcessVariables();
        flow.setCurrentUser((String)variableMap.get("currentUser"));
        flow.setProcessParamValue((String)variableMap.get("apply"));
        flow.setIsEnd(instance.isEnded() ? "申请结束" : "等待审批");
        return flow;
    }
}
