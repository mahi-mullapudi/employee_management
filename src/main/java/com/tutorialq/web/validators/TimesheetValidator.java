package com.tutorialq.web.validators;

import com.tutorialq.entities.Timesheet;
import com.tutorialq.utils.FileNameUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
@Slf4j
public class TimesheetValidator implements Validator {

    @Autowired
    FileNameUtils fileNameUtils;

    @Override
    public boolean supports(Class<?> clazz) {
        return Timesheet.class.equals(clazz);
    }

    /**
     * This validate() method checks for all the validations related to Add Timesheet Information.
     */
    @Override
    public void validate(Object target, Errors errors) {

        Timesheet timesheetObj = (Timesheet) target;
        //Check if the Regular Hours are greater than 40 hours per week
        if (timesheetObj.getRegularHours() > 40) {
            errors.rejectValue("regularHours", "NotValid.timesheet.regularHours");
        }

        if (StringUtils.isBlank(timesheetObj.getDscFileName())) {
            errors.rejectValue("uploadFile", "NotEmpty.timesheet.file");
        }

        if (!fileNameUtils.validFileName(timesheetObj.getDscFileName())) {
            errors.rejectValue("uploadFile", "NotValid.timesheet.file.name");
        }

        if (!fileNameUtils.validFileType(timesheetObj.getDscFileName())) {
            errors.rejectValue("uploadFile", "NotValid.timesheet.file.type");
        }

        if (!fileNameUtils.validFileSize(timesheetObj.getFileSize())) {
            errors.rejectValue("uploadFile", "NotValid.timesheet.file.size");
        }


    }
}
