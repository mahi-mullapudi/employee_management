$(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip();
    $('.phone_us').mask('(000)000-0000');

    $('.datepicker').datepicker();

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
    });

});

/* Datatable component */
function fetchSummary(clientDetailsSummary) {
    var summaryTitles = [
        {"sTitle": "Client Name", "type": "natural-nohtml", "targets": "0"},
        {"sTitle": "Client Address"},
        {"sTitle": "Contract Period"},
        {"sTitle": "Contract Company"},
        {"sTitle": "Vendor Company"},
        {"sTitle": "Vendor Contact"}
    ];

    var columnDefs = [{"className": "dt-center", "targets": "_all"}];
    console.time("Datatable Creation");
    var dataSet = [];

    if (clientDetailsSummary.length !== 0) {
        $.each(clientDetailsSummary, function (index, clientDetails) {
            var dataRow = [];
            dataRow.push("<a href=\"/employeeManagement/registration/viewEdit?clientDetailsId=" + clientDetails.clientDetailsId
                + "\" target=\"_blank\" class=\"btn btn-link\">" + clientDetails.clientName + "</a>");
            dataRow.push((clientDetails.clientStreet || '') + ' '
                + (clientDetails.clientAddress || '') + ' '
                + (clientDetails.clientCity || '') + ' '
                + (clientDetails.clientState || '')
                + (clientDetails.clientZip));
            dataRow.push((clientDetails.contractStartDate) + ' - ' + (clientDetails.contractEndDate));
            dataRow.push(contractCompany);
            dataRow.push(vendorCompany);
            dataRow.push(vendorContactName);
            dataSet.push(dataRow);
        });
        setSummaryTable(dataSet, summaryTitles, columnDefs);
    } else {
        console.info("No Data Found");
        setSummaryTable(dataSet, summaryTitles, columnDefs);
    }
    console.timeEnd("Datatable Creation");
}

//Datatable creation
function setSummaryTable(summaryData, titleData, columndef) {
    if ($.fn.dataTable.isDataTable('#clientDetailsSummary')) {
        // Table Already Exists - dispose it and recreate.
        var table = $('#clientDetailsSummary').DataTable();
        table.destroy();
    }
    var dataTable;
    dataTable = $('#clientDetailsSummary').DataTable({
        buttons: ['pdf', 'excel'],
        aaSorting: [],
        columnDefs: columndef,
        fixedColumns: true,
        data: summaryData,
        dom: 'lBfrtip',
        aoColumns: titleData
    });
}