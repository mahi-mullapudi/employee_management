$(document).ready(function () {
    fetchEmpDetails();
});

/**
 * Retrieve Timesheet Summary Data from the database and populate the datatable with corresponding columns.
 * @param fromDate
 * @param toDate
 * @param status
 */
function fetchEmpDetails() {

    if ($.fn.dataTable.isDataTable('#empDetailsSummaryTable')) {
        // Table Already Exists - dispose it and recreate.
        var table = $('#empDetailsSummaryTable').DataTable();
        table.destroy();
    }

    var table = $('#empDetailsSummaryTable').DataTable({
        ajax: {
            url: '/employeeManagement/api/employeeDetails',
            dataSrc: ''
        },
        dom: 'lBfrtip',
        buttons: [
            'excel'
        ],
        columns: [
            {
                data: 'employeeId'
            },
            {
                data: 'employeeFullName'
            },
            {
                data: 'employeeEmailId',
            },
            {
                data: 'employeePhone',
            },
            {
                data: 'companyName'
            },
            {
                data: 'employeeTitle',
            },
            {
                data: 'employeeId',
                mRender: function (data, type, row) {
                    var link = "<a href=\"/employeeManagement/employeeDetails?empId=" + data + "\" target=\"_blank\" class=\"btn btn-link\">View</a>";
                    return link;
                }
            }
        ],
        order: [[2, 'desc'], [3, 'desc'], [0, 'desc']]
    })
}