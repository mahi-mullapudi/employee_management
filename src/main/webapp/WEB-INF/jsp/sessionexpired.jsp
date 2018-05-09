<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600" media="screen" rel="stylesheet"/>
    <link href="/agriculture/AG_ECAS/css/bootstrap.min.css" rel="stylesheet">
    <link href="/agriculture/AG_ECAS/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="/agriculture/AG_ECAS/css/font-awesome-animation.min.css" rel="stylesheet"
          type="text/css">
    <link href="/agriculture/AG_ECAS/css/error-styles.css" rel="stylesheet" type="text/css">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title> ${ecasErrorInfo.pageHeader} </title>

</head>

<body class="background error-page-wrapper background-color">

<div class="content-container shadow">
    <div class="head-line secondary-text-color">
        ${ecasErrorInfo.errorCode}
    </div>
    <div class="subheader primary-text-color">
        <div></div>
        <i class="fa fa-sign-out faa-flash animated"></i><span class="right"> ${ecasErrorInfo.errorMessage} </span>
    </div>
    <div class="hr"></div>
    <div class="context secondary-text-color">
        ${ecasErrorInfo.errorDetails}
    </div>
    <div class="hr"></div>
    <div>
        <button id="takeMeEcasHomeButton" type="button" class="btn btn-md btn-success takeMeEcasHomeButton"
                onClick="window.location.href = '${portalUrl}'">
            <i class="fa fa-home"></i>Login to NJ Portal
        </button>
    </div>
</div>
<script src="/agriculture/AG_ECAS/js/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
</body>
</html>
