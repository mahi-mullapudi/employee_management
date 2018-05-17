package com.tutorialq.web.validators;

import com.tutorialq.entities.ClientDetails;
import com.tutorialq.services.EmployeeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
@Slf4j
public class ClientDetailsValidator implements Validator {
    @Autowired
    EmailValidator emailValidator;
    @Autowired
    EmployeeService employeeService;

    private Pattern pattern;
    private Matcher matcher;

    final String PHONE_PATTERN = "^[0-9]{10}$";

    @Override
    public boolean supports(Class<?> clazz) {
        return ClientDetails.class.equals(clazz);
    }

    /*
     *   This validate() method checks for all the validations related to
     *   Client Details Information.
     */
    @Override
    public void validate(Object target, Errors errors) {

    }
}
