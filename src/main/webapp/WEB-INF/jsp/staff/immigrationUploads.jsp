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
<div class="container-fluid" id="wrapper">
    <div class="row">
        <jsp:include page="../sideNavbar.jsp"/>
        <main class="col-xs-12 col-sm-8 offset-sm-4 col-lg-9 offset-lg-3 col-xl-10 offset-xl-2 pt-3 pl-4">
            <jsp:include page="../topNavbar.jsp"/>
            <section class="row">
                <div class="col-lg-1">
                </div>
                <div class="col-lg-10">
                    <section class="row">
                        <div class="col-md-12">
                            <h4 class="subheading">
                                Immigration Details
                            </h4>
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
                            <h4 class="subheading">
                                Immigration Document Upload
                            </h4>
                            <spring:url value="/immiUploads" var="immiActionUrl"/>
                            <form:form method="POST" modelAttribute="immiUploadObj" action="immiUpload"
                                       enctype="multipart/form-data" id="immiUploadId">
                                <input type="hidden" id="immiModalDisplayFlag" value="${immiModal}"/>
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
                                    <div class="form-group row col-md-6">
                                        <label class="form-control-label col-lg-4"
                                               for="timesheetStatus">Status: </label>
                                        <span id="timesheetStatus" class="text-right"> ${timesheetStatus} </span>
                                    </div>
                                </div>

                                <p>Please Upload the immigration documents(pdf/image)</p>

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
                                <!-- Begin Buttons -->
                                <div class="d-flex justify-content-center">
                                    <div>
                                        <input type="submit" class="btn btn-success" value="Submit"/>
                                    </div>
                                </div>
                            </form:form>
                            <hr>
                            <h4 class="subheading">
                                Immigration Document Summary
                            </h4>
                            <div class="table-responsive">
                                <table id="immigrationDocs" class="table table-striped table-bordered"
                                       cellspacing="0" width="100%">
                                    <thead>
                                    <tr>
                                        <th>Document Id</th>
                                        <th>Document Name</th>
                                        <th>Document Type</th>
                                        <th>Uploaded Date</th>
                                        <th>Comments</th>
                                        <th>View</th>
                                    </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </section>
                    <section class="row">
                        <div class="col-12 mt-1 mb-4">Copy Right by
                            <a href="http://www.Employee Management App.com/">
                                Employee Management App Inc.,</a>
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