package com.tutorialq.web.validators;

import com.tutorialq.entities.Employee;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
@Slf4j
public class UpdatePasswordValidator implements Validator {

    @Autowired
    PasswordValidator passwordValidator;

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
        Employee employeeRegistration = (Employee) target;

        if (StringUtils.isNotBlank(employeeRegistration.getEmpPassword())) {
            if (passwordValidator.validate(employeeRegistration.getEmpPassword())) {
                //Check if the confirmation password is same as the new password.
                if (!StringUtils.equalsIgnoreCase(employeeRegistration.getEmpPassword(), employeeRegistration.getEmpPassword2())) {
                    errors.rejectValue("empPassword2", "NotValid.registration.confirm.password");
                }
            } else {
                errors.rejectValue("empPassword", "NotValid.registration.password");
            }
        }

    }
}
