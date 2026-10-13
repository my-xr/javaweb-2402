package com.gzu.ctts.exception;

import com.gzu.ctts.common.Result;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class GlobalExceptionHandler {


    // 处理自定义业务异常
    @ExceptionHandler(BusinessException.class)
    public Result<?> handleBusinessException(BusinessException e) {
        return Result.failed(e.getCode(), e.getMessage());
    }

    // 兜底处理其他未捕获异常
    @ExceptionHandler(Exception.class)
    public Result<?> handleGlobalException(Exception e) {
        e.printStackTrace();
        return Result.failed(500, "系统繁忙");
    }

}
