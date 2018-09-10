<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <meta name="description" content="">

    <meta name="author" content="Mahidhar Mullapudi">

    <link rel="icon" href="images/favicon.ico">

    <title>Employee Management App Charts</title>

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
        <nav class="sidebar col-xs-12 col-sm-4 col-lg-3 col-xl-2 bg-faded sidebar-style-1">
            <h1 class="site-title">
                <a href="/employeeManagement/dashboard">

                    <img src="./images/company_logo.jpg" class="img-fluid">
                </a>
            </h1>

            <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">
                <em class="fa fa-bars"></em>
            </a>

            <ul class="nav nav-pills flex-column sidebar-nav">
                <li class="nav-item">
                    <a class="nav-link active" href="/employeeManagement/dashboard">
                        <em class="fa fa-dashboard"></em>
                        Dashboard <span class="sr-only">(current)</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/employeeManagement/reports">
                        <em class="fa fa-bar-chart"></em> Reports
                    </a>
                </li>
            </ul>
        </nav>

        <main class="col-xs-12 col-sm-8 offset-sm-4 col-lg-9 offset-lg-3 col-xl-10 offset-xl-2 pt-3 pl-4">
            <header class="page-header row justify-center">
                <div class="col-md-6 col-lg-8">
                    <h1 class="float-left text-center text-md-left">Charts</h1>
                </div>

                <div class="dropdown user-dropdown col-md-6 col-lg-4 text-center text-md-right"><a
                        class="btn btn-stripped dropdown-toggle" href="https://example.com" id="dropdownMenuLink"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <img src="images/profile-pic.png" alt="profile photo" class="circle float-left profile-photo"
                         width="50" height="auto">

                    <div class="username mt-1">
                        <h4 class="mb-1">testuser</h4>

                        <h6 class="text-muted">Employee</h6>
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
                        <div class="col-12 mb-2">
                            <div class="card mb-4">
                                <div class="card-block">
                                    <h3 class="card-title">Line Chart</h3>

                                    <div class="dropdown card-title-btn-container">
                                        <button class="btn btn-sm btn-subtle dropdown-toggle" type="button"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <em class="fa fa-cog"></em>
                                        </button>

                                        <div class="dropdown-menu dropdown-menu-right"
                                             aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#"><em
                                                class="fa fa-search mr-1"></em> More info </a>
                                            <a class="dropdown-item" href="#"><em class="fa fa-thumb-tack mr-1"></em>
                                                Pin Window</a>
                                            <a class="dropdown-item" href="#"><em class="fa fa-remove mr-1"></em> Close
                                                Window</a>
                                        </div>
                                    </div>

                                    <h6 class="card-subtitle mb-2 text-muted">Sample Data</h6>

                                    <div class="canvas-wrapper">
                                        <canvas class="main-chart" id="line-chart" height="200" width="600"></canvas>
                                    </div>
                                </div>
                            </div>

                            <div class="card mb-4">
                                <div class="card-block">
                                    <h3 class="card-title">Line Chart</h3>

                                    <div class="dropdown card-title-btn-container">
                                        <button class="btn btn-sm btn-subtle dropdown-toggle" type="button"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><em
                                                class="fa fa-cog"></em></button>

                                        <div class="dropdown-menu dropdown-menu-right"
                                             aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#"><em
                                                class="fa fa-search mr-1"></em> More info</a>
                                            <a class="dropdown-item" href="#"><em class="fa fa-thumb-tack mr-1"></em>
                                                Pin Window</a>
                                            <a class="dropdown-item" href="#"><em class="fa fa-remove mr-1"></em> Close
                                                Window</a></div>
                                    </div>

                                    <h6 class="card-subtitle mb-2 text-muted">Sample Data</h6>

                                    <div class="canvas-wrapper">
                                        <canvas class="main-chart" id="bar-chart" height="200" width="600"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-12 col-md-6 ">
                            <div class="card mb-4">
                                <div class="card-block">
                                    <h3 class="card-title">Donut Chart</h3>

                                    <div class="dropdown card-title-btn-container">
                                        <button class="btn btn-sm btn-subtle dropdown-toggle" type="button"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><em
                                                class="fa fa-cog"></em></button>

                                        <div class="dropdown-menu dropdown-menu-right"
                                             aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#"><em
                                                class="fa fa-search mr-1"></em> More info</a>
                                            <a class="dropdown-item" href="#"><em class="fa fa-thumb-tack mr-1"></em>
                                                Pin Window</a>
                                            <a class="dropdown-item" href="#"><em class="fa fa-remove mr-1"></em> Close
                                                Window</a></div>
                                    </div>

                                    <h6 class="card-subtitle mb-2 text-muted">Sample Data</h6>

                                    <div class="canvas-wrapper">
                                        <canvas class="main-chart" id="doughnut-chart" height="300"
                                                width="600"></canvas>
                                    </div>
                                </div>
                            </div>

                            <div class="card mb-4">
                                <div class="card-block">
                                    <h3 class="card-title">Pie Chart</h3>

                                    <div class="dropdown card-title-btn-container">
                                        <button class="btn btn-sm btn-subtle dropdown-toggle" type="button"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><em
                                                class="fa fa-cog"></em></button>

                                        <div class="dropdown-menu dropdown-menu-right"
                                             aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#"><em
                                                class="fa fa-search mr-1"></em> More info</a>
                                            <a class="dropdown-item" href="#"><em class="fa fa-thumb-tack mr-1"></em>
                                                Pin Window</a>
                                            <a class="dropdown-item" href="#"><em class="fa fa-remove mr-1"></em> Close
                                                Window</a></div>
                                    </div>

                                    <h6 class="card-subtitle mb-2 text-muted">Sample Data</h6>

                                    <div class="canvas-wrapper">
                                        <canvas class="main-chart" id="pie-chart" height="300" width="600"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-12 col-md-6">
                            <div class="card mb-4">
                                <div class="card-block">
                                    <h3 class="card-title">Radar Chart</h3>

                                    <div class="dropdown card-title-btn-container">
                                        <button class="btn btn-sm btn-subtle dropdown-toggle" type="button"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><em
                                                class="fa fa-cog"></em></button>

                                        <div class="dropdown-menu dropdown-menu-right"
                                             aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#"><em
                                                class="fa fa-search mr-1"></em> More info</a>
                                            <a class="dropdown-item" href="#"><em class="fa fa-thumb-tack mr-1"></em>
                                                Pin Window</a>
                                            <a class="dropdown-item" href="#"><em class="fa fa-remove mr-1"></em> Close
                                                Window</a></div>
                                    </div>

                                    <h6 class="card-subtitle mb-2 text-muted">Sample Data</h6>

                                    <div class="canvas-wrapper">
                                        <canvas class="main-chart" id="radar-chart" height="300" width="600"></canvas>
                                    </div>
                                </div>
                            </div>

                            <div class="card mb-4">
                                <div class="card-block">
                                    <h3 class="card-title">Polar Area Chart</h3>

                                    <div class="dropdown card-title-btn-container">
                                        <button class="btn btn-sm btn-subtle dropdown-toggle" type="button"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><em
                                                class="fa fa-cog"></em></button>

                                        <div class="dropdown-menu dropdown-menu-right"
                                             aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#"><em
                                                class="fa fa-search mr-1"></em> More info</a>
                                            <a class="dropdown-item" href="#"><em class="fa fa-thumb-tack mr-1"></em>
                                                Pin Window</a>
                                            <a class="dropdown-item" href="#"><em class="fa fa-remove mr-1"></em> Close
                                                Window</a></div>
                                    </div>

                                    <h6 class="card-subtitle mb-2 text-muted">Sample Data</h6>

                                    <div class="canvas-wrapper">
                                        <canvas class="main-chart" id="polar-area-chart" height="300"
                                                width="600"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4 mb-2">
                            <div class="card mb-3 text-center ">
                                <div class="card-block">
                                    <div class="easypiechart" id="easypiechart-1" data-percent="25"></div>

                                    <h5 class="mt-2 mb-1">Label 1</h5>

                                    <p class="mb-1">25%</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4 mb-2">
                            <div class="card mb-3 text-center ">
                                <div class="card-block">
                                    <div class="easypiechart" id="easypiechart-2" data-percent="50"></div>

                                    <h5 class="mt-2 mb-1">Label 2</h5>

                                    <p class="mb-1">50%</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4 mb-2">
                            <div class="card mb-3 text-center ">
                                <div class="card-block">
                                    <div class="easypiechart" id="easypiechart-3" data-percent="75"></div>

                                    <h5 class="mt-2 mb-1">Label 3</h5>

                                    <p class="mb-1">75%</p>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="row">
                        <div class="col-12 mt-1 mb-4">Copy Right by <a href="http://www.Employee Management App.com/">Employee Management App
                            Inc.,</a>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
        integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
        crossorigin="anonymous"></script>
