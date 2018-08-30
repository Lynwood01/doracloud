package com.doraemon.cloud.bpm.common.controller;


import com.doraemon.cloud.bpm.common.service.FlowEngineService;
import com.doraemon.cloud.bpm.constant.ResultInfo;
import com.doraemon.cloud.bpm.model.ProcessDo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Description:
 * @Author lw
 * @date 2018/8/22 17:02
 */
@Controller
@RequestMapping("/flow")
public class FlowEngineController {
    @Autowired
    private FlowEngineService flowEngineService;

    /**
     * 开始一个流程
     * @param processDo
     * @return
     */
    @RequestMapping(value = "/addFlow", method = RequestMethod.POST)
    @ResponseBody
    ResultInfo addFlow(@RequestBody ProcessDo processDo) {

        return flowEngineService.startFlow(processDo);
    }

    /**
     * 查看流程记录
     * @param processDo
     * @return
     */
    @RequestMapping(value = "/flowRecord", method = RequestMethod.POST)
    @ResponseBody
    ResultInfo flowRecord(@RequestBody ProcessDo processDo) {
        return flowEngineService.flowRecord(processDo);
    }

    /**
     * 流程审批
     * @param processDo
     * @return
     */
    @RequestMapping(value = "/flowAudit", method = RequestMethod.POST)
    @ResponseBody
    ResultInfo flowAudit(@RequestBody ProcessDo processDo) {
        return flowEngineService.flowAudit(processDo);
    }

    /**
     * 查看审批
     * @param processDo
     * @return
     */
    @RequestMapping(value = "/flowTask", method = RequestMethod.POST)
    @ResponseBody
    ResultInfo flowTask(@RequestBody ProcessDo processDo) {
        return flowEngineService.flowTask(processDo);
    }

}
