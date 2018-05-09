package com.tutorialq.models;

import lombok.Data;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.Calendar;

@Component
@Scope(value = "prototype")
@Data
public class LoginActivity implements Serializable {

    private long loginActivityId;
    private long employeeId;
    private String employeeUserId;
    private Calendar employeeLastLoggedIn;
    private Calendar employeeLastLoggedOut;
    private String clientIpAddress;

    public LoginActivity() {
    }
}
