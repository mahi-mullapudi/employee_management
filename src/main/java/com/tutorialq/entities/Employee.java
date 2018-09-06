package com.tutorialq.entities;

import com.tutorialq.constants.ApplicationConstants;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.apache.commons.lang3.StringUtils;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@Entity
@ToString(exclude = {"empPassword", "empPassword2"})
@NoArgsConstructor
@AllArgsConstructor
public class Employee extends AuditModel implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "employee_id", unique = true, nullable = false)
    private long employeeId; //Unique Id and the primary key for Employee table.
    @Column(unique = true, nullable = false)
    private String employeeEmailId; //Primary EmailId/User Name of the user.
    @Column(nullable = false)
    private String empPassword; //This will be stored as a Hash value.
    @Transient
    private String empPassword2; //Just a confirmation field used for validation. Not saved/updated.
    private String assignedEmployeeId; // assigned Identifier.
    @Column(nullable = false)
    private String employeeFirstName;
    @Column(nullable = false)
    private String employeeLastName;
    @Transient
    private String employeeFullName;
    private String employeeMiddleName;
    private String employeeTitle; //Description of the Employee Title.
    private Integer employeeRoleId; //Foreign Reference for Employee_Roles table.
    private String employeeRoleDesc;
    private String employeePhone;
    private String employeePhoneExt;
    private String skillSet;
    private String companyName;
    private String employmentType;
    private String referredBy;
    private Integer currentSalaryPerc;
    private Integer salaryDiscount;

    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private LocalDate employmentStartDate;
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private LocalDate employeeStartDate; //Account Created Date.
    private String accountStatusFlag; //Flag to check if the account is ACTIVE or INACTIVE.
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private LocalDate dateInactivated;
    private String nameUserInactivated; // Who inactivated this user

    public String getEmployeeFullName() {
        return (StringUtils.isNotBlank(this.employeeFirstName) ? this.employeeFirstName : "") +
                " " + (StringUtils.isNotBlank(this.employeeLastName) ? this.employeeLastName : "");
    }

    //Audit Information
    @DateTimeFormat(pattern = "MM/dd/yyyy HH:mm:ss")
    private LocalDateTime dateApproved;
    private String nameCreated;
    private String nameLastModified;
    private String nameApproved;

    public boolean isEmployeeRole() {
        return this.employeeRoleId == ApplicationConstants.USER_ROLE_EMPLOYEE_ID;
    }

    public boolean isSupervisorRole() {
        return this.employeeRoleId == ApplicationConstants.USER_ROLE_SUPERVISOR_ID;
    }

    public boolean isAdminRole() {
        return this.employeeRoleId == ApplicationConstants.USER_ROLE_ADMIN_ID;
    }

}
