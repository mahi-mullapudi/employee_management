package com.tutorialq.web.validators;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class EmailValidator {

    private final Pattern pattern;
    private Matcher matcher;

    private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
            + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

    public EmailValidator() {
        pattern = Pattern.compile(EMAIL_PATTERN);
    }

    /**
     * Validate inputEmail with regular expression
     *
     * @param inputEmail inputEmail for validation
     * @return true valid inputEmail, false invalid inputEmail
     */
    public boolean validate(String inputEmail) {
        matcher = pattern.matcher(inputEmail);
        return matcher.matches();

    }
}
