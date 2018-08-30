package com.doraemon.cloud.bpm.flow.controller;

import com.doraemon.cloud.bpm.constant.ResultInfo;
import com.doraemon.cloud.bpm.flow.service.FlowDefinitionService;
import com.doraemon.cloud.bpm.model.ProcessDo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Description: 登录成功后首页
 * @Author lw
 * @date 2018/8/24 16:08
 */
@Controller
@RequestMapping("/flow")
public class FlowModelController {
    @Autowired
    private FlowDefinitionService flowDefinitionService;

    /**
     * 获取所有模型
     *
     * @return
     */
    @GetMapping("index")
    public String modelIndex() {

        return "flow-engine/views/model";
    }

    @RequestMapping("pageDef")
    @ResponseBody
    public ResultInfo pageDef(ProcessDo processDo) {

        ResultInfo resultInfo = flowDefinitionService.queryFlowDef(processDo);
        return resultInfo;

    }

    @RequestMapping("newModel")
    @ResponseBody
    public ResultInfo newModel(String name, String key, String description) {

        ResultInfo resultInfo = flowDefinitionService.newFlowDef(name, key, description);

        return resultInfo;

    }
}
