$(document).ready(function () {
    fetchData();
    $('#viewTimesheetDiv').hide();
    /*  Submit form using Ajax */
    $('button[type=submit]').click(function (e) {
        fetchData(e);
    });
});

/**
 * Retrieve Timesheet Summary Data from the database and populate the datatable with corresponding columns.
 * @param fromDate
 * @param toDate
 * @param status
 */
function fetchData(event) {
    if (event) {
        event.preventDefault();
    }

    var fromDate = $('#selectFromDate').val();
    var toDate = $('#selectToDate').val();
    var status = $('#selectStatus').val();
    console.log("Inside setSummaryTable:: fromDate: " + fromDate + " toDate: " + toDate + " status: " + status);

    if ($.fn.dataTable.isDataTable('#timesheetSummary')) {
        // Table Already Exists - dispose it and recreate.
        var table = $('#timesheetSummary').DataTable();
        table.destroy();
    }

    var table = $('#timesheetSummary').DataTable({
        ajax: {
            url: '/employeeManagement/api/timesheetSummaryStaff?fromDate=' + fromDate
            + '&toDate=' + toDate + '&timesheetStatus=' + status,
            dataSrc: ''
        },
        dom: 'lBfrtip',
        buttons: [
            'excel'
        ],
        columns: [
            {
                data: 'employeeName'
            },
            {
                data: 'clientName'
            },
            {
                data: 'fromDate',
                mRender: function (data) {
                    return moment(data).format("MM/DD/YYYY");
                }
            },
            {
                data: 'toDate',
                mRender: function (data) {
                    return moment(data).format("MM/DD/YYYY");
                }
            },
            {
                data: 'regularHours'
            },
            {
                data: 'extraHours'
            },
            {
                data: 'timesheetStatus'
            },
            {
                data: 'timesheetId',
                mRender: function (data, type, row) {
                    var link = '';
                    link = '<button class="btn-link" onclick="getTimesheetInfoById(' + data + ', false)">View</button>';
                    return link;
                }
            }
        ],
        order: [[2, 'desc'], [3, 'desc'], [0, 'desc']]
    })
}

/**
 * Retrieve Timesheet information based on given TimesheetId and populate the View Timesheet fields on the dashboard page.
 * @param timesheetId
 */
function getTimesheetInfoById(timesheetId, confirmMessageFlag) {
    console.log("Inside getTimesheet method:: timesheetId: " + timesheetId);
    $.ajax({
        type: 'GET',
        url: '/employeeManagement/api/getTimesheetById?timesheetId=' + timesheetId,
        success: function (responsedata) {
            console.log("Inside success function after getting the timesheet info.");
            populateViewTimesheet(responsedata, confirmMessageFlag);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(textStatus, errorThrown);
            console.log(jqXHR);
        }
    });
}

/**
 * Populates the Timesheet Information into the View Timesheet fields from the returned timesheetObj.
 * @param timesheetObj
 */
