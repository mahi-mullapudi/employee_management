package com.tutorialq.web.controllers;

import com.tutorialq.exceptions.CustomException;
import com.tutorialq.models.AppErrorInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Locale;

@ControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    @Autowired
    MessageSource messageSource;

    //commons-fileupload
    @ExceptionHandler({MultipartException.class})
    public ModelAndView handleMaxSizeException(Exception excptn, HttpServletRequest request) {
        ModelAndView model = new ModelAndView("sessionexpired");
        if (excptn instanceof MultipartException) {
            MultipartException mEx = (MultipartException) excptn;
            if (excptn instanceof MaxUploadSizeExceededException) {
                log.info("MaxUploadSizeExceededException for file : ");
                model.addObject("ERROR_MESSAGE_HEADER", "File Size exceeded Limit");
                model.addObject("ERROR_MESSAGE_BODY", "Please upload files under the stipulated size limit.");
            } else {
                model.addObject("ERROR_MESSAGE_HEADER", "Internal Server Error");
                model.addObject("errors", "Unexpected error: " + excptn.getMessage());
            }
        } else {
            model.addObject("ERROR_MESSAGE_HEADER", "Internal Server Error");
            model.addObject("errors", "Unexpected error: " + excptn.getMessage());
        }
        return model;
    }

    @ExceptionHandler({CustomException.class})
    public ModelAndView handleCustomException(Exception excptn, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        ModelAndView model = new ModelAndView("error");
        CustomException ex = (CustomException) excptn;

        AppErrorInfo errorInfo = new AppErrorInfo();
        errorInfo.setErrorCode(ex.getErrorCode());
        errorInfo.setErrorDetails(ex.getErrorDetails());
        errorInfo.setErrorMessage(messageSource.getMessage(ex.getErrorCode(),
                new String[]{}, Locale.US));
        errorInfo.setHttpStatusCode(ex.getHttpStatusCode());
        errorInfo.setSessionId(session.getId());
        StringWriter sw = new StringWriter();
        ex.printStackTrace(new PrintWriter(sw));
        String s = sw.toString();
        errorInfo.setStackTrace(s);
        errorInfo.setTimeStamp(System.currentTimeMillis());
        model.addObject("errorInfo", errorInfo);
        return model;
    }


    @ExceptionHandler({Exception.class})
    public ModelAndView handleGenericException(Exception ex, HttpServletRequest request) {
        //LOG HERE
        ModelAndView model = new ModelAndView("error");
        AppErrorInfo errorInfo = new AppErrorInfo();
        HttpSession session = request.getSession(false);

        errorInfo.setErrorCode("TIMESHEET.SERVER.ERROR");
        errorInfo.setErrorDetails("");
        errorInfo.setErrorMessage(messageSource.getMessage("internal.server.error",
                new String[]{}, Locale.US));
        errorInfo.setHttpStatusCode(500);
        errorInfo.setSessionId(session.getId());

        StringWriter sw = new StringWriter();
        ex.printStackTrace(new PrintWriter(sw));
        String s = sw.toString();
        errorInfo.setStackTrace(s);
        errorInfo.setTimeStamp(System.currentTimeMillis());

        model.addObject("ecasErrorInfo", errorInfo);
        return model;
    }
}
