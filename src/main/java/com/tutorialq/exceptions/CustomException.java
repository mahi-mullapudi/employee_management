package com.tutorialq.exceptions;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
public class CustomException extends Exception {

    private static final long serialVersionUID = 1L;

    private String errorCode;
    private int httpStatusCode;
    private String message;
    private String errorDetails;

    public CustomException(String errorCode) {
        this.errorCode = errorCode;
        this.message = "";
    }

    public CustomException(String errorCode, Throwable th) {
        super(th);
        this.errorCode = errorCode;
        this.message = "";
    }

    public CustomException(String errorCode, String message) {
        this.errorCode = errorCode;
        this.message = message;
    }

    public CustomException(String errorCode, String message, Throwable th) {
        super(th);
        this.errorCode = errorCode;
        this.message = message;
    }

    public CustomException(Throwable ex) {
        super(ex);
    }

    public CustomException errorCode(String errorCode) {
        setErrorCode(errorCode);
        return this;
    }

    public CustomException message(String errorMessage) {
        setMessage(errorMessage);
        return this;
    }

    public CustomException errorDetails(String errorDetails) {
        setErrorDetails(errorDetails);
        return this;
    }

    public CustomException httpStatusCode(int httpStatusCode) {
        setHttpStatusCode(httpStatusCode);
        return this;
    }

}