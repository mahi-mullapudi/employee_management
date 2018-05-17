<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mahidhar Mullapudi">
    <link rel="icon" href="images/favicon.ico">
    <title>Login</title>
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
        <section>
            <div class="form-signin">
                <br><img src="images/company_logo.jpg" class="img-fluid">
                <hr>
            </div>

            <div class="col-md-10 form-signin">

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

                <spring:url value="/login" var="loginActionUrl"/>
                <form:form method="POST" modelAttribute="loginObj" action="${loginActionUrl}">
                    <spring:bind path="emailId">
                        <div class="form-group required ${status.error ? 'has-danger' : ''}">
                            <div class="inputGroupContainer">
                                <form:input path="emailId" type="email"
                                            name="emailId" id="emailId" maxlength="50"
                                            placeholder="Email Address" data-toggle="tooltip"
                                            data-animation="false"
                                            class="form-control ${status.error ? 'form-control-danger' : ''}"
                                            required="required"/>
                                <div class="form-control-feedback">
                                    <form:errors path="emailId"/>
                                </div>
                            </div>
                        </div>
                    </spring:bind>

                    <spring:bind path="password">
                        <div class="form-group required ${status.error ? 'has-danger' : ''}">
                            <div class="inputGroupContainer">
                                <form:password path="password"
                                               name="password" id="password" maxlength="50"
                                               placeholder="Password" data-toggle="tooltip"
                                               data-animation="false"
                                               class="form-control ${status.error ? 'form-control-danger' : ''}"
                                               required="required"/>
                                <div class="form-control-feedback">
                                    <form:errors path="password"/>
                                </div>
                            </div>
                        </div>
                    </spring:bind>

                    <form:hidden path="clientIpAddress"/>

                    <p class="text-center">By logging in, you <b>agree</b> to
                        <a href="">Terms & Conditions/Privacy Policy</a>.
                    </p>

                    <div class="form-signin">
                        <button class="btn btn-md btn-primary btn-block" type="submit">Sign in</button>
                    </div>

                </form:form>
            </div>

            <div class="form-signin">
                <a href="/employeeManagement/forgotPassword"> Having Trouble Logging In? </a>
                <hr>
                <span>Need an account? <a href="/employeeManagement/registration"> Sign Up</a>. </span>
            </div>

        </section>
    </main>
</div>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/external/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
        integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
        crossorigin="anonymous"></script>
<script src="js/external/bootstrap.min.js"></script>

</body>
</html>
