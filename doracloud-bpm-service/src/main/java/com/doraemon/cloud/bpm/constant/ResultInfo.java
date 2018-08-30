package com.doraemon.cloud.bpm.constant;

/**
 * @Description: 统一结果对象
 * @Author lw
 * @date 2018/8/19 14:51
 */
public class ResultInfo<T> {
    private boolean type;//结果类型true成功，false失败
    private String code;//结果码
    private String msg;//结果信息
    private T data;//结果数据

    public ResultInfo() {
    }

    public ResultInfo(boolean type, String code, String msg, T data) {
        this.type = type;
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public boolean isType() {
        return type;
    }

    public void setType(boolean type) {
        this.type = type;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
