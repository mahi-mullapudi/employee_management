package com.tutorialq.models;

import lombok.Data;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.Date;

@Component
@Scope(value = "prototype")
@Data
public class EmployeeRole implements Serializable {

    private long roleId;
    private String roleName;
    private String roleDescription;
    private String roleDisplayName;
    private Date dateRoleCreated;
    private boolean roleActive;
    private Date dateRoleInactivated;
    private String nmeRoleInactivated;

    public EmployeeRole() {
    }

}