function populateViewTimesheet(timesheetObj, confirmMessageFlag) {
    $('#viewTimesheetDiv').show();
    console.log("Inside populateViewTimesheet method ::");
    $('#selectedTimesheetId').val(timesheetObj.timesheetId);
    $('#reviewerComments').val(timesheetObj.reviewerComments != null ? timesheetObj.reviewerComments : '');
    //Populating the HTML content
    $('#selectedTimePeriod').html(moment(timesheetObj.fromDate).format("MM/DD/YYYY") + ' - '
        + moment(timesheetObj.toDate).format("MM/DD/YYYY"));
    $('#timesheetStatus').html(timesheetObj.timesheetStatus);
    $('#employeeName').html(timesheetObj.employeeName);
    $('#employeeTitle').html(); //TODO put in the information for Employee Title.
    $('#clientName').html(timesheetObj.clientName);
    $('#regularHours').html(timesheetObj.regularHours != null ? timesheetObj.regularHours : 0.0);
    $('#extraHours').html(timesheetObj.extraHours != null ? timesheetObj.extraHours : 0.0);
    $('#totalHours').html(timesheetObj.regularHours + timesheetObj.extraHours);
    $('#submitterName').html(timesheetObj.nameCreated);
    $('#submittedDate').html(timesheetObj.dateCreated != null ?
        moment(timesheetObj.dateCreated).format("MM/DD/YYYY hh:mm a") : '');
    $('#approvalDate').html(timesheetObj.dateApproved != null ?
        moment(timesheetObj.dateApproved).format("MM/DD/YYYY hh:mm a") : '');
    $('#timesheetComments').html(timesheetObj.dscComments);
    $('#uploadedTimesheetName').html(timesheetObj.dscFileName);
    $('#uploadTimesheetLink').attr('href', '/employeeManagement/api/getUploadedTimesheet?timesheetId=' + timesheetObj.timesheetId);
    /*Remove any existing info from the alerts, if the confirm message Flag is not true*/
    if (!confirmMessageFlag) {
        $('#alertMsg').html('');
        $('#alertSubDiv').removeClass('alert-success');
        $('#alertSubDiv').removeClass('alert-danger');
        $('#alertDiv').hide();
    }
}

/**
 * Approves the timesheet based on the Timesheet ID and display a confirmation message.
 * @returns {boolean}
 */
function approveTimesheet() {
    var timesheetId = $('#selectedTimesheetId').val();
    var reviewerName = $('#loggedEmployeeName').val();
    var reviewComments = $('#reviewerComments').val();
    console.log("Inside approveTimesheet method of dashboard-staff js file:: timesheetId: " + timesheetId
        + " reviewerName=" + reviewerName + " reviewComments=" + reviewComments);
    $.ajax({
        type: 'GET',
        url: '/employeeManagement/api/approveTimesheet?timesheetId=' + timesheetId
        + '&reviewerName=' + reviewerName + '&reviewComments=' + reviewComments,
        success: function (responsedata) {
            console.log("Inside success function of Approve Timesheet.");
            getTimesheetInfoById(timesheetId, true); //To reload the View Timesheet information.
            fetchData();
            $('#successModal').modal('show');
            $('#alertDiv').show();
            $('#alertSubDiv').addClass(responsedata.responseClass);
            $('#alertMsg').html(responsedata.responseMessage);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(textStatus, errorThrown);
            console.log(jqXHR);
        }
    });

    return false; //To prevent reload of the Dashboard page.
}

/**
 * Disapproves the Timesheet based on the TimsheetID and display a confirmation message.
 * @returns {boolean}
 */
function rejectTimesheet() {
    var timesheetId = $('#selectedTimesheetId').val();
    var reviewerName = $('#loggedEmployeeName').val();
    var reviewComments = $('#reviewerComments').val();
    console.log("Inside rejectTimesheet method of dashboard-staff js file:: timesheetId: " + timesheetId
        + " reviewerName=" + reviewerName + " reviewComments=" + reviewComments);
    //Check if the review Comments is not empty.
    if (!reviewComments) {
        alert("Please enter the Reviewer comments providing the reason for Rejecting the Timesheet.");
        return false; //To prevent reload of the Dashboard page.
    }

    $.ajax({
        type: 'GET',
        url: '/employeeManagement/api/rejectTimesheet?timesheetId=' + timesheetId
        + '&reviewerName=' + reviewerName + '&reviewComments=' + reviewComments,
        success: function (responsedata) {
            console.log("Inside success function of Reject Timesheet.");
            getTimesheetInfoById(timesheetId, true); //To reload the View Timesheet information.
            fetchData();
            $('#rejectionModal').modal('show');
            $('#alertDiv').show();
            $('#alertSubDiv').addClass(responsedata.responseClass);
            $('#alertMsg').html(responsedata.responseMessage);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(textStatus, errorThrown);
            console.log(jqXHR);
        }
    });

    return false; //To prevent reload of the Dashboard page.
}