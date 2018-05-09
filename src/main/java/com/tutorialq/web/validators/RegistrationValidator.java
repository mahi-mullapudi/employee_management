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

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
@Slf4j
public class RegistrationValidator implements Validator {

    @Autowired
    EmailValidator emailValidator;
    @Autowired
    PasswordValidator passwordValidator;
    @Autowired
    EmployeeService employeeService;

    private Pattern pattern;
    private Matcher matcher;

    final String PHONE_PATTERN = "^[0-9]{10}$";

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
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "empPassword", "NotEmpty.registration.password");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "empPassword2", "NotEmpty.registration.confirm.password");

        Employee employeeRegistration = (Employee) target;

        //Email Validation
        if (!emailValidator.validate(employeeRegistration.getEmployeeEmailId())) {
            errors.rejectValue("employeeEmailId", "NotValid.registration.email");
        } else {
            //Check if the Email Id has a linked account.
            try {
                if (employeeService.checkIfEmployeeIdExists(employeeRegistration.getEmployeeEmailId())) {
                    errors.rejectValue("employeeEmailId", "Duplicate.registration.email");
                }
            } catch (Exception ex) {
                log.error("Exception while checking if the email id already exist:: ");
                errors.rejectValue("employeeEmailId", "Error.checking.registration.email");
            }
        }

        if (StringUtils.isNotBlank(employeeRegistration.getEmpPassword())) {
            if (!passwordValidator.validate(employeeRegistration.getEmpPassword())) {
                errors.rejectValue("empPassword", "NotValid.registration.password");
            } else {
                if (!StringUtils.equalsIgnoreCase(employeeRegistration.getEmpPassword(), employeeRegistration.getEmpPassword2())) {
                    errors.rejectValue("empPassword2", "NotValid.registration.confirm.password");
                }
            }
        }

        if (!StringUtils.isBlank(employeeRegistration.getEmployeePhone())) {
            String phoneNumber = employeeRegistration.getEmployeePhone().replaceAll("[()-]", "");
            pattern = Pattern.compile(PHONE_PATTERN);
            matcher = pattern.matcher(phoneNumber);
            if (!matcher.matches()) {
                errors.rejectValue("phoneNumber", "NotValid.registration.phoneNum");
            }
        }

    }
}
