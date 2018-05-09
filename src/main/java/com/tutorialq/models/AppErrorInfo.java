package com.tutorialq.models;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
public class AppErrorInfo {
    private String errorCode;

    private int httpStatusCode;

    private String errorMessage;

    private String errorDetails;

    private String loggedInUser;

    private String sessionId;

    private String pageHeader;

    private long timeStamp;

    private String stackTrace;
}
