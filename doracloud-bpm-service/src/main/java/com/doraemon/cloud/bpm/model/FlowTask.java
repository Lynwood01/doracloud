package com.doraemon.cloud.bpm.model;

import java.util.Date;

/**
 * 流程任务对象
 */
public class FlowTask {

    private String id;
    private String name;
    private ProcessDo processDo;
    private Date createTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ProcessDo getProcessDo() {
        return processDo;
    }

    public void setProcessDo(ProcessDo processDo) {
        this.processDo = processDo;
    }
}
