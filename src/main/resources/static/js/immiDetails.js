$(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip();
    //$('.phone_us').mask('(000)000-0000');

    fetchImmigrationDetails();
    $('#viewImmigrationDetailsDiv').hide();
});

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
                data: 'clientName'
            },
            {
                data: 'clientAddress'
            },
            {
                data: 'contractStartDate',
                mRender: function (data) {
                    return moment(data).format("MM/DD/YYYY");
                }
            },
            {
                data: 'contractEndDate',
                mRender: function (data) {
                    return moment(data).format("MM/DD/YYYY");
                }
            },
            {
                data: 'contractCompany'
            },
            {
                data: 'vendorCompany'
            },
            {
                data: 'vendorContactName'
            },
            {
                data: 'clientDetailsId',
                mRender: function (data, type, row) {
                    var link = '';
                    link = '<button class="btn-link" onclick="getImmigrationDetailById(' + data + ', false)">View</button>';
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
 * @param clientDetailObj
 */
function populateImmigrationDetails(immigrationDetailObj) {
    $('#viewImmigrationDetailsDiv').show();
    console.log("Inside populate Client Detail method ::");
    $('#clientDetailsId').val(clientDetailObj.clientDetailsId);
    $('#clientName').val(clientDetailObj.clientName);
    $('#clientStreet').val(clientDetailObj.clientStreet);
    $('#clientCity').val(clientDetailObj.clientCity);
    $('#clientState').val(clientDetailObj.clientState);
    $('#clientZip').val(clientDetailObj.clientZip);
    $('#contractCompany').val(clientDetailObj.contractCompany);
    $('#vendorCompany').val(clientDetailObj.vendorCompany);
    $('#contractStartDate').val(moment(clientDetailObj.contractStartDate).format("MM/DD/YYYY"));
    $('#contractEndDate').val(moment(clientDetailObj.contractEndDate).format("MM/DD/YYYY"));
    $('#vendorContactName').val(clientDetailObj.vendorContactName);
    $('#vendorPhone').val(clientDetailObj.vendorPhone);
    $('#vendorEmail').val(clientDetailObj.vendorEmail);
    $('#paymentTerms').val(clientDetailObj.paymentTerms);
    $('#invoiceContactName').val(clientDetailObj.invoiceContactName);
    $('#invoiceContactPhone').val(clientDetailObj.invoiceContactPhone);
    $('#invoiceContactEmail').val(clientDetailObj.invoiceContactEmail);
    $('#invoiceFrequency').val(clientDetailObj.invoiceFrequency);
    $('#comments').val(clientDetailObj.comments);
}