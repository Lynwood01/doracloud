package com.doraemon.cloud.bpm.flow.service.impl;

import com.doraemon.cloud.bpm.common.model.PageDo;
import com.doraemon.cloud.bpm.constant.ResultInfo;
import com.doraemon.cloud.bpm.constant.SysConstant;
import com.doraemon.cloud.bpm.flow.service.FlowDefinitionService;
import com.doraemon.cloud.bpm.model.ProcessDo;
import com.doraemon.cloud.bpm.utils.ResultUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.github.pagehelper.PageHelper;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.impl.util.json.JSONObject;
import org.activiti.engine.repository.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * @Description:
 * @Author lw
 * @date 2018/8/25 15:48
 */
@Service
public class FlowDefinitionServiceImpl implements FlowDefinitionService {
    @Autowired
    private RepositoryService repositoryService;

    /**
     * 分页查询流程定义列表
     *
     * @param processDo
     * @return
     */
    @Override
    public ResultInfo<PageDo<List>> queryFlowDef(ProcessDo processDo) {
        PageHelper.startPage(processDo.getPageNum(), processDo.getPageSize());
        List<Model> models = repositoryService.createModelQuery().orderByLastUpdateTime().desc().list();
        ResultInfo resultInfo = ResultUtil.getSucResult(null, "未查到任何数据");
        if (null != models && models.size() > 0) {
            PageDo<List> pageDo = new PageDo(models);
            resultInfo = ResultUtil.getSucResult(pageDo, SysConstant.MSG_SUCCESS);
        }
        return resultInfo;
    }

    @Override
    public ResultInfo newFlowDef(String name, String key, String description) {
       Model model = this.repositoryService.newModel();
        model.setName(name);
        model.setKey(key);
        JSONObject json = new JSONObject();
        json.put("name", name);
        json.put("revision", Integer.valueOf(1));
        json.put("description", description);
        model.setMetaInfo(json.toString());
        this.repositoryService.saveModel(model);
        String modelId = model.getId();
        ObjectMapper objectMapper = new ObjectMapper();
        ObjectNode editorNode = objectMapper.createObjectNode();
        editorNode.put("id", "canvas");
        editorNode.put("resourceId", "canvas");
        ObjectNode stencilSetNode = objectMapper.createObjectNode();
        stencilSetNode.put("namespace", "http://b3mn.org/stencilset/bpmn2.0#");
        editorNode.put("stencilset", stencilSetNode);
        try
        {
            this.repositoryService.addModelEditorSource(model.getId(), editorNode.toString().getBytes("utf-8"));
        }
        catch (UnsupportedEncodingException e)
        {
            e.printStackTrace();
        }
        ResultInfo resultInfo= ResultUtil.getSucResult(modelId);
        return resultInfo;
    }
}
