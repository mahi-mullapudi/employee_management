package com.tutorialq.web.validators;

import com.tutorialq.entities.ImmigrationDetail;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.math.BigDecimal;

@Component
@Slf4j
public class ImmigrationDetailsValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return ImmigrationDetail.class.equals(clazz);
    }

    /*
     *   This validate() method checks for all the validations related to Immigration Details.
     */
    @Override
    public void validate(Object target, Errors errors) {

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "currentStatus", "NotEmpty.immigration.currentStatus");

        ImmigrationDetail immigrationDetail = (ImmigrationDetail) target;

        BigDecimal currentWage = immigrationDetail.getCurrentWage();
        if (currentWage.compareTo(BigDecimal.ZERO) == 0) {
            errors.rejectValue("currentWage", "NotEmpty.immigration.currentWage");
        } else {
            if (currentWage.compareTo(BigDecimal.valueOf(40000)) < 0
                    || currentWage.compareTo(BigDecimal.valueOf(300000)) > 0) {
                errors.rejectValue("currentWage", "NotValid.immigration.currentWage");
            }
        }

        if (immigrationDetail.getStartDate() == null) {
            errors.rejectValue("startDate", "NotEmpty.immigration.startDate");
        }

        if (immigrationDetail.getEndDate() == null) {
            errors.rejectValue("endDate", "NotEmpty.immigration.endDate");
        }

    }

}
