package com.tutorialq.web.restControllers;

import com.tutorialq.constants.ApplicationConstants;
import com.tutorialq.entities.Employee;
import com.tutorialq.entities.Timesheet;
import com.tutorialq.models.RestResponseEntity;
import com.tutorialq.services.EmailService;
import com.tutorialq.services.EmployeeService;
import com.tutorialq.services.TimesheetService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api")
@Slf4j
public class TimesheetRestController {

    @Autowired
    RestResponseEntity restResponseEntity;

    @Autowired
    EmployeeService employeeService;

    @Autowired
    TimesheetService timesheetService;

    @Autowired
    EmailService emailService;

    /**
     * Get the file from the database TIMESHEET table and then
     * covert it to a stream and display it to the user.
     *
     * @param timesheetId
     * @return
     */
    @GetMapping("/getUploadedTimesheet")
    public ResponseEntity getContractDocument(@RequestParam("timesheetId") long timesheetId) {
        log.info("Inside getContractDocument method of TimesheetRestController:: timesheetId: " + timesheetId);
        byte[] doc = null;
        HttpHeaders header = null;
        try {
            Timesheet timesheetObj = timesheetService.getTimesheetByTimesheetId(timesheetId);
            log.info("After getting the timesheetObj");
            if (timesheetObj != null) {
                doc = timesheetObj.getBlobContent();
                String extn = FilenameUtils.getExtension(timesheetObj.getDscFileName()).toLowerCase();
                log.info("File Extension: " + extn);
                String mimeType = ApplicationConstants.TIMESHEET_FILE_EXTENSION_MAP.get(extn);
                if (StringUtils.isEmpty(mimeType) || StringUtils.isBlank(mimeType)) {
                    mimeType = MediaType.APPLICATION_OCTET_STREAM_VALUE;    //Unknown file type - defaulting to stream
                }
                log.info("Mime type detected is : " + mimeType + " for the file extn: " + extn);
                header = new HttpHeaders();
                header.setContentType(MediaType.valueOf(mimeType));
                header.set("Content-Disposition", "inline; filename = " + timesheetObj.getDscFileName());
                header.setContentLength(doc.length);
            } else {
                log.error("No Timesheet found for the given timesheetId.");
                return new ResponseEntity(doc, header, HttpStatus.NO_CONTENT);
            }
        } catch (Exception ex) {
            log.error("Exception while retrieving document " + ex);
        }
        if (doc == null || doc.length == 0) {
            return new ResponseEntity(doc, header, HttpStatus.NO_CONTENT);
        }

        return new ResponseEntity(doc, header, HttpStatus.OK);
    }

