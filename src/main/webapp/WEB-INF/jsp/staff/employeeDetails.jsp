<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mahidhar Mullapudi">
    <link rel="icon" href="images/favicon.ico">
    <title>Employee Management App Registration</title>
    <!-- Bootstrap core CSS -->
    <link href="css/external/bootstrap.min.css" rel="stylesheet">
    <!--Fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">
    <!-- Icons -->
    <link href="css/external/font-awesome.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/login.css" rel="stylesheet">
</head>
<body>
<div class="container" id="wrapper">
    <main class="col-md-12">
        <section class="row">
            <div class="col-sm-12">
                <section class="row">
                    <div class="form-signin">
                        <br><img src="images/company_logo.jpg" class="img-fluid">
                        <hr>
                    </div>
                    <div class="col-md-12">
                        <h4 class="subheading"> Welcome to Employee Management App. Please create your Account
                            to continue. </h4>
                        <hr>
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

                        <spring:url value="/employeeDetails" var="submitEmployeeDetailsUrl"/>
                        <form:form method="POST" modelAttribute="employeeDetails" action="${submitEmployeeDetailsUrl}">

                            <form:hidden path="employeeRoleId"/>
                            <form:hidden path="employeeRoleDesc"/>

                            <div class="row">
                                <spring:bind path="employeeFirstName">
                                    <div class="form-group required col-md-6 ${status.error ? 'has-danger' : ''}">
                                        <label class="form-control-label" for="contactFName">First Name</label>
                                        <div class="inputGroupContainer">
                                            <form:input path="employeeFirstName" id="contactFName" maxlength="50"
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
                                        <label class="form-control-label" for="contactLname">Last Name</label>
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
                                        <label for="emailId" class="form-control-label">Email</label>
                                        <div class="inputGroupContainer">
                                            <form:input path="employeeEmailId" maxlength="50" type="email" id="emailId"
                                                        placeholder="Email" data-toggle="tooltip" data-animation="false"
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
                                        <label class="form-control-label" for="employeePhone">Phone Number</label>
                                        <div class="inputGroupContainer">
                                            <form:input path="employeePhone"
                                                        id="employeePhone" maxlength="10"
                                                        placeholder="(xxx) xxx-xxxx" data-toggle="tooltip"
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
                                        <label class="form-control-label" for="employeeTitle">Role Title</label>
                                        <div class="inputGroupContainer">
                                            <form:input path="employeeTitle"
                                                        id="employeeTitle" maxlength="50"
                                                        placeholder="Enter Role Title" data-toggle="tooltip"
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
                                        <label class="form-control-label" for="employeeTitle">Skill Set</label>
                                        <div class="inputGroupContainer">
                                            <form:select path="skillSet" id="skillSet" maxlength="50"
                                                         data-toggle="tooltip" data-animation="false"
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
                                        <label class="form-control-label" for="employmentType">Employment Type</label>
                                        <div class="inputGroupContainer">
                                            <form:select path="employmentType" id="employmentType"
                                                         data-toggle="tooltip" data-animation="false"
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
                                    <div class="form-group required col-md-6 ${status.error ? 'has-danger' : ''}">
                                        <label class="form-control-label" for="employmentStartDate">
                                            Employment Start Date
                                        </label>
                                        <div class="inputGroupContainer">
                                            <form:input path="employmentStartDate" id="employmentStartDate"
                                                        placeholder="Employment Start Date" data-toggle="tooltip"
                                                        data-animation="false"
                                                        class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                            <div class="form-control-feedback">
                                                <form:errors path="employmentStartDate"/>
                                            </div>
                                        </div>
                                    </div>
                                </spring:bind>

                                <spring:bind path="referredBy">
                                    <div class="form-group col-md-6 ${status.error ? 'has-danger' : ''}">
                                        <label class="form-control-label" for="referredBy">Referrer Name</label>
                                        <div class="inputGroupContainer">
                                            <form:input path="referredBy" placeholder="Referred Name"
                                                        id="referredBy" maxlength="50" data-toggle="tooltip"
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
                                        <label class="form-control-label" for="currentSalaryPerc">Current Salary
                                            Percentage</label>
                                        <div class="inputGroupContainer">
                                            <form:input path="currentSalaryPerc"
                                                        id="currentSalaryPerc" maxlength="50"
                                                        placeholder="Enter Role Title" data-toggle="tooltip"
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
                                        <label class="form-control-label" for="salaryDiscount">Salary Discount</label>
                                        <div class="inputGroupContainer">
                                            <form:input path="salaryDiscount" id="salaryDiscount" maxlength="5"
                                                        placeholder="Enter Salary Discount" data-toggle="tooltip"
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
                            <div class="form-signin">
                                <button class="btn btn-lg btn-success btn-block" type="submit">
                                    Update Employee Details
                                </button>
                            </div>

                        </form:form>
                    </div>
                </section>
            </div>
        </section>
    </main>
</div>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/external/jquery-3.2.1.min.js"></script>
<script src="js/external/tether.min.js"></script>
<script src="js/external/popper.min.js"></script>
<script src="js/external/bootstrap.min.js"></script>
<script src="js/external/jquery.mask.min.js"></script>

<script>
    $(function () {
        $('[data-toggle="tooltip"]').tooltip();
        $('.phone_us').mask('(000)000-0000');
    })
</script>
</body>
</html>
