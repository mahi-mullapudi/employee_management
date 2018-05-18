<header class="page-header row justify-center">
    <div class="col-md-6 col-lg-8">
        <h1 class="float-left text-center text-md-left">Employee Management Application</h1>
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
