package com.tutorialq.web.validators;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
@Slf4j
public class PhoneNumberValidator {
    private final Pattern pattern;
    private Matcher matcher;

    private static final String PHONE_PATTERN = "^[0-9]{10}$";

    public PhoneNumberValidator() {
        pattern = Pattern.compile(PHONE_PATTERN);
    }

    /**
     * Validate inputPhoneNumber with regular expression
     *
     * @param phoneNumber inputEmail for validation
     * @return true valid inputEmail, false invalid inputEmail
     */
    public boolean validate(String phoneNumber) {
        matcher = pattern.matcher(phoneNumber);
        return matcher.matches();
    }
}
