package com.doraemon.cloud.bpm.model;

import com.doraemon.cloud.bpm.common.model.BaseDo;
import com.doraemon.cloud.bpm.common.model.Page;

import java.time.LocalDateTime;
import java.util.Date;

/**
 * @Description:
 * @Author lw
 * @date 2018/8/22 16:18
 */
public class ProcessDo extends Page {
    private String processKey;//流程key
    private String processParamName;//流程变量名
    private String processParamValue;//流程变量值
    private String currentUser;//当前操作人或者角色
    private String createdBy;//创建人
    private String operatorBy;//操作人
    private String nextAudit;//下一操作人或者角色
    private Date   createdDate;//创建时间
    private Date   operatorDate;//操作时间
    private boolean result;//结果
    private String isEnd;//是否结束

    public String getProcessKey() {
        return processKey;
    }

    public void setProcessKey(String processKey) {
        this.processKey = processKey;
    }

    public String getProcessParamName() {
        return processParamName;
    }

    public void setProcessParamName(String processParamName) {
        this.processParamName = processParamName;
    }

    public String getProcessParamValue() {
        return processParamValue;
    }

    public void setProcessParamValue(String processParamValue) {
        this.processParamValue = processParamValue;
    }

    public String getCurrentUser() {
        return currentUser;
    }

    public void setCurrentUser(String currentUser) {
        this.currentUser = currentUser;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getOperatorBy() {
        return operatorBy;
    }

    public void setOperatorBy(String operatorBy) {
        this.operatorBy = operatorBy;
    }

    public String getNextAudit() {
        return nextAudit;
    }

    public void setNextAudit(String nextAudit) {
        this.nextAudit = nextAudit;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getOperatorDate() {
        return operatorDate;
    }

    public void setOperatorDate(Date operatorDate) {
        this.operatorDate = operatorDate;
    }

    public boolean isResult() {
        return result;
    }

    public void setResult(boolean result) {
        this.result = result;
    }

    public String getIsEnd() {
        return isEnd;
    }

    public void setIsEnd(String isEnd) {
        this.isEnd = isEnd;
    }
}
