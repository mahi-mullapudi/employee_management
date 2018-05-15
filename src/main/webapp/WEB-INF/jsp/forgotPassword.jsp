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

                <spring:url value="/forgotPassword" var="resetActionUrl"/>
                <form:form method="POST" modelAttribute="resetPassword" action="${resetActionUrl}">

                    <input type="hidden" id="resetModalDisplayFlag" value="${resetConfirmationModal}"/>
                    <spring:bind path="emailId">
                        <div class="form-group required ${status.error ? 'has-danger' : ''}">
                            <label for="emailId">Please enter your <b>Email Address</b> to reset your password: </label>
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

                    <div class="form-signin">
                        <button class="btn btn-md btn-primary btn-block" type="submit">Reset Password</button>
                    </div>

                </form:form>
            </div>
        </section>
        <!-- Modal for Forwarding to the Dashboard page after successful submission of the Timesheet Information -->
        <div id="resetConfirmationModal" class="modal fade" role="dialog" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog" id="my-account">
                <div class="modal-content">
                    <div class="modal-header bg-success">
                        <h4 class="modal-title"> Password reset Successful!! </h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body text-center">
                        <i class="fa fa-check fa-5x" aria-hidden="true"></i>
                        <p> We have reset your password and sent an email with detailed instructions to ${resetEmail}.
                            Please follow the provided instructions to access your account.
                        </p>
                    </div>

                    <div class="modal-footer">
                        <a href="/employeeManagement/login" class="btn btn-success">
                            Back to Login Page!!
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- End of Modal -->
    </main>
</div>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/external/jquery-3.2.1.min.js"></script>
<script src="js/external/tether.min.js"></script>
<script src="js/external/bootstrap.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //To activate Tooltip for this page
        $('[data-toggle="tooltip"]').tooltip();
        //On successful submit display the Modal
        if ($('#resetModalDisplayFlag').val() === 'yes') {
            $('#resetConfirmationModal').modal('show');
        }
    });
</script>

</body>
</html>
