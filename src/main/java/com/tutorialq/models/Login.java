package com.tutorialq.models;

import lombok.Data;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.io.Serializable;

@Component
@Scope("prototype")
@Data
public class Login implements Serializable {

    private String emailId;
    private transient String password;
    private String clientIpAddress;

    public Login() {

    }
}
