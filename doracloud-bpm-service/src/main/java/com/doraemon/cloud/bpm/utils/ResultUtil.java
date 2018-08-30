package com.doraemon.cloud.bpm.utils;

import com.doraemon.cloud.bpm.constant.ResultInfo;
import com.doraemon.cloud.bpm.constant.SysConstant;
import org.apache.commons.lang.StringUtils;

/**
 * @Description: 获取结果公共方法
 * @Author lw
 * @date 2018/8/19 15:03
 */
public class ResultUtil {
    /**
     * 获取默认成功结果
     *
     * @param data
     * @return
     */
    public static <T> ResultInfo<T> getSucResult(T data) {
        return doSucResult(data, SysConstant.MSG_SUCCESS);
    }

    /**
     * 获取自定义话术成功结果
     *
     * @param data
     * @param msg
     * @return
     */
    public static <T> ResultInfo<T> getSucResult(T data, String msg) {

        return doSucResult(data, msg);
    }

    /**
     * 获取默认失败结果
     *
     * @return
     */
    public static <T>ResultInfo<T> getFailedResult() {
        return doFailedResult(SysConstant.MSG_FAILED);
    }

    /**
     * 获取自定义话术失败结果
     *
     * @param msg
     * @return
     */
    public static <T>ResultInfo<T> getFailedResult(String msg) {
        return doFailedResult(msg);
    }

    private static <T> ResultInfo<T> doSucResult(T data, String msg) {
        ResultInfo<T> resultInfo = new ResultInfo();
        resultInfo.setType(true);
        resultInfo.setCode(SysConstant.CODE_SUCCESS);
        resultInfo.setMsg(SysConstant.MSG_SUCCESS);
        resultInfo.setData(data);
        if (StringUtils.isNotEmpty(msg)) {
            resultInfo.setMsg(msg);
        }
        return resultInfo;
    }

    private static <T>ResultInfo<T> doFailedResult(String msg) {
        ResultInfo<T> resultInfo = new ResultInfo();
        resultInfo.setType(true);
        resultInfo.setCode(SysConstant.CODE_FAILED);
        resultInfo.setMsg(SysConstant.MSG_FAILED);
        if (StringUtils.isNotEmpty(msg)) {
            resultInfo.setMsg(msg);
        }
        return resultInfo;
    }
}
