package com.tutorialq.models;

import lombok.Data;
import org.springframework.context.annotation.Scope;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.time.LocalDateTime;

@Component
@Scope(value = "prototype")
@Data
public class EmployeeRole implements Serializable {

    private long roleId;
    private String roleName;
    private String roleDescription;
    private String roleDisplayName;
    @DateTimeFormat(pattern = "MM/dd/yyyy HH:mm:ss")
    private LocalDateTime dateRoleCreated;
    private boolean roleActive;
    @DateTimeFormat(pattern = "MM/dd/yyyy HH:mm:ss")
    private LocalDateTime dateRoleInactivated;
    private String nmeRoleInactivated;

    public EmployeeRole() {
    }

}
