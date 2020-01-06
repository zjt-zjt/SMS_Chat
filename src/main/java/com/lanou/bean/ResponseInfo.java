package com.lanou.bean;

import java.io.Serializable;

public class ResponseInfo  implements Serializable {
    private Integer code;
    private String message;
    private String[] data;
    String local;

    public String[] getData() {
        return data;
    }

    public String getLocal() {
        return local;
    }

    public void setLocal(String local) {
        this.local = local;
    }

    public void setData(String[] data) {
        this.data = data;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }


}
