package com.tutorialq.repositories;

import com.tutorialq.entities.Employee;
import com.tutorialq.entities.Timesheet;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Transactional(readOnly = true)
public interface TimesheetRepository extends CrudRepository<Timesheet, Long> {

    /**
     * Returns the Timesheet information based on the given End Date of the week.
     *
     * @param endDate
     * @return
     */
    public Timesheet findTimesheetByToDateAndEmployee(Date endDate, Employee employee);

    /**
     * Returns the list of Timesheets based on the Start Date and End Date.
     *
     * @param fromDate
     * @param toDate
     * @return
     */
    public List<Timesheet> findTimesheetsByFromDateGreaterThanEqualAndToDateLessThanEqual(Date fromDate, Date toDate);

    /**
     * Returns the list of Timesheets based on the Start Date, End Date and Timesheet Status.
     *
     * @param fromDate
     * @param toDate
     * @param timesheetStatus
     * @return
     */
    public List<Timesheet> findTimesheetsByFromDateGreaterThanEqualAndToDateLessThanEqualAndTimesheetStatus
    (Date fromDate, Date toDate, String timesheetStatus);
}
