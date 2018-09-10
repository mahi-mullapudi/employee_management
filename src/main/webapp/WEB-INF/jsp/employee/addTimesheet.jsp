<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <meta name="description" content="">

    <meta name="author" content="Mahidhar Mullapudi">

    <link rel="icon" href="images/favicon.ico">

    <title>Employee Management App Add Timesheets</title>

    <link href="./css/external/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" rel="stylesheet">
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
        <!-- Side Navbar -->
        <nav class="sidebar col-xs-12 col-sm-4 col-lg-3 col-xl-2 bg-faded sidebar-style-1">
            <h1 class="site-title">
                <a href="index.html">

                    <img src="./images/company_logo.jpg" class="img-fluid">
                </a>
            </h1>

            <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">
                <em class="fa fa-bars"></em>
            </a>

            <ul class="nav nav-pills flex-column sidebar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="/employeeManagement/dashboard">
                        <em class="fa fa-dashboard"></em> Dashboard

                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" href="/employeeManagement/addTimesheet">
                        <em class="fa fa-calendar-o"></em>
                        Upload Timesheet <span class="sr-only">(current)</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/employeeManagement/reports">
                        <em class="fa fa-bar-chart"></em> Reports
                    </a>
                </li>
            </ul>
        </nav>
        <!-- Main section -->
        <main class="col-xs-12 col-sm-8 offset-sm-4 col-lg-9 offset-lg-3 col-xl-10 offset-xl-2 pt-3 pl-4">
            <!-- Header section -->
            <header class="page-header row justify-center">
                <div class="col-md-6 col-lg-8">
                    <h1 class="float-left text-center text-md-left"> Upload New Timesheet </h1>
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
                        <a class="dropdown-item" href="/employeeManagement/logout"> <em
                                class="fa fa-power-off mr-1"></em>
                            Logout </a>
                    </div>
                </div>

                <div class="clear"></div>
            </header>

            <section class="row">
                <div class="col-md-12">
                    <section class="row">
                        <div class="col-md-12">

                            <c:if test="${not empty msg}">
                                <div class="col-md-12">
                                    <div class="alert alert-${css} alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert"
                                                aria-label="Close">
                                            <span aria-hidden="true">X</span>
                                        </button>
                                        <i class="fa fa-info-circle faa-flash animated"></i><strong> ${msg}</strong>
                                    </div>
                                </div>
                            </c:if>

                            <div class="jumbotron">

                                <h1 class="mb-4">Timesheet Information</h1>

                                <form:form method="POST" modelAttribute="timesheetObj" action="addTimesheet"
                                           enctype="multipart/form-data" id="addTimesheetForm">

                                    <input type="hidden" id="summarymodalDisplayFlag" value="${summarymodal}"/>
                                    <input type="hidden" id="employeeId" value="${user.employeeId}">
                                    <form:hidden id="timesheetId" path="timesheetId"/>

                                    <div class="form-group row">
                                        <label class="col-lg-2 form-control-label">Employee Name </label>
                                        <div class="col-lg-4">
                                            <span> ${user.employeeFirstName} ${user.employeeLastName} </span>
                                        </div>

                                        <label class="col-lg-2 form-control-label">Employee Id </label>
                                        <div class="col-lg-4">
                                            <span> ${user.assignedEmployeeId} </span>
                                        </div>
                                    </div>
                                    <br>

                                    <div class="row">
                                        <spring:bind path="toDate">
                                            <div class="form-group row col-md-6 ${status.error ? 'has-danger' : ''}">
                                                <label for="selectTimePeriod" class="col-lg-4 form-control-label">
                                                    Select Time Period:
                                                </label>
                                                <div class="inputGroupContainer col-lg-8">
                                                    <form:select path="toDate" items="${startEndDatesMap}"
                                                                 class="form-control ${status.error ? 'form-control-danger' : ''}"
                                                                 id="selectTimePeriod"
                                                                 onchange="getTimesheetDetails()">
                                                    </form:select>
                                                    <div class="form-control-feedback">
                                                        <form:errors path="regularHours"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </spring:bind>

                                        <div class="form-group row col-md-6">
                                            <label class="form-control-label col-lg-4"
                                                   for="timesheetStatus">Status: </label>
                                            <span id="timesheetStatus" class="text-right"> ${timesheetStatus} </span>
                                        </div>
                                    </div>

                                    <div class="row">

                                        <spring:bind path="regularHours">
                                            <div class="form-group row col-md-6 ${status.error ? 'has-danger' : ''}">
                                                <label class="form-control-label col-lg-4" for="regularHoursText"
                                                       data-toggle="tooltip"
                                                       data-animation="false" data-placement="bottom"
                                                       title="Enter the total regular hours you worked for the selected week.">
                                                    Regular Hours:
                                                </label>
                                                <div class="inputGroupContainer col-lg-8">
                                                    <form:input path="regularHours"
                                                                name="regularHoursText" id="regularHoursText"
                                                                maxlength="5"
                                                                class="form-control col-lg-12 ${status.error ? 'form-control-danger' : ''}"/>
                                                    <div class="form-control-feedback">
                                                        <form:errors path="regularHours"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </spring:bind>

                                        <spring:bind path="extraHours">
                                            <div class="form-group row col-md-6 ${status.error ? 'has-danger' : ''}">
                                                <label class="form-control-label col-lg-4" for="extraHoursText"
                                                       data-toggle="tooltip"
                                                       data-animation="false" data-placement="bottom"
                                                       title="Please enter the extra hours worked for the selected week.">
                                                    Extra Hours:
                                                </label>
                                                <div class="inputGroupContainer col-lg-8">
                                                    <form:input path="extraHours"
                                                                name="extraHoursText" id="extraHoursText"
                                                                maxlength="5"
                                                                class="form-control col-lg-12 ${status.error ? 'form-control-danger' : ''}"/>
                                                    <div class="form-control-feedback">
                                                        <form:errors path="extraHours"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </spring:bind>

                                    </div>

                                    <p>Please Upload your approved timesheet(pdf/image) for the selected time period</p>

                                    <spring:bind path="uploadFile">
                                        <div class="form-group row col-md-6 ${status.error ? 'has-danger' : ''}">
                                            <div class="inputGroupContainer col-lg-8">
                                                <form:input path="uploadFile"
                                                            type="file" name="file"
                                                            class="form-control-file ${status.error ? 'form-control-danger' : ''}"/>
                                                <div class="form-control-feedback">
                                                    <form:errors path="uploadFile"/>
                                                </div>
                                            </div>
                                        </div>
                                    </spring:bind>
                                    <br>

                                    <div class="form-group">
                                        <label for="dscCommentsText">Comments : </label>
                                        <form:textarea path="dscComments" id="dscCommentsText" maxlength="200"
                                                       class="form-control col-xl-8"/>
                                    </div>
                                    <br>

                                    <div class="form-group row" id="uploadedTimesheet">
                                        <a href="" target="_blank" id="uploadTimesheetLink">
                                            Click here to access the uploaded timesheet:
                                            <span id="uploadedTimesheetName"></span>
                                        </a>
                                    </div>
                                    <br>

                                    <div class="form-group row" id="submissionInfoDiv">
                                        <label class="col-lg-2 form-control-label">Submitter Name: </label>
                                        <div class="col-lg-4">
                                            <span id="submitterName"></span>
                                        </div>

                                        <label class="col-lg-2 form-control-label">Submitted Date: </label>
                                        <div class="col-lg-4">
                                            <span id="submittedDate"></span>
                                        </div>
                                    </div>

                                    <div class="form-group row" id="approvalInfoDiv">
                                        <label class="col-lg-2 form-control-label">Reviewer Name: </label>
                                        <div class="col-lg-4">
                                            <span id="approverName"></span>
                                        </div>

                                        <label class="col-lg-2 form-control-label">Reviewal Date: </label>
                                        <div class="col-lg-4">
                                            <span id="approvalDate"></span>
                                        </div>
                                    </div>

                                    <br>
                                    <!-- Begin Buttons -->
                                    <div class="d-flex justify-content-center">
                                        <div>
                                            <input type="submit" class="btn btn-success" value="Submit For Review"/>
                                        </div>
                                    </div>

                                </form:form>

                            </div>

                            <div class="card mb-4">
                                <div class="card-block">

                                    <h3 class="card-title">Timesheet Upload Process</h3>

                                    <ul class="timeline">
                                        <li>
                                            <div class="timeline-badge"><em class="fa fa-camera"></em></div>

                                            <div class="timeline-panel">
                                                <div class="timeline-heading">
                                                    <h5 class="timeline-title mt-2">Save Approved Timesheet </h5>
                                                </div>

                                                <div class="timeline-body">
                                                    <p>Please save your approved timesheet in PDF format.</p>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="timeline-badge primary"><em class="fa fa-link"></em></div>

                                            <div class="timeline-panel">
                                                <div class="timeline-heading">
                                                    <h5 class="timeline-title mt-2">Select time period</h5>
                                                </div>

                                                <div class="timeline-body">
                                                    <p>Select the time period and then fill in the timesheet information
                                                        for Regular Hours and Extra Hours as per the approved timesheet.
                                                    </p>
                                                </div>
                                            </div>
                                        </li>

                                        <li>
                                            <div class="timeline-badge"><em class="fa fa-paperclip"></em></div>
                                            <div class="timeline-panel">
                                                <div class="timeline-heading">
                                                    <h5 class="timeline-title mt-2">Upload Timesheet</h5>
                                                </div>

                                                <div class="timeline-body">
                                                    <p>Upload the Approved timesheet and click on <u>Upload
                                                        Timesheet</u> button. Once all the information is filled, click
                                                        on <u>Submit For Review</u>.
                                                    </p>
                                                </div>
                                            </div>
                                        </li>

                                        <li>
                                            <div class="timeline-badge"><em class="fa fa-check"></em></div>
                                            <div class="timeline-panel">
                                                <div class="timeline-heading">
                                                    <h5 class="timeline-title mt-2">Review Timesheet</h5>
                                                </div>

                                                <div class="timeline-body">
                                                    <p>Uploaded timesheet shall be reviewed and approved by Internal
                                                        staff and process your payroll.
                                                    </p>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section class="row">
                        <div class="col-12 mt-1 mb-4">Copy Right by
                            <a href="http://www.Employee Management App.com/">
                                Employee Management App Inc.,
                            </a>
                        </div>
                    </section>
                </div>
            </section>
            <!-- Modal for Forwarding to the Dashboard page after successful submission of the Timesheet Information -->
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
                            <p> Your Timesheet Information is SUBMITTED successfully. </p>
                        </div>

                        <div class="modal-footer">
                            <a href="/employeeManagement/dashboard" class="btn btn-success">
                                Continue to Dashboard Page!!
                            </a>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
        integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
        crossorigin="anonymous"></script>
<script src="./js/external/bootstrap.min.js"></script>
<script src="./js/external/bootstrap-datetimepicker.min.js"></script>
<script src="./js/external/moment.min.js"></script>
<script src="./js/addTimesheet.js"></script>
</body>
</html>
