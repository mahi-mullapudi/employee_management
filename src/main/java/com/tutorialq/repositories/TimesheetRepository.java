package com.tutorialq.repositories;

import com.tutorialq.entities.Employee;
import com.tutorialq.entities.Timesheet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;

@Transactional(readOnly = true)
public interface TimesheetRepository extends JpaRepository<Timesheet, Long> {

    public List<Timesheet> findByEmployeeEmployeeId(long employeeId);

    /**
     * Returns the Timesheet information based on the given End Date of the week.
     *
     * @param endDate
     * @return
     */
    public Timesheet findTimesheetByToDateAndEmployee(LocalDate endDate, Employee employee);

    /**
     * Returns the list of Timesheets based on the Start Date and End Date.
     *
     * @param fromDate
     * @param toDate
     * @return
     */
    public List<Timesheet> findTimesheetsByFromDateGreaterThanEqualAndToDateLessThanEqual(LocalDate fromDate, LocalDate toDate);

    /**
     * Returns the list of Timesheets based on the Start Date, End Date and Timesheet Status.
     *
     * @param fromDate
     * @param toDate
     * @param timesheetStatus
     * @return
     */
    public List<Timesheet> findTimesheetsByFromDateGreaterThanEqualAndToDateLessThanEqualAndTimesheetStatus
    (LocalDate fromDate, LocalDate toDate, String timesheetStatus);
}
