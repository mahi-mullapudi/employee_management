package com.tutorialq.models;

import lombok.Data;

import java.io.Serializable;

@Data
public class ResetPassword implements Serializable {

    private String emailId;
    private String password;
    private String password2;

}
