package com.tutorialq.models;

import lombok.Data;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.Date;

/**
 * This class maintains the Activity of time sheet for audit purposes.
 */
@Component
@Scope(value = "prototype")
@Data
public class TimesheetActivity implements Serializable {

    private long timesheetActivityId;
    private long timesheetId;
    private Date dateLastModified;
    private long nmeLastModified;
    private String prevStatus; //This refers to the status of the time sheet before modification.
    private String modifiedStatus; //This refers to the status of the time sheet before modification.

    public TimesheetActivity() {
    }

}
