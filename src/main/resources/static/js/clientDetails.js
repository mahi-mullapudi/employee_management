$(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip();
    //$('.phone_us').mask('(000)000-0000');

    fetchClientData();

    /*$('.datepicker').datepicker();
    $('.date_format').datetimepicker({
        sideBySide: true, keepOpen: false, useCurrent: false, format: 'MM/DD/YYYY',
        icons: {
            time: 'fa fa-time',
            date: 'fa fa-calendar',
            up: 'fa fa-chevron-up',
            down: 'fa fa-chevron-down',
            previous: 'fa fa-chevron-left',
            next: 'fa fa-chevron-right'
        }
    });*/
});

function hideClientDetailsDiv(showFlag) {
    if (!showFlag) $('#viewClientDetailsDiv').hide();
}

/**
 * Retrieve Client Details Summary from the database and populate the datatable with corresponding columns.
 *
 */
function fetchClientData() {

    var empId = $('#employeeId').val();

    if ($.fn.dataTable.isDataTable('#clientDetailsSummary')) {
        // Table Already Exists - dispose it and recreate.
        var table = $('#clientDetailsSummary').DataTable();
        table.destroy();
    }

    var table = $('#clientDetailsSummary').DataTable({
        ajax: {
            url: '/employeeManagement/api/clientDetailsSummary?empId=' + empId,
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
                    link = '<button class="btn-link" onclick="getClientDetailById(' + data + ', false)">View</button>';
                    return link;
                }
            }
        ],
        order: [[0, 'desc'], [2, 'desc']]
    })
}

/**
 * Retrieve Client Details information based on given clientDetailsId and populate the View Client Details fields on the Client Details page.
 * @param clientDetailsId
 */
function getClientDetailById(clientDetailsId) {
    console.log("Inside getClientDetailById method:: clientDetailsId: " + clientDetailsId);
    $.ajax({
        type: 'GET',
        url: '/employeeManagement/api/clientDetailById?clientDetailsId=' + clientDetailsId,
        success: function (responsedata) {
            console.log("Inside success function after getting the Client Details information.");
            populateClientDetail(responsedata);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(textStatus, errorThrown);
            console.log(jqXHR);
        }
    });
}

/**
 * Populates the Client Detail Information into the View Client Detail fields from the returned clientDetailObj.
 * @param clientDetailObj
 */
function populateClientDetail(clientDetailObj) {
    $('#viewClientDetailsDiv').show();
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

/**
 * Add Immigration Details by clearing the existing Immigration information.
 */
function addClientDetails() {
    $('#viewClientDetailsDiv').show();
    $('#clientDetailsId').val(0);
    $('#clientName').val('');
    $('#clientStreet').val('');
    $('#clientCity').val('');
    $('#clientState').val('');
    $('#clientZip').val('');
    $('#contractCompany').val('');
    $('#vendorCompany').val('');
    $('#contractStartDate').val('');
    $('#contractEndDate').val('');
    $('#vendorContactName').val('');
    $('#vendorPhone').val('');
    $('#vendorEmail').val('');
    $('#paymentTerms').val('');
    $('#invoiceContactName').val('');
    $('#invoiceContactPhone').val('');
    $('#invoiceContactEmail').val('');
    $('#invoiceFrequency').val('');
    $('#comments').val('');
}