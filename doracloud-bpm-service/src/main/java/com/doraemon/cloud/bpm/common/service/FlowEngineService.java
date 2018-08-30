package com.doraemon.cloud.bpm.common.service;

import com.doraemon.cloud.bpm.constant.ResultInfo;
import com.doraemon.cloud.bpm.model.ProcessDo;

/**
 * @Description:
 * @Author lw
 * @date 2018/8/22 17:06
 */
public interface FlowEngineService {
     /**
      * 开始流程
      * @param processDo
      * @return
      */
     ResultInfo startFlow(ProcessDo processDo);

     /**
      * 流程历史记录
      * @param processDo
      * @return
      */
     ResultInfo flowRecord(ProcessDo processDo);

     /**
      * 查看审批流程
      * @param processDo
      * @return
      */
     ResultInfo flowTask(ProcessDo processDo);

     /**
      * 流程审批
      * @param processDo
      * @return
      */

     ResultInfo flowAudit(ProcessDo processDo);

}
