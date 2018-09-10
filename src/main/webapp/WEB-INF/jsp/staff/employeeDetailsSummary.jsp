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
    <title>Employee Details Summary</title>
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
                    <h1 class="float-left text-center text-md-left">Employee Details Summary</h1>
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
                            <div class="card mb-4">
                                <div class="card-block">
                                    <h3 class="card-title">Employee Details Summary</h3>
                                    <hr>
                                    <div class="table-responsive">
                                        <table id="empDetailsSummaryTable" class="table table-striped table-bordered"
                                               cellspacing="0" width="100%">
                                            <thead>
                                            <tr>
                                                <th>Employee Id</th>
                                                <th>Employee Name</th>
                                                <th>Email</th>
                                                <th>Phone</th>
                                                <th>Company Name</th>
                                                <th>Employee Title</th>
                                                <th>View/Edit</th>
                                            </tr>
                                            </thead>

                                            <tfoot>
                                            <tr>
                                                <th>Employee Id</th>
                                                <th>Employee Name</th>
                                                <th>Email</th>
                                                <th>Phone</th>
                                                <th>Company Name</th>
                                                <th>Employee Title</th>
                                                <th>View/Edit</th>
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
<script src="./js/employeeDetailsSummary.js"></script>

</body>
</html>
