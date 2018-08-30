package com.doraemon.cloud.bpm.common.model;

import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @Description:
 * @Author lw
 * @date 2018/8/20 13:57
 */
public class PageDo<T> extends PageInfo<T> {
    public PageDo() {
    }

    public PageDo(List<T> list) {
        super(list);
    }

    public PageDo(List<T> list, int navigatePages) {
        super(list, navigatePages);
    }
}
