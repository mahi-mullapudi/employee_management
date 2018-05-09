package com.tutorialq.web.validators;

import com.tutorialq.models.Login;
import com.tutorialq.services.AuthenticationService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
@Slf4j
public class LoginValidator implements Validator {

    @Autowired
    EmailValidator emailValidator;
    @Autowired
    PasswordValidator passwordValidator;
    @Autowired
    AuthenticationService authenticationService;

    @Override
    public boolean supports(Class<?> clazz) {
        return Login.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "emailId", "NotEmpty.login.email");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty.login.password");

        Login loginDetails = (Login) target;
        //Email Validation
        if (!emailValidator.validate(loginDetails.getEmailId())) {
            errors.rejectValue("emailId", "NotValid.login.email");
        }

        try {
            if (!authenticationService.checkEmailIdExists(loginDetails.getEmailId())) {
                log.info("EmailId do not exist: ");
                errors.rejectValue("emailId", "NotValid.login.email");
            }
        } catch (Exception ex) {
            log.error("Exception while checking whether EmailId exists: " + ex);
            errors.rejectValue("emailId", "Error.login.email");
        }

        try {
            if (!authenticationService.authenticatedLogin(loginDetails.getEmailId(), loginDetails.getPassword())) {
                log.info("Authentication failed!!!");
                errors.rejectValue("password", "NotValid.login.password");
            }
        } catch (Exception ex) {
            log.error("Exception while authenticating users: " + ex);
            errors.rejectValue("password", "Error.login.password");
        }

    }
}
