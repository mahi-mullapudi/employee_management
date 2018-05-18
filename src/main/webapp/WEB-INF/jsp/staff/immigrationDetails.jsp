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
                            <spring:url value="/immiDetails" var="immiActionUrl"/>
                            <form:form method="POST" modelAttribute="immigrationDetails" action="${immiActionUrl}">

                                <form:hidden path="immiDetailsId"/>
                                <div class="row">

                                    <spring:bind path="currentStatus">
                                        <div class="form-group col-md-6 ${status.error ? 'has-danger' : ''} snears-vendor-info">
                                            <label class="form-control-label" for="currentStatus">Current
                                                Status</label>
                                            <div class="inputGroupContainer">
                                                <form:select path="currentStatus" placeholder="Current Status"
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
                                                            placeholder="Client Address" data-toggle="tooltip"
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
                                            <label class="form-control-label" for="lcaNumber">LCA Number</label>
                                            <div class="inputGroupContainer">
                                                <form:input path="lcaNumber" maxlength="50"
                                                            id="lcaNumber"
                                                            placeholder="LCA Number" data-toggle="tooltip"
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
                                            <label class="form-control-label" for="startDate">Start Date</label>
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
                                            <label class="form-control-label" for="endDate">LCA Number</label>
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
                            </form:form>
                            <hr>
                            <h4 class="subheading">
                                Immigration Document Upload
                            </h4>
                            <form:form method="POST" enctype="multipart/form-data" action="">

                            </form:form>
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
                        <div class="col-12 mt-1 mb-4">Copy Right by <a href="http://www.Employee Management App.com/">Employee
                            Management App
                            Inc.,</a></div>
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