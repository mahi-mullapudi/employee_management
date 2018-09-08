$(document).ready(function () {
    //To activate Tooltip for this page
    $('[data-toggle="tooltip"]').tooltip();
    getTimesheetDetails();
    //On successful submit display the Modal
    if ($('#summarymodalDisplayFlag').val() === 'yes') {
        $('#successModal').modal('show');
    }
});

/**
 * Get the Timesheet Information and populate the fields based on the information.
 */
function getTimesheetDetails() {
    var endDate = $('#selectTimePeriod').val();
    var employeeId = $('#employeeId').val();
    console.log("Selected End Date: " + endDate);
    $.ajax({
        type: 'GET',
        url: '/employeeManagement/api/getTimesheetByEndDate?endDate=' + endDate + "&employeeId=" + employeeId,
        success: function (responsedata) {
            console.log("Inside success function after getting the timesheet info.");
            //Callback to avoid asynchronous calls.
            populateTimesheetInfo(responsedata);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(textStatus, errorThrown);
            console.log(jqXHR);
        }
    });
}

/**
 * Populate the Timesheet information into the fields.
 * @param timesheetObj
 */
function populateTimesheetInfo(timesheetObj) {
    //Populate the HTML information.
    $('#timesheetStatus').html(timesheetObj.timesheetStatus != null ? timesheetObj.timesheetStatus : '');
    $('#submitterName').html(timesheetObj.nameCreated !== null ? timesheetObj.nameCreated : '');
    $('#submittedDate').html(timesheetObj.dateSubmitted !== null ? moment(timesheetObj.dateSubmitted).format("MM/DD/YYYY hh:mm a") : '');
    $('#approverName').html(timesheetObj.nameApproved !== null ? timesheetObj.nameApproved : '');
    $('#approvalDate').html(timesheetObj.dateApproved !== null ? moment(timesheetObj.dateApproved).format("MM/DD/YYYY hh:mm a") : '');
    //Populate the input values.
    $('#timesheetId').val(timesheetObj.timesheetId != null ? timesheetObj.timesheetId : 0);
    $('#regularHoursText').val(timesheetObj.regularHours !== null ? timesheetObj.regularHours : 0.0);
    $('#extraHoursText').val(timesheetObj.extraHours !== null ? timesheetObj.extraHours : 0.0);
    $('#dscCommentsText').val(timesheetObj.dscComments !== null ? timesheetObj.dscComments : '');
    //Timesheet Upload Information
    $('#uploadedTimesheetName').html(timesheetObj.dscFileName !== null ? timesheetObj.dscFileName : '');
    $('#uploadTimesheetLink').attr('href', timesheetObj.timesheetId !== null ?
        ('/employeeManagement/api/getUploadedTimesheet?timesheetId=' + timesheetObj.timesheetId) : '#');
    //Call the function to Show/Hide the sections based on the status
    showHideAuditInfoBasedOnStatus(timesheetObj.timesheetStatus);
}

/**
 * Show or Hide Audit information for Submission, Approval and Rejection status and also enable or disable the input elements.
 * @param timesheetStatus
 */
function showHideAuditInfoBasedOnStatus(timesheetStatus) {
    //Check Timesheet Status and change the Display configurations based on the Status.
    console.log('Timesheet Status: ' + timesheetStatus);
    if (timesheetStatus === 'SUBMITTED' || timesheetStatus === 'REJECTED') {
        enableComponents();
        $('#submissionInfoDiv').show();
        $('#uploadedTimesheet').show();
        $('#approvalInfoDiv').hide();
    } else if (timesheetStatus === 'APPROVED') {
        disableComponents();
        $('#submissionInfoDiv').show();
        $('#uploadedTimesheet').show();
        $('#approvalInfoDiv').show();
    } else {
        $('#submissionInfoDiv').hide();
        $('#approvalInfoDiv').hide();
        $('#uploadedTimesheet').hide();
        enableComponents();
    }
}

/**
 * Disable the form fields and other form components.
 */
function disableComponents() {
    $('#addTimesheetForm').find('input, textarea, datepicker').prop('readonly', true);
    $('#addTimesheetForm').find('input, textarea, checkbox, datepicker').prop('disabled', true);
}

/**
 * Enable the form fields and other form components by removing the readonly and disabled attributes.
 */
function enableComponents() {
    $('#addTimesheetForm').find('input, textarea, datepicker').prop('readonly', false);
    $('#addTimesheetForm').find('input, textarea, checkbox, datepicker').prop('disabled', false);
}