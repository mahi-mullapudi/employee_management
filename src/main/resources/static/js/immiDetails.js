$(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip();
    //$('.phone_us').mask('(000)000-0000');

    fetchImmigrationDetails();
});

function hideImmiDiv(showFlag) {
    if (!showFlag) $('#viewImmigrationDetailsDiv').hide();
}

/**
 * Retrieve Immigration Details Summary from the database and populate the datatable with corresponding columns.
 *
 */
function fetchImmigrationDetails() {

    var empId = $('#employeeId').val();

    if ($.fn.dataTable.isDataTable('#immigrationDetailsSummary')) {
        // Table Already Exists - dispose it and recreate.
        var table = $('#immigrationDetailsSummary').DataTable();
        table.destroy();
    }

    var table = $('#immigrationDetailsSummary').DataTable({
        ajax: {
            url: '/employeeManagement/api/immigrationDetails?empId=' + empId,
            dataSrc: ''
        },
        dom: 'lBfrtip',
        buttons: [
            'excel'
        ],
        columns: [
            {
                data: 'currentStatus'
            },
            {
                data: 'receiptNumber'
            },
            {
                data: 'startDate',
                mRender: function (data) {
                    return moment(data).format("MM/DD/YYYY");
                }
            },
            {
                data: 'endDate',
                mRender: function (data) {
                    return moment(data).format("MM/DD/YYYY");
                }
            },
            {
                data: 'immiDetailsId',
                mRender: function (data, type, row) {
                    var link = '<button class="btn-link" onclick="getImmigrationDetailById(' + data + ', false)">View</button>';
                    return link;
                }
            }
        ],
        order: [[0, 'desc'], [2, 'desc']]
    })
}

/**
 * Retrieve Immigration Details information based on given immigrationDetailId and populate the Immigration Details on Immigration Details page.
 * @param immigrationDetailId
 */
function getImmigrationDetailById(immigrationDetailId) {
    console.log("Inside getImmigrationDetailById method:: immigrationDetailId: " + immigrationDetailId);
    $.ajax({
        type: 'GET',
        url: '/employeeManagement/api/immigrationDetailById?immigrationDetailId=' + immigrationDetailId,
        success: function (responsedata) {
            console.log("Inside success function after getting the Immigration Details information.");
            populateImmigrationDetails(responsedata);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(textStatus, errorThrown);
            console.log(jqXHR);
        }
    });
}

/**
 * Populates the Immigration Detail Information into the View Immigration Detail fields from the returned immigrationDetailObj.
 * @param immigrationDetailObj
 */
function populateImmigrationDetails(immigrationDetailObj) {
    $('#viewImmigrationDetailsDiv').show();
    console.log("Inside populate Client Detail method ::");
    $('#immiDetailsId').val(immigrationDetailObj.immiDetailsId);
    $('#currentStatus').val(immigrationDetailObj.currentStatus);
    $('#receiptNumber').val(immigrationDetailObj.receiptNumber);
    $('#lcaNumber').val(immigrationDetailObj.lcaNumber);
    $('#currentWage').val(immigrationDetailObj.currentWage);
    $('#startDate').val(moment(immigrationDetailObj.startDate).format("MM/DD/YYYY"));
    $('#endDate').val(moment(immigrationDetailObj.endDate).format("MM/DD/YYYY"));
}

/**
 * Add Immigration Details by clearing the existing Immigration information.
 */
function addImmigrationDetails() {
    $('#viewImmigrationDetailsDiv').show();
    $('#immiDetailsId').val(0);
    $('#currentStatus').val('');
    $('#receiptNumber').val('');
    $('#lcaNumber').val('');
    $('#currentWage').val(0.0);
    $('#startDate').val('');
    $('#endDate').val('');
}