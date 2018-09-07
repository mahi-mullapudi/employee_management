package com.tutorialq.services;

import com.tutorialq.entities.Employee;
import com.tutorialq.entities.Timesheet;

import java.time.LocalDate;
import java.util.List;

public interface TimesheetService {

    /**
     * Save Timesheet information along with file upload information.
     *
     * @param timesheetObj
     */
    void save(Timesheet timesheetObj) throws Exception;

    /**
     * Returns the list of Timesheets for a given EmployeeId.
     *
     * @param employeeId
     * @return
     * @throws Exception
     */
    List<Timesheet> getTimesheetsByEmpId(long employeeId) throws Exception;

    /**
     * Returns the Timesheet information from the Timesheet table based on the given timesheetId.
     *
     * @param timesheetId
     * @return
     */
    Timesheet getTimesheetByTimesheetId(long timesheetId) throws Exception;

    /**
     * Returns the Timesheet information from the Timesheet table based on the given Timesheet EndDate.
     *
     * @param endDate
     * @return
     */
    Timesheet getTimesheetByEndDate(LocalDate endDate, Employee employee) throws Exception;

    /**
     * Returns the list of Timesheets for a given From Date, To LocalDate and Timesheet Status.
     *
     * @param fromDate
     * @param toDate
     * @param timesheetStatus
     * @return
     * @throws Exception
     */
    List<Timesheet> getTimesheetSummaryStaff(LocalDate fromDate, LocalDate toDate, String timesheetStatus) throws Exception;

    /**
     * Approve the Timesheet based on the given TimesheetId and Reviewer Comments.
     * Also updates other approval LocalDate and audit information.
     *
     * @param timesheetId
     * @throws Exception
     */
    void approveTimesheet(long timesheetId, String reviewerName, String reviewerComments) throws Exception;

    /**
     * Reject the Timesheet based on the given TimesheetId and the reviewer comments.
     * Empty out any Approval information on the Timesheet if exists.
     *
     * @param timesheetId
     * @throws Exception
     */
    void rejectTimesheet(long timesheetId, String reviewerName, String reviewerComments) throws Exception;

}