    /**
     * Returns the list of Timesheet summary for a given EmployeeId.
     *
     * @param employeeId
     * @return
     */
    @GetMapping("/timesheetSummary")
    public ResponseEntity<List<Timesheet>> getTimesheetSummary(@RequestParam("employeeId") long employeeId) {
        log.info("Inside getTimesheetSummary method of TimesheetRestController:: employeeId: " + employeeId);
        try {
            List<Timesheet> timesheetList = timesheetService.getTimesheetsByEmpId(employeeId);
            return new ResponseEntity(timesheetList, new HttpHeaders(), HttpStatus.OK);
        } catch (Exception ex) {
            log.error("Exception while getting Timesheet Summary: " + ex);
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
    }

    /**
     * Returns Timesheet object for a given Timesheet Id.
     *
     * @param timesheetId
     * @return
     * @throws Exception
     */
    @GetMapping(value = "/getTimesheetById")
    public ResponseEntity<Timesheet> getTimesheetByTimesheetId(@RequestParam("timesheetId") long timesheetId) throws Exception {
        log.info("Inside getTimesheetByTimesheetId method of TimesheetRestController:: timesheetId: " + timesheetId);
        try {
            Timesheet timesheet = timesheetService.getTimesheetByTimesheetId(timesheetId);
            return new ResponseEntity(timesheet, new HttpHeaders(), HttpStatus.OK);
        } catch (Exception ex) {
            log.error("Exception while getting Timesheet By TimesheetId: " + ex);
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
    }

    /**
     * Returns Timesheet object for a given End Date of the timesheet.
     *
     * @param endDate
     * @return
     * @throws Exception
     */
    @GetMapping(value = "/getTimesheetByEndDate")
    public ResponseEntity<Timesheet> getTimesheetByEndDate(
            @RequestParam("endDate") @DateTimeFormat(pattern = "MM/dd/yyyy") LocalDate endDate,
            @RequestParam("employeeId") long employeeId)
            throws Exception {
        log.info("Inside getTimesheetByEndDate method of TimesheetRestController:: endDate: " + endDate
                + "employeeId: " + employeeId);
        try {
            Employee employeeObj = employeeService.getEmployeeById(employeeId);
            Timesheet timesheet = timesheetService.getTimesheetByEndDate(endDate, employeeObj);
            return new ResponseEntity(timesheet, new HttpHeaders(), HttpStatus.OK);
        } catch (Exception ex) {
            log.error("Exception while getting Timesheet By EndDate: " + ex);
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
    }

    /**
     * Returns the Timesheet Summary for the Internal Staff for review based on the given Search criteria..
     *
     * @param fromDate
     * @param toDate
     * @param timesheetStatus
     * @return
     * @throws Exception
     */
    @GetMapping("/timesheetSummaryStaff")
    public ResponseEntity<Timesheet> getTimesheetSummaryStaff(
            @RequestParam("fromDate") @DateTimeFormat(pattern = "MM/dd/yyyy") LocalDate fromDate,
            @RequestParam("toDate") @DateTimeFormat(pattern = "MM/dd/yyyy") LocalDate toDate,
            @RequestParam("timesheetStatus") String timesheetStatus) throws Exception {
        log.info("Inside getTimesheetSummaryStaff method of Timesheet Rest Controller:: fromDate: " + fromDate +
                " toDate: " + toDate + " timesheetStatus: " + timesheetStatus);
        try {
            List<Timesheet> timesheetList = timesheetService.getTimesheetSummaryStaff(fromDate, toDate, timesheetStatus);
            return new ResponseEntity(timesheetList, new HttpHeaders(), HttpStatus.OK);
        } catch (Exception ex) {
            log.error("Exception while getting Timesheet Summary for Staff: " + ex);
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
    }

    /**
     * Approve the Timesheet by updating the Timesheet status to APPROVED along with Review Comments.
     *
     * @param timesheetId
     * @param reviewerName
     * @param reviewComments
     * @return
     * @throws Exception
     */
    @GetMapping("/approveTimesheet")
    public ResponseEntity<RestResponseEntity> approveTimesheet(
            @RequestParam("timesheetId") long timesheetId, @RequestParam("reviewerName") String reviewerName,
            @RequestParam("reviewComments") String reviewComments)
            throws Exception {
        log.info("Inside approveTimesheet method of TimesheetRestController:: timesheetId: " + timesheetId
                + "reviewerName: " + reviewerName + " reviewComments: " + reviewComments);
        try {
            Timesheet timesheetObj = timesheetService.getTimesheetByTimesheetId(timesheetId);
            Employee employeeObj = timesheetObj.getEmployee();
            timesheetService.approveTimesheet(timesheetId, reviewerName, reviewComments);
            emailService.sendPlainTextMailWithoutAttachment(
                    ApplicationConstants.fromAddress, employeeObj.getEmployeeEmailId(), "",
                    "Timesheet APPROVED for " + timesheetObj.getFromDate()
                            + " to " + timesheetObj.getToDate(),
                    "Your timesheet for the period: " + timesheetObj.getFromDate()
                            + " to " + timesheetObj.getToDate() + " is APPROVED successfully. ");
            restResponseEntity = new RestResponseEntity(ApplicationConstants.REST_RESPONSE_CODE_SUCCESS,
                    "Selected Timesheet Approved Successfully!!", "alert-success");
        } catch (Exception ex) {
            log.error("Exception while Approving Timesheet: " + ex);
            restResponseEntity = new RestResponseEntity(ApplicationConstants.REST_RESPONSE_CODE_ERROR,
                    "Exception while Approving the timesheet. Please contact Admin for help.",
                    "alert-danger");
        }
        //Return response entity object with Status ok even for the error.
        return new ResponseEntity(restResponseEntity, new HttpHeaders(), HttpStatus.OK);
    }

    /**
     * Disapprove the Timesheet by updating the Timesheet status to REJECTED along with Review Comments.
     *
     * @param timesheetId
     * @param reviewerName
     * @param reviewComments
     * @return
     * @throws Exception
     */
    @GetMapping("/rejectTimesheet")
    public ResponseEntity<RestResponseEntity> rejectTimesheet(
            @RequestParam("timesheetId") long timesheetId,
            @RequestParam("reviewerName") String reviewerName,
            @RequestParam("reviewComments") String reviewComments)
            throws Exception {
        log.info("Inside rejectTimesheet method of TimesheetRestController:: timesheetId: " + timesheetId
                + "reviewerName: " + reviewerName + " reviewComments: " + reviewComments);
        try {
            Timesheet timesheetObj = timesheetService.getTimesheetByTimesheetId(timesheetId);
            Employee employeeObj = timesheetObj.getEmployee();
            timesheetService.rejectTimesheet(timesheetId, reviewerName, reviewComments);
            emailService.sendPlainTextMailWithoutAttachment(
                    ApplicationConstants.fromAddress, employeeObj.getEmployeeEmailId(), "",
                    "Timesheet REJECTED for " + timesheetObj.getFromDate()
                            + " to " + timesheetObj.getToDate(),
                    "Your timesheet for the period: " + timesheetObj.getFromDate()
                            + " to " + timesheetObj.getToDate() + " is REJECTED because of: "
                            + timesheetObj.getReviewerComments()
                            + ". Please correct your timesheet and re-submit again.");
            restResponseEntity = new RestResponseEntity(ApplicationConstants.REST_RESPONSE_CODE_SUCCESS,
                    "Selected Timesheet Disapproved Successfully", "alert-success");
        } catch (Exception ex) {
            log.error("Exception while rejecting the Timesheet: " + ex);
            restResponseEntity = new RestResponseEntity(ApplicationConstants.REST_RESPONSE_CODE_ERROR,
                    "Exception while Disapproving the timesheet. Please contact Admin for help.",
                    "alert-danger");
        }
        //Return response entity object with Status ok even for the error.
        return new ResponseEntity(restResponseEntity, new HttpHeaders(), HttpStatus.OK);
    }

}
