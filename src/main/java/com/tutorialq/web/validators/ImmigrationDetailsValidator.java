package com.tutorialq.web.validators;

import com.tutorialq.entities.ImmigrationDetails;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
@Slf4j
public class ImmigrationDetailsValidator implements Validator {

    @Autowired
    EmailValidator emailValidator;
    @Autowired
    PhoneNumberValidator phoneValidator;

    @Override
    public boolean supports(Class<?> clazz) {
        return ImmigrationDetails.class.equals(clazz);
    }

    /*
     *   This validate() method checks for all the validations related to Registration Information.
     */
    @Override
    public void validate(Object target, Errors errors) {

    }

}
