package com.doraemon.cloud.bpm.flow.service;

import com.doraemon.cloud.bpm.common.model.PageDo;
import com.doraemon.cloud.bpm.constant.ResultInfo;
import com.doraemon.cloud.bpm.model.ProcessDo;

import java.util.List;

/**
 * @Description:
 * @Author lw
 * @date 2018/8/25 15:46
 */
public interface FlowDefinitionService {
    /**
     * 分页查询流程定义列表
     * @param processDo
     * @return
     */
    ResultInfo<PageDo<List>> queryFlowDef(ProcessDo processDo);


    ResultInfo newFlowDef(String name, String key, String description);
}
