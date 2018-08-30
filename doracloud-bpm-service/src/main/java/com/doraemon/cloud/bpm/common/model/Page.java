package com.doraemon.cloud.bpm.common.model;

/**
 * @Description:
 * @Author lw
 * @date 2018/8/25 15:52
 */
public class Page {
    private int pageNum;
    private int pageSize;

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}
