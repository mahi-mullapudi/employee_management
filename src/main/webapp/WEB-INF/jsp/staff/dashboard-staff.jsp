<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="images/favicon.ico">
    <title>Employee Management App Home</title>
    <!-- Bootstrap core CSS -->
    <link href="./css/external/bootstrap.min.css" rel="stylesheet">
    <link href="./css/external/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css">
    <link href="./css/external/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
    <link href="./css/external/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
    <!--Fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">
    <!-- Icons -->
    <link href="./css/external/font-awesome.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="./css/style.css" rel="stylesheet">
</head>

<body>
<div class="container-fluid" id="wrapper">
    <div class="row">
        <jsp:include page="../sideNavbar.jsp"/>
        <main class="col-xs-12 col-sm-8 offset-sm-4 col-lg-9 offset-lg-3 col-xl-10 offset-xl-2 pt-3 pl-4">
            <header class="page-header row justify-center">
                <div class="col-md-6 col-lg-8">
                    <h1 class="float-left text-center text-md-left">Dashboard</h1>
                </div>

                <div class="dropdown user-dropdown col-md-6 col-lg-4 text-center text-md-right">
                    <a class="btn btn-stripped dropdown-toggle" href="https://example.com" id="dropdownMenuLink"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img src="images/profile-pic.png" alt="profile photo" class="circle float-left profile-photo"
                             width="50" height="auto">

                        <div class="username mt-1">
                            <h4 class="mb-1">${user.employeeFirstName} ${user.employeeFirstName}</h4>
                            <h6 class="text-muted">${user.employeeRoleDesc}</h6>
                        </div>
                    </a>

                    <div class="dropdown-menu dropdown-menu-right" style="margin-right: 1.5rem;"
                         aria-labelledby="dropdownMenuLink">
                        <a class="dropdown-item" href="/employeeManagement/settings">
                            <em class="fa fa-sliders mr-1"></em>
                            Settings
                        </a>
                        <a class="dropdown-item" href="/employeeManagement/logout">
                            <em class="fa fa-power-off mr-1"></em>
                            Logout
                        </a>
                    </div>
                </div>

                <div class="clear"></div>
            </header>
            <section class="row">
                <div class="col-sm-12">
                    <section class="row">
                        <div class="col-md-12">

                            <div class="card mb-4" id="viewTimesheetDiv">
                                <div class="card-block">
                                    <h3 class="card-title mb-4">View Timesheet</h3>
                                    <hr>

                                    <div class="col-md-12" id="alertDiv">
                                        <div class="alert alert-dismissible" id="alertSubDiv" role="alert">
                                            <button type="button" class="close" data-dismiss="alert"
                                                    aria-label="Close">
                                                <span aria-hidden="true">X</span>
                                            </button>
                                            <i class="fa fa-info-circle faa-flash animated"></i>
                                            <strong> <span id="alertMsg"></span></strong>
                                        </div>
                                    </div>

                                    <form>

                                        <input type="hidden" id="loggedEmployeeId" value="${user.employeeId}">
                                        <input type="hidden" id="loggedEmployeeName" value="${user.employeeFullName}">
                                        <input type="hidden" id="selectedTimesheetId">

                                        <div class="form-group row">
                                            <label for="selectedTimePeriod" class="col-lg-2 form-control-label">
                                                Selected TimePeriod :
                                            </label>

                                            <div class="col-lg-6">
                                                <span id="selectedTimePeriod"></span>
                                            </div>

                                            <label class="col-lg-2 form-control-label">Status : </label>
                                            <div class="col-lg-2">
                                                <span id="timesheetStatus"></span>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-lg-2 form-control-label">
                                                Employee Name:
                                            </label>
                                            <div class="col-lg-2">
                                                <span id="employeeName"></span>
                                            </div>

                                            <label class="col-lg-2 form-control-label">
                                                Employee Title:
                                            </label>
                                            <div class="col-lg-2">
                                                <span id="employeeTitle"></span>
                                            </div>

                                            <label class="col-lg-2 form-control-label">
                                                Client Name:
                                            </label>
                                            <div class="col-lg-2">
                                                <span id="clientName"></span>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-lg-2 form-control-label">Regular
                                                Hours : </label>
                                            <div class="col-lg-2">
                                                <span id="regularHours"></span>
                                            </div>

                                            <label class="col-lg-2 form-control-label">Extra
                                                Hours : </label>
                                            <div class="col-lg-2">
                                                <span id="extraHours"></span>
                                            </div>

                                            <label class="col-lg-2 form-control-label">Total
                                                Hours : </label>
                                            <div class="col-lg-2">
                                                <span id="totalHours"></span>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-lg-2 form-control-label">Submitted By : </label>
                                            <div class="col-lg-2">
                                                <span id="submitterName"></span>
                                            </div>

                                            <label class="col-lg-2 form-control-label">Submitted On : </label>
                                            <div class="col-lg-2">
                                                <span id="submittedDate"></span>
                                            </div>

                                            <label class="col-lg-2 form-control-label">Approved On : </label>
                                            <div class="col-lg-2">
                                                <span id="approvalDate"></span>
                                            </div>
                                        </div>
                                        <br>

                                        <div class="form-group row" id="uploadedTimesheet">
                                            <a href="" target="_blank" id="uploadTimesheetLink">
                                                Click here to access the uploaded timesheet:
                                                <span id="uploadedTimesheetName"></span>
                                            </a>
                                        </div>
                                        <br>

                                        <div class="form-group row">
                                            <label for="timesheetComments">Employee Comments : </label>
                                            <span id="timesheetComments"></span>
                                        </div>
                                        <br>

                                        <div class="form-group row">
                                            <label for="timesheetComments">Reviewer Comments : </label>
                                            <textarea class="form-control col-xl-8" id="reviewerComments"
                                                      rows="2">
                                            </textarea>
                                        </div>

                                        <div class="row">
                                            <div class="text-center col-md-6">
                                                <input type="submit" class="btn btn-success"
                                                       value="Approve" onclick="return approveTimesheet()"/>
                                            </div>

                                            <div class="text-center col-md-6">
                                                <input type="submit" class="btn btn-danger"
                                                       value="Reject" onclick="return rejectTimesheet()"/>
                                            </div>
                                        </div>

                                    </form>
                                </div>

                            </div>

                            <div class="card mb-4">
                                <div class="card-block">
                                    <h3 class="card-title">Timesheet Summary</h3>
                                    <hr>

                                    <form:form method="POST" action="dashboard" modelAttribute="dashboardSearch"
                                               id="dashboardForm">

                                        <div class="row">
                                            <spring:bind path="fromDate">
                                                <div class="form-group row col-lg-4 col-md-6 ${status.error ? 'has-danger' : ''}">
                                                    <label for="selectFromDate" class="col-sm-4 col-form-label">
                                                        From Date:
                                                    </label>
                                                    <div class="inputGroupContainer col-sm-8">
                                                        <form:select path="fromDate" items="${weekStartDatesList}"
                                                                     id="selectFromDate"
                                                                     class="form-control ${status.error ? 'form-control-danger' : ''}">
                                                        </form:select>
                                                        <div class="form-control-feedback">
                                                            <form:errors path="fromDate"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </spring:bind>

                                            <spring:bind path="toDate">
                                                <div class="form-group row col-lg-4 col-md-6 ${status.error ? 'has-danger' : ''}">
                                                    <label for="selectToDate" class="col-sm-4 col-form-label">
                                                        From Date:
                                                    </label>
                                                    <div class="inputGroupContainer col-sm-8">
                                                        <form:select path="toDate" items="${weekEndDatesList}"
                                                                     id="selectToDate"
                                                                     class="form-control ${status.error ? 'form-control-danger' : ''}">
                                                        </form:select>
                                                        <div class="form-control-feedback">
                                                            <form:errors path="toDate"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </spring:bind>

                                            <spring:bind path="timesheetStatus">
                                                <div class="form-group row col-lg-4 col-md-6 ${status.error ? 'has-danger' : ''}">
                                                    <label for="selectStatus" class="col-sm-4 col-form-label">
                                                        From Date:
                                                    </label>
                                                    <div class="inputGroupContainer col-sm-8">
                                                        <form:select path="timesheetStatus"
                                                                     items="${timesheetStatusList}"
                                                                     id="selectStatus"
                                                                     class="form-control ${status.error ? 'form-control-danger' : ''}">
                                                        </form:select>
                                                        <div class="form-control-feedback">
                                                            <form:errors path="timesheetStatus"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </spring:bind>

                                        </div>

                                        <div class="text-center">
                                            <button type="submit" class="btn btn-success"
                                                    onclick="return fetchData(event);">Search
                                            </button>
                                        </div>
                                        <br>

                                    </form:form>
                                    <hr>

                                    <div class="table-responsive">
                                        <table id="timesheetSummary" class="table table-striped table-bordered"
                                               cellspacing="0" width="100%">
                                            <thead>
                                            <tr>
                                                <th>Employee Name</th>
                                                <th>Client Name</th>
                                                <th>From Period</th>
                                                <th>To Period</th>
                                                <th>RT Hours</th>
                                                <th>OT Hours</th>
                                                <th>Status</th>
                                                <th>View</th>
                                            </tr>
                                            </thead>

                                            <tfoot>
                                            <tr>
                                                <th>Employee Name</th>
                                                <th>Client Name</th>
                                                <th>From Period</th>
                                                <th>To Period</th>
                                                <th>RT Hours</th>
                                                <th>OT Hours</th>
                                                <th>Status</th>
                                                <th>View</th>
                                            </tr>
                                            </tfoot>

                                        </table>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </section>
                    <section class="row">
                        <div class="col-12 mt-1 mb-4">Copy Right by <a href="http://www.Employee Management App.com/">Employee
                            Management App
                            Inc.,</a></div>
                    </section>
                </div>
            </section>
            <!-- Modal for Forwarding to the Dashboard page after successful Approval of the Timesheet Information -->
            <div id="successModal" class="modal fade" role="dialog" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog" id="my-account">
                    <div class="modal-content">
                        <div class="modal-header bg-success">
                            <h4 class="modal-title"> Success!! </h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <div class="modal-body text-center">
                            <i class="fa fa-check fa-5x" aria-hidden="true"></i>
                            <p> Timesheet Information is APPROVED successfully. </p>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-success" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">CLOSE</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End of Modal -->
            <!-- Modal for Forwarding to the Dashboard page after Rejection of the Timesheet Information -->
            <div id="rejectionModal" class="modal fade" role="dialog" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog" id="reject-div">
                    <div class="modal-content">
                        <div class="modal-header bg-warning">
                            <h4 class="modal-title"> DISAPPROVED!! </h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <div class="modal-body text-center">
                            <i class="fa fa-check fa-5x" aria-hidden="true"></i>
                            <p> The Selected Timesheet Information is REJECTED. </p>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn-warning" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">CLOSE</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End of Modal -->
        </main>
    </div>
</div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="./js/external/jquery-3.2.1.min.js"></script>
<script src="./js/external/tether.min.js"></script>
<script src="./js/external/bootstrap.min.js"></script>
<script src="./js/external/jquery.dataTables.min.js"></script>
<script src="./js/external/dataTables.bootstrap4.min.js"></script>
<script src="./js/external/dataTables.buttons.min.js"></script>
<script src="./js/external/buttons.bootstrap4.min.js"></script>
<script src="./js/external/dataTables.natural.js"></script>
<script src="./js/external/buttons.flash.min.js"></script>
<script src="./js/external/jszip.min.js"></script>
<script src="./js/external/pdfmake.min.js"></script>
<script src="./js/external/vfs_fonts.js"></script>
<script src="./js/external/buttons.html5.min.js"></script>

<script src="./js/external/moment.min.js"></script>
<script src="./js/dashboard-staff.js"></script>

</body>
</html>