<script src="./js/external/bootstrap.min.js"></script>

<script src="./js/external/chart.min.js"></script>
<script src="./js/external/chart-data.js"></script>
<script src="./js/external/easypiechart.js"></script>
<script src="./js/external/easypiechart-data.js"></script>
<script src="./js/external/bootstrap-datetimepicker.min.js"></script>

<script>
    window.onload = function () {
        var chart1 = document.getElementById("line-chart").getContext("2d");
        window.myLine = new Chart(chart1).Line(lineChartData, {
            responsive: true,
            scaleLineColor: "rgba(0,0,0,.2)",
            scaleGridLineColor: "rgba(0,0,0,.05)",
            scaleFontColor: "#c5c7cc"
        });
        var chart2 = document.getElementById("bar-chart").getContext("2d");
        window.myBar = new Chart(chart2).Bar(barChartData, {
            responsive: true,
            scaleLineColor: "rgba(0,0,0,.2)",
            scaleGridLineColor: "rgba(0,0,0,.05)",
            scaleFontColor: "#c5c7cc"
        });
        var chart3 = document.getElementById("doughnut-chart").getContext("2d");
        window.myDoughnut = new Chart(chart3).Doughnut(doughnutData, {
            responsive: true,
            segmentShowStroke: false
        });
        var chart4 = document.getElementById("pie-chart").getContext("2d");
        window.myPie = new Chart(chart4).Pie(pieData, {
            responsive: true,
            segmentShowStroke: false
        });
        var chart5 = document.getElementById("radar-chart").getContext("2d");
        window.myRadarChart = new Chart(chart5).Radar(radarData, {
            responsive: true,
            scaleLineColor: "rgba(0,0,0,.05)",
            angleLineColor: "rgba(0,0,0,.2)"
        });
        var chart6 = document.getElementById("polar-area-chart").getContext("2d");
        window.myPolarAreaChart = new Chart(chart6).PolarArea(polarData, {
            responsive: true,
            scaleLineColor: "rgba(0,0,0,.2)",
            segmentShowStroke: false
        });
    };
</script>

</body>
</html>
