package com.gzu.ctts.common;

import lombok.Data;

@Data
public class Result<T> {

    // 状态码
    private int code;
    // 消息
    private String message;
    // 数据
    private T data;


    public static <T> Result<T> created(){
        Result<T> result = new Result<T>();
        result.setCode(201);
        result.setMessage("created");
        return result;
    }

    public static <T> Result<T> success(){
        Result<T> result = new Result<T>();
        result.setCode(200);
        result.setMessage("success");
        return result;
    }

    public static <T> Result<T> success(String message){
        Result<T> result = new Result<T>();
        result.setCode(200);
        result.setMessage(message);
        return result;
    }

    public static <T> Result<T> success(T data) {
        Result<T> result = new Result<T>();
        result.setCode(200);
        result.setMessage("success");
        result.setData(data);
        return result;
    }

    public static <T> Result<T> failed(){
        Result<T> result = new Result<T>();
        result.setCode(500);
        result.setMessage("failed");
        return result;
    }


    public static <T> Result<T> failed(int code, String message){
        Result<T> result = new Result<T>();
        result.setCode(code);
        result.setMessage(message);
        return result;
    }

}
