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

                        <spring:url value="/registration" var="registrationActionUrl"/>
                        <form:form method="POST" modelAttribute="employee" action="${registrationActionUrl}">

                            <form:hidden path="employeeRoleId"/>
                            <form:hidden path="employeeRoleDesc"/>

                            <div class="row">
                                <spring:bind path="employeeFirstName">
                                    <div class="form-group required col-md-6 ${status.error ? 'has-danger' : ''}">
                                        <label class="form-control-label" for="contactFName">First Name</label>
                                        <div class="inputGroupContainer">
                                            <form:input path="employeeFirstName" name="contactFName"
                                                        id="contactFName" maxlength="50"
                                                        placeholder="Enter First Name" data-toggle="tooltip"
                                                        data-animation="false"
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
                                            <form:input path="employeeLastName"
                                                        id="contactLname"
                                                        maxlength="50"
                                                        placeholder="Enter Last Name" data-toggle="tooltip"
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

                            <div class="row">
                                <spring:bind path="empPassword">
                                    <div class="form-group required col-md-6 ${status.error ? 'has-danger' : ''}">
                                        <label class="form-control-label" for="password" data-toggle="tooltip"
                                               data-animation="false" data-placement="bottom"
                                               title="Password can be 6 to 25 characters. Should consist of atleast one uppercase character, digit and special symbol (@#$%)"
                                        >Password</label>
                                        <div class="inputGroupContainer">
                                            <form:password path="empPassword"
                                                           id="password" maxlength="25"
                                                           placeholder="Password"
                                                           class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                            <div class="form-control-feedback">
                                                <form:errors path="empPassword"/>
                                            </div>
                                        </div>
                                    </div>
                                </spring:bind>

                                <spring:bind path="empPassword2">
                                    <div class="form-group required col-md-6 ${status.error ? 'has-danger' : ''}">
                                        <label class="form-control-label" for="password2" data-toggle="tooltip"
                                               data-animation="false" data-placement="bottom"
                                               title="Please re-enter the same password.">Re-enter Password</label>
                                        <div class="inputGroupContainer">
                                            <form:password path="empPassword2"
                                                           id="password2" maxlength="25"
                                                           placeholder="Re-enter Password"
                                                           class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                            <div class="form-control-feedback">
                                                <form:errors path="empPassword2"/>
                                            </div>
                                        </div>
                                    </div>
                                </spring:bind>
                            </div>
                            <br>
                            <p class="text-center">By clicking on Register, you agree to
                                <a href="#">Terms & Conditions/Privacy Policy</a>.
                            </p>

                            <div class="form-signin">
                                <button class="btn btn-lg btn-success btn-block" type="submit">Register</button>
                            </div>

                        </form:form>
                        <hr>
                        <div class="form-signin">
                            <a href="login">Login into your Existing Account</a>
                        </div>
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
