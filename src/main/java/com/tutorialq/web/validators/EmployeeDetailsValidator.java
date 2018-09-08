package com.tutorialq.web.validators;

import com.tutorialq.entities.Employee;
import com.tutorialq.services.EmployeeService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
@Slf4j
public class EmployeeDetailsValidator implements Validator {

    @Autowired
    EmailValidator emailValidator;
    @Autowired
    PhoneNumberValidator phoneValidator;
    @Autowired
    PasswordValidator passwordValidator;
    @Autowired
    EmployeeService employeeService;

    @Override
    public boolean supports(Class<?> clazz) {
        return Employee.class.equals(clazz);
    }

    /*
     *   This validate() method checks for all the validations related to Registration Information.
     */
    @Override
    public void validate(Object target, Errors errors) {

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "employeeFirstName", "NotEmpty.registration.fname");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "employeeLastName", "NotEmpty.registration.lname");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "employeeEmailId", "NotEmpty.registration.email");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "skillSet", "NotEmpty.registration.skillSet");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "companyName", "NotEmpty.registration.companyName");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "employmentType", "NotEmpty.registration.employmentType");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "employeePhone", "NotEmpty.registration.phoneNum");

        Employee employeeDetails = (Employee) target;

        //Email Validation
        if (!emailValidator.validate(employeeDetails.getEmployeeEmailId())) {
            errors.rejectValue("employeeEmailId", "NotValid.registration.email");
        } /*else {
            //Check if the Email Id has an already associated linked account.
            try {
                if (employeeService.checkIfEmployeeIdExists(employeeDetails.getEmployeeEmailId())) {
                    errors.rejectValue("employeeEmailId", "Duplicate.registration.email");
                }
            } catch (Exception ex) {
                log.error("Exception while checking if the email id already exist:: ");
                errors.rejectValue("employeeEmailId", "Error.checking.registration.email");
            }
        }*/

        if (!StringUtils.isBlank(employeeDetails.getEmployeePhone())) {
            String phoneNumber = employeeDetails.getEmployeePhone().replaceAll("[()-]", "");
            if (!phoneValidator.validate(phoneNumber)) {
                errors.rejectValue("phoneNumber", "NotValid.registration.phoneNum");
            }
        }

        if (employeeDetails.getEmploymentStartDate() == null) {
            errors.rejectValue("employmentStartDate", "NotEmpty.registration.employeeStartDate");
        }

    }
}
