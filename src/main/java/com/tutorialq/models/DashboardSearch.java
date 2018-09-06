package com.tutorialq.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DashboardSearch implements Serializable {
    private long employeeId;
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private LocalDate fromDate;
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private LocalDate toDate;
    private String timesheetStatus;
}
