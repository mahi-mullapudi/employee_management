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
                <div class="col-lg-10 col-md-11">

                    <section class="row">
                        <div id="accordionEmployeeDetails">
                            <div class="card">
                                <div class="card-header panel-title" id="headingOne">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h5 class="mb-0">
                                                <i class="fa fa-building" aria-hidden="true"></i>&nbsp;
                                                <a class="card-link" data-toggle="collapse"
                                                   href="#collapseEmployeeDetails"
                                                   aria-expanded="true" aria-controls="collapseEmployeeDetails">
                                                    Employee Details &nbsp;&nbsp;
                                                    <i class="fa" aria-hidden="true"></i>
                                                </a>
                                            </h5>
                                        </div>
                                    </div>
                                </div>

                                <div id="collapseEmployeeDetails" class="collapse show"
                                     aria-labelledby="headingEmployeeDetails" data-parent="#accordionEmployeeDetails">

                                    <div class="card-body">
                                        <br>
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
                                            <br>
                                            <spring:url value="/employeeDetails" var="submitEmployeeDetailsUrl"/>
                                            <form:form method="POST" modelAttribute="employeeDetails"
                                                       action="${submitEmployeeDetailsUrl}">

                                                <form:hidden path="employeeRoleId"/>
                                                <form:hidden path="employeeRoleDesc"/>

                                                <div class="row">
                                                    <spring:bind path="employeeFirstName">
                                                        <div class="form-group required col-md-6 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="contactFName">First
                                                                Name</label>
                                                            <div class="inputGroupContainer">
                                                                <form:input path="employeeFirstName" id="contactFName"
                                                                            maxlength="50"
                                                                            data-toggle="tooltip" data-animation="false"
                                                                            class="form-control ${status.error ? 'form-control-danger' : ''}"
                                                                            required="required"/>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="employeeFirstName"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="employeeLastName">
                                                        <div class="form-group required col-md-6 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="contactLname">Last
                                                                Name</label>
                                                            <div class="inputGroupContainer">
                                                                <form:input path="employeeLastName" id="contactLname"
                                                                            maxlength="50" placeholder="Enter Last Name"
                                                                            data-toggle="tooltip"
                                                                            data-animation="false"
                                                                            class="form-control ${status.error ? 'form-control-danger' : ''}"
                                                                            required="required"/>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="employeeLastName"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>
                                                </div>

                                                <div class="row">
                                                    <spring:bind path="employeeEmailId">
                                                        <div class="form-group required col-md-6 ${status.error ? 'has-danger' : ''}">
                                                            <label for="emailId"
                                                                   class="form-control-label">Email</label>
                                                            <div class="inputGroupContainer">
                                                                <form:input path="employeeEmailId" maxlength="50"
                                                                            type="email"
                                                                            id="emailId"
                                                                            placeholder="Email" data-toggle="tooltip"
                                                                            data-animation="false"
                                                                            class="form-control ${status.error ? 'form-control-danger' : ''}"
                                                                            required="required"/>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="employeeEmailId"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="employeePhone">
                                                        <div class="form-group required col-md-6 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="employeePhone">Phone
                                                                Number</label>
                                                            <div class="inputGroupContainer">
                                                                <form:input path="employeePhone"
                                                                            id="employeePhone" maxlength="10"
                                                                            placeholder="(xxx) xxx-xxxx"
                                                                            data-toggle="tooltip"
                                                                            data-animation="false"
                                                                            class="form-control phone_us ${status.error ? 'form-control-danger' : ''}"/>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="employeePhone"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <spring:bind path="employeeTitle">
                                                        <div class="form-group col-md-6 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="employeeTitle">Role
                                                                Title</label>
                                                            <div class="inputGroupContainer">
                                                                <form:input path="employeeTitle"
                                                                            id="employeeTitle" maxlength="50"
                                                                            placeholder="Enter Role Title"
                                                                            data-toggle="tooltip"
                                                                            data-animation="false"
                                                                            class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="employeeTitle"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="skillSet">
                                                        <div class="form-group required col-md-6 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="employeeTitle">Skill
                                                                Set</label>
                                                            <div class="inputGroupContainer">
                                                                <form:select path="skillSet" id="skillSet"
                                                                             maxlength="50"
                                                                             data-toggle="tooltip"
                                                                             data-animation="false"
                                                                             class="form-control ${status.error ? 'form-control-danger' : ''}">
                                                                    <form:option value="" label="Select"/>
                                                                    <form:options items="${skillSetMap}"/>
                                                                </form:select>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="skillSet"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="companyName">
                                                        <div class="form-group required col-md-6 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="employeeTitle">Company</label>
                                                            <div class="inputGroupContainer">
                                                                <form:select path="companyName" id="companyName"
                                                                             data-animation="false"
                                                                             class="form-control ${status.error ? 'form-control-danger' : ''}">
                                                                    <form:option value="" label="Select"/>
                                                                    <form:options items="${companyNamesMap}"/>
                                                                </form:select>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="employeeTitle"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="employmentType">
                                                        <div class="form-group required col-md-6 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="employmentType">Employment
                                                                Type</label>
                                                            <div class="inputGroupContainer">
                                                                <form:select path="employmentType" id="employmentType"
                                                                             data-toggle="tooltip"
                                                                             data-animation="false"
                                                                             class="form-control ${status.error ? 'form-control-danger' : ''}">
                                                                    <form:option value="" label="Select"/>
                                                                    <form:options items="${empTypeMap}"/>
                                                                </form:select>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="employmentType"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="employmentStartDate">
                                                        <div class="form-group col-md-6 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="employmentStartDate">
                                                                Employment Start Date
                                                            </label>
                                                            <div class="inputGroupContainer">
                                                                <div class="input-group">
                                                                    <span class="input-group-addon">
                                                                      <i class="fa fa-calendar" aria-hidden="true">
                                                                      </i>
                                                                    </span>
                                                                    <form:input path="employmentStartDate"
                                                                                id="employmentStartDate"
                                                                                data-toggle="tooltip"
                                                                                data-animation="false"
                                                                                class="form-control ${status.error ? 'form-control-danger' : ''} date_format"
                                                                                autocomplete="off"
                                                                                data-date-format="MM/DD/YYYY"/>
                                                                </div>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="employmentStartDate"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="referredBy">
                                                        <div class="form-group col-md-6 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="referredBy">Referrer
                                                                Name</label>
                                                            <div class="inputGroupContainer">
                                                                <form:input path="referredBy"
                                                                            placeholder="Referred Name"
                                                                            id="referredBy" maxlength="50"
                                                                            data-toggle="tooltip"
                                                                            data-animation="false"
                                                                            class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="referredBy"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="currentSalaryPerc">
                                                        <div class="form-group col-md-6 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="currentSalaryPerc">Current
                                                                Salary
                                                                Percentage</label>
                                                            <div class="inputGroupContainer">
                                                                <form:input path="currentSalaryPerc"
                                                                            id="currentSalaryPerc" maxlength="50"
                                                                            placeholder="Current Salary Percentage"
                                                                            data-toggle="tooltip"
                                                                            data-animation="false"
                                                                            class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="currentSalaryPerc"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="salaryDiscount">
                                                        <div class="form-group col-md-6 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="salaryDiscount">Salary
                                                                Discount</label>
                                                            <div class="inputGroupContainer">
                                                                <form:input path="salaryDiscount" id="salaryDiscount"
                                                                            maxlength="5"
                                                                            placeholder="Enter Salary Discount"
                                                                            data-toggle="tooltip"
                                                                            data-animation="false"
                                                                            class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="salaryDiscount"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>
                                                </div>
                                                <br>
                                                <div class="text-center">
                                                    <button class="btn btn-success" type="submit">
                                                        Update Employee Details
                                                    </button>
                                                </div>
                                                <br>
                                            </form:form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section class="row">
                        <div id="accordionClientDetails">
                            <div class="card">
                                <div class="card-header panel-title" id="headingTwo">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h5 class="mb-0">
                                                <i class="fa fa-building" aria-hidden="true"></i>&nbsp;
                                                <a class="card-link" data-toggle="collapse"
                                                   href="#collapseClientDetails"
                                                   aria-expanded="true" aria-controls="collapseClientDetails">
                                                    Project Details &nbsp;&nbsp;
                                                    <i class="fa" aria-hidden="true"></i>
                                                </a>
                                            </h5>
                                        </div>
                                    </div>
                                </div>

                                <div id="collapseClientDetails" class="collapse show"
                                     aria-labelledby="headingClientDetails" data-parent="#accordionClientDetails">

                                    <div class="card-body">
                                        <br>
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
                                            <br>
                                            <spring:url value="/clientDetails" var="clientDetailsActionUrl"/>
                                            <form:form method="POST" modelAttribute="clientDetails"
                                                       action="${clientDetailsActionUrl}">

                                                <form:hidden path="clientDetailsId"/>
                                                <form:hidden path="employee.employeeId"/>

                                                <div class="row">

                                                    <spring:bind path="clientName">
                                                        <div class="form-group required col-md-6 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="clientName">Client
                                                                Name</label>
                                                            <div class="inputGroupContainer">
                                                                <form:input path="clientName" maxlength="50"
                                                                            placeholder="Client Name"
                                                                            data-toggle="tooltip"
                                                                            data-animation="false"
                                                                            class="form-control ${status.error ? 'form-control-danger' : ''}"
                                                                            id="clientName"/>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="clientName"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="clientAddress">
                                                        <div class="form-group required col-md-6 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="clientAddress">Client
                                                                Address</label>
                                                            <div class="inputGroupContainer">
                                                                <form:input path="clientAddress"
                                                                            maxlength="100" id="clientAddress"
                                                                            placeholder="Client Address"
                                                                            data-toggle="tooltip"
                                                                            data-animation="false"
                                                                            class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="clientAddress"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="clientCity">
                                                        <div class="form-group required col-md-6 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label"
                                                                   for="clientCity">City</label>
                                                            <div class="inputGroupContainer">
                                                                <form:input path="clientCity" maxlength="50"
                                                                            id="clientCity"
                                                                            placeholder="Enter City"
                                                                            data-toggle="tooltip"
                                                                            data-animation="false"
                                                                            class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                                                <div class="form-control-feedback">
                                                                    <form:errors
                                                                            path="clientCity"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="clientState">
                                                        <div class="form-group required col-md-3 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label"
                                                                   for="clientState">State</label>
                                                            <div class="inputGroupContainer">
                                                                <form:input
                                                                        path="clientState" id="clientState"
                                                                        maxlength="2"
                                                                        placeholder="Enter State" data-toggle="tooltip"
                                                                        data-animation="false"
                                                                        class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="clientState"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="clientZip">
                                                        <div class="form-group required col-md-3 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label"
                                                                   for="clientZip">Zip</label>
                                                            <div class="inputGroupContainer">
                                                                <form:input path="clientZip" id="clientZip"
                                                                            maxlength="5"
                                                                            placeholder="Enter Zip Code"
                                                                            data-toggle="tooltip"
                                                                            data-animation="false"
                                                                            class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="clientZip"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="contractCompany">
                                                        <div class="form-group required col-md-3 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="contractCompany">Contract
                                                                Company</label>
                                                            <div class="inputGroupContainer">
                                                                <form:select path="contractCompany" id="contractCompany"
                                                                             data-toggle="tooltip"
                                                                             data-animation="false"
                                                                             class="form-control ${status.error ? 'form-control-danger' : ''}">
                                                                    <form:options items="${companyNamesMap}"/>
                                                                </form:select>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="contractCompany"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="vendorCompany">
                                                        <div class="form-group required col-md-3 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="vendorCompany">Vendor
                                                                Company</label>
                                                            <div class="inputGroupContainer">
                                                                <form:input path="vendorCompany" id="vendorCompany"
                                                                            data-toggle="tooltip" data-animation="false"
                                                                            class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="vendorCompany"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="contractStartDate">
                                                        <div class="form-group required col-md-3 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="contractStartDate">
                                                                Contract Start Date
                                                            </label>
                                                            <div class="inputGroupContainer">
                                                                <div class="input-group">
                                                                    <span class="input-group-addon">
                                                                      <i class="fa fa-calendar" aria-hidden="true"></i>
                                                                    </span>
                                                                    <form:input path="contractStartDate"
                                                                                id="contractStartDate"
                                                                                data-toggle="tooltip"
                                                                                data-animation="false"
                                                                                class="form-control ${status.error ? 'form-control-danger' : ''} date_format"
                                                                                autocomplete="off"
                                                                                data-date-format="MM/DD/YYYY"/>
                                                                </div>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="contractStartDate"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="contractEndDate">
                                                        <div class="form-group col-md-3 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="contractEndDate">
                                                                Contract End Date
                                                            </label>
                                                            <div class="inputGroupContainer">
                                                                <div class="input-group">
                                                                    <span class="input-group-addon">
                                                                      <i class="fa fa-calendar" aria-hidden="true"></i>
                                                                    </span>
                                                                    <form:input path="contractEndDate"
                                                                                id="contractEndDate"
                                                                                data-toggle="tooltip"
                                                                                data-animation="false"
                                                                                class="form-control ${status.error ? 'form-control-danger' : ''} date_format"
                                                                                autocomplete="off"
                                                                                data-date-format="MM/DD/YYYY"/>
                                                                </div>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="contractEndDate"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>


                                                    <spring:bind path="vendorContactName">
                                                        <div class="form-group required col-md-3 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="vendorContactName">
                                                                Vendor Contact Name</label>
                                                            <div class="inputGroupContainer">
                                                                <form:input path="vendorContactName"
                                                                            id="vendorContactName"
                                                                            data-toggle="tooltip" data-animation="false"
                                                                            class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="vendorContactName"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="vendorPhone">
                                                        <div class="form-group required col-md-3 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="vendorPhone">Vendor
                                                                Phone</label>
                                                            <div class="inputGroupContainer">
                                                                <form:input path="vendorPhone" id="contractEndDate"
                                                                            data-toggle="tooltip" data-animation="false"
                                                                            class="form-control phone_us ${status.error ? 'form-control-danger' : ''}"/>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="vendorPhone"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="vendorEmail">
                                                        <div class="form-group required col-md-3 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="vendorEmail">Vendor
                                                                Email</label>
                                                            <div class="inputGroupContainer">
                                                                <form:input path="vendorEmail" id="contractEndDate"
                                                                            data-toggle="tooltip" data-animation="false"
                                                                            class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="vendorEmail"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="paymentTerms">
                                                        <div class="form-group required col-md-3 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="paymentTerms">Payment
                                                                Terms</label>
                                                            <div class="inputGroupContainer">
                                                                <form:select path="paymentTerms" id="paymentTerms"
                                                                             data-toggle="tooltip"
                                                                             data-animation="false"
                                                                             class="form-control ${status.error ? 'form-control-danger' : ''}">
                                                                    <form:options items="${paymentTermsMap}"/>
                                                                </form:select>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="paymentTerms"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="invoiceContactName">
                                                        <div class="form-group col-md-3 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="invoiceContactName">
                                                                Invoice Contact Name
                                                            </label>
                                                            <div class="inputGroupContainer">
                                                                <form:input path="invoiceContactName"
                                                                            id="invoiceContactName"
                                                                            data-toggle="tooltip" data-animation="false"
                                                                            class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="invoiceContactName"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="invoiceContactPhone">
                                                        <div class="form-group col-md-3 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="invoiceContactPhone">
                                                                Invoice Contact Phone
                                                            </label>
                                                            <div class="inputGroupContainer">
                                                                <form:input path="invoiceContactPhone"
                                                                            id="invoiceContactPhone"
                                                                            data-toggle="tooltip" data-animation="false"
                                                                            class="form-control phone_us ${status.error ? 'form-control-danger' : ''}"/>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="invoiceContactPhone"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="invoiceContactEmail">
                                                        <div class="form-group col-md-3 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="invoiceContactEmail">
                                                                Invoice Contact Email
                                                            </label>
                                                            <div class="inputGroupContainer">
                                                                <form:input path="invoiceContactEmail"
                                                                            id="invoiceContactEmail"
                                                                            data-toggle="tooltip" data-animation="false"
                                                                            class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="invoiceContactEmail"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="invoiceFrequency">
                                                        <div class="form-group col-md-3 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="invoiceFrequency">Invoice
                                                                Frequency</label>
                                                            <div class="inputGroupContainer">
                                                                <form:select path="invoiceFrequency"
                                                                             id="invoiceFrequency"
                                                                             data-toggle="tooltip"
                                                                             data-animation="false"
                                                                             class="form-control ${status.error ? 'form-control-danger' : ''}">
                                                                    <form:options items="${invoiceFrequencyMap}"/>
                                                                </form:select>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="invoiceFrequency"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="comments">
                                                        <div class="form-group col-md-12 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label"
                                                                   for="comments">Comments</label>
                                                            <div class="inputGroupContainer">
                                                                <form:textarea path="comments" id="comments"
                                                                               data-toggle="tooltip"
                                                                               data-animation="false"
                                                                               class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="comments"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>
                                                </div>

                                                <div class="d-flex justify-content-around">
                                                    <div>
                                                        <button class="btn btn-md btn-primary btn-block" type="submit">
                                                            Save
                                                        </button>
                                                    </div>
                                                    <div>
                                                        <button class="btn btn-md btn-success btn-block" type="submit">
                                                            Submit
                                                        </button>
                                                    </div>
                                                </div>

                                            </form:form>
                                            <hr>
                                            <h4 class="subheading">
                                                Client Details Summary
                                            </h4>
                                            <div class="table-responsive">
                                                <table id="clientDetailsSummary"
                                                       class="table table-striped table-bordered order-column row-border text-center"
                                                       data-page-length='10' width="100%">
                                                    <thead class="text-center table-header"
                                                           style="color: white"></thead>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section class="row">
                        <div id="accordionImmiDetails">
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
                                            <br>
                                            <spring:url value="/immiDetails" var="immiActionUrl"/>
                                            <form:form method="POST" modelAttribute="immigrationDetails"
                                                       action="${immiActionUrl}">

                                                <form:hidden path="immiDetailsId"/>
                                                <div class="row">

                                                    <spring:bind path="currentStatus">
                                                        <div class="form-group col-md-6 ${status.error ? 'has-danger' : ''} snears-vendor-info">
                                                            <label class="form-control-label" for="currentStatus">Current
                                                                Status</label>
                                                            <div class="inputGroupContainer">
                                                                <form:select path="currentStatus"
                                                                             placeholder="Current Status"
                                                                             data-toggle="tooltip"
                                                                             data-animation="false"
                                                                             class="form-control ${status.error ? 'form-control-danger' : ''}"
                                                                             id="currentStatus">
                                                                    <form:option value="" label=""/>
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
                                                                            placeholder="Client Address"
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

                                                    <spring:bind path="startDate">
                                                        <div class="form-group col-md-6 ${status.error ? 'has-danger' : ''}">
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
                                                        <div class="form-group col-md-6 ${status.error ? 'has-danger' : ''}">
                                                            <label class="form-control-label" for="endDate">LCA
                                                                Number</label>
                                                            <div class="inputGroupContainer">
                                                                <form:input path="endDate" id="endDate"
                                                                            data-toggle="tooltip" data-animation="false"
                                                                            class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                                                <div class="form-control-feedback">
                                                                    <form:errors path="lcaNumber"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="currentWage">
                                                        <div class="form-group col-md-6 ${status.error ? 'has-danger' : ''}">
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
                                                </div>

                                                <div class="d-flex justify-content-around">
                                                    <div>
                                                        <button class="btn btn-md btn-success btn-block" type="submit">
                                                            Submit
                                                        </button>
                                                    </div>
                                                </div>

                                            </form:form>
                                            <hr>
                                            <h4 class="subheading">
                                                Immigration Details Summary
                                            </h4>
                                            <div class="table-responsive">
                                                <table id="immigrationDetails"
                                                       class="table table-striped table-bordered"
                                                       cellspacing="0" width="100%">
                                                    <thead>
                                                    <tr>
                                                        <th>Id</th>
                                                        <th>Immigration Status</th>
                                                        <th>Start Date</th>
                                                        <th>End Date</th>
                                                        <th>Comments</th>
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

<script src="./js/external/jquery-3.2.1.min.js"></script>
<script src="./js/external/jquery.mask.min.js"></script>
<script src="./js/external/tether.min.js"></script>
<script src="./js/external/popper.min.js"></script>
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
<script src="./js/external/custom.js"></script>
<script src="./js/external/moment.min.js"></script>
<script src="./js/dashboard-staff.js"></script>

</body>
</html>
