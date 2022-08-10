package com.course.server.exception;

/**
 * @author liuchang
 * @Description 校验异常
 * @date 2022/8/10
 */
public class ValidatorException extends RuntimeException {
    public ValidatorException(String message) {
        super(message);
    }

}
