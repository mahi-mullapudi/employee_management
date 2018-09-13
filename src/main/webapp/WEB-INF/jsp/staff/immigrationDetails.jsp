<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="images/favicon.ico">
    <title>Employee Details</title>
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

<body onload="hideImmiDiv(${showDivFlag})">
<div class="container-fluid" id="wrapper">
    <div class="row">
        <jsp:include page="../sideNavbar.jsp"/>
        <main class="col-xs-12 col-sm-8 offset-sm-4 col-lg-9 offset-lg-3 col-xl-10 offset-xl-2 pt-3 pl-4">
            <header class="page-header row justify-center">
                <div class="col-md-6 col-lg-8">
                    <h1 class="float-left text-center text-md-left">Employee Details</h1>
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

            <ul class="nav nav-pills nav-fill col-lg-11 col-md-12">
                <li class="nav-item">
                    <a class="nav-link" href="/employeeManagement/employeeDetails?empId=${empId}">
                        Personal Details
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/employeeManagement/clientDetails?empId=${empId}">
                        Client Details
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/employeeManagement/immiDetails?empId=${empId}">
                        Immigration Details
                    </a>
                </li>
            </ul>
            <br><br>
            <section class="row">
                <div class="col-lg-11 col-md-12">
                    <section class="row">
                        <div id="accordionImmiDetails" class="col-sm-12">
                            <div class="card">
                                <div class="card-header panel-title" id="headingThree">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h5 class="mb-0">
                                                <i class="fa fa-building" aria-hidden="true"></i>&nbsp;
                                                <a class="card-link" data-toggle="collapse"
                                                   href="#collapseImmiDetails"
                                                   aria-expanded="true" aria-controls="collapseImmiDetails">
                                                    Immigration Details &nbsp;&nbsp;
                                                    <i class="fa" aria-hidden="true"></i>
                                                </a>
                                            </h5>
                                        </div>
                                    </div>
                                </div>

                                <div id="collapseImmiDetails" class="collapse show"
                                     aria-labelledby="headingImmiDetails" data-parent="#accordionImmiDetails">

                                    <div class="card-body">
                                        <br>
                                        <div class="col-md-12 row">
                                            <div class="col-md-12 col-lg-8">
                                                <p>Click on the button to add new Immigration Information.</p>
                                            </div>
                                            <div class="col-md-12 col-lg-4">
                                                <a id="addImmiLink" class="btn btn-sm btn-success"
                                                   onclick="addImmigrationDetails()">
                                                    Add Immigration Details
                                                </a>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="col-md-12" id="viewImmigrationDetailsDiv">
                                            <c:if test="${not empty msg}">
                                                <div class="col-md-12">
                                                    <div class="alert alert-${css} alert-dismissible" role="alert">
                                                        <button type="button" class="close" data-dismiss="alert"
                                                                aria-label="Close">
                                                            <span aria-hidden="true">X</span>
                                                        </button>
                                                        <i class="fa fa-info-circle faa-flash animated"></i>
                                                        <strong> ${msg}</strong>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <br>
                                            <spring:url value="/immiDetails" var="immiActionUrl"/>
                                            <form:form method="POST" modelAttribute="immigrationDetails"
                                                       action="${immiActionUrl}">

                                                <form:hidden id="immiDetailsId" path="immiDetailsId"/>
                                                <input type="hidden" id="employeeId" name="employee.employeeId"
                                                       value="${empId}">
                                                <div class="row">
                                                    <spring:bind path="currentStatus">
                                                        <div class="form-group required col-md-6 ${status.error ? 'has-danger' : ''} snears-vendor-info">
                                                            <label class="form-control-label" for="currentStatus">Current
                                                                Status</label>
                                                            <div class="inputGroupContainer">
                                                                <form:select path="currentStatus"
                                                                             placeholder="Current Status"
                                                                             data-toggle="tooltip"
                                                                             data-animation="false"
                                                                             class="form-control ${status.error ? 'form-control-danger' : ''}"
                                                                             id="currentStatus">
                                                                    <form:option value="" label="---SELECT---"/>
                                                                    <form:options items="${immiStatusMap}"/>
                                                                </form:select>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="currentStatus"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="receiptNumber">
                                                        <div class="form-group col-md-6 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="receiptNumber">Receipt
                                                                Number</label>
                                                            <div class="inputGroupContainer">
                                                                <form:input path="receiptNumber" maxlength="100"
                                                                            id="receiptNumber"
                                                                            placeholder="Receipt Number"
                                                                            data-toggle="tooltip"
                                                                            data-animation="false"
                                                                            class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="receiptNumber"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="lcaNumber">
                                                        <div class="form-group col-md-6 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="lcaNumber">LCA
                                                                Number</label>
                                                            <div class="inputGroupContainer">
                                                                <form:input path="lcaNumber" maxlength="50"
                                                                            id="lcaNumber"
                                                                            placeholder="LCA Number"
                                                                            data-toggle="tooltip"
                                                                            data-animation="false"
                                                                            class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="lcaNumber"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="currentWage">
                                                        <div class="form-group required col-md-6 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="currentWage">Current
                                                                Wage</label>
                                                            <div class="inputGroupContainer">
                                                                <form:input path="currentWage" id="currentWage"
                                                                            data-toggle="tooltip" data-animation="false"
                                                                            class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="currentWage"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="startDate">
                                                        <div class="form-group required col-md-6 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="startDate">Start
                                                                Date</label>
                                                            <div class="inputGroupContainer">
                                                                <form:input path="startDate" id="startDate"
                                                                            data-toggle="tooltip" data-animation="false"
                                                                            class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="startDate"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="endDate">
                                                        <div class="form-group required col-md-6 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="endDate">End
                                                                Date</label>
                                                            <div class="inputGroupContainer">
                                                                <form:input path="endDate" id="endDate"
                                                                            data-toggle="tooltip" data-animation="false"
                                                                            class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="endDate"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>
                                                </div>

                                                <div class="d-flex justify-content-around">
                                                    <div>
                                                        <button class="btn btn-md btn-success btn-block" type="submit">
                                                            Submit Immigration Details
                                                        </button>
                                                    </div>
                                                </div>

                                            </form:form>
                                        </div>
                                        <hr>
                                        <div class="col-md-12">
                                            <h4 class="subheading">
                                                Immigration Details Summary
                                            </h4>
                                            <div class="table-responsive">
                                                <table id="immigrationDetailsSummary"
                                                       class="table table-striped table-bordered"
                                                       cellspacing="0" width="100%">
                                                    <thead>
                                                    <tr>
                                                        <th>Id</th>
                                                        <th>Immigration Status</th>
                                                        <th>Start Date</th>
                                                        <th>End Date</th>
                                                        <th>View</th>
                                                    </tr>
                                                    </thead>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
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
<script src="./js/immiDetails.js"></script>

</body>
</html>
