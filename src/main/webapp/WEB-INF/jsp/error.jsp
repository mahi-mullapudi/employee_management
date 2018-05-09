<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600" media="screen" rel="stylesheet"/>
    <link href="/agriculture/AG_ECAS/css/bootstrap.min.css" rel="stylesheet">
    <link href="/agriculture/AG_ECAS/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="/agriculture/AG_ECAS/css/error-styles.css" rel="stylesheet" type="text/css">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title> Error Page </title>

</head>

<body class="background error-page-wrapper background-color">

<div class="content-container shadow">
    <div class="locals">
        <img id="errorImg" src="/agriculture/AG_ECAS/images/error.png" alt=""/>
    </div>
    <div class="subheader primary-text-color">
        ${ecasErrorInfo.errorMessage}
    </div>
    <div class="context secondary-text-color">
        ${ecasErrorInfo.errorCode}
    </div>
    <div class="subheader primary-text-color">
        ${ecasErrorInfo.errorDetails}
    </div>
    <div class="hr"></div>
    <div class="context secondary-text-color">
        <p>
            Go back to the previous page and try again.
            If you think something is broken, report a problem.
        </p>
    </div>
    <div class="hr"></div>
    <button id="takeMeEcasHomeButton" type="button" class="btn btn-md btn-success takeMeEcasHomeButton"
            onClick="window.location.href = '/AG_ECAS/ecasHome'">
        <i class="fa fa-home"></i>
        Return to Contracts Home
    </button>
    <button id="reportErrorButton" type="button" class="btn btn-md btn-success reportButton"
            onClick="sendErrorViaEmail('${_csrf.headerName}', '${_csrf.token}', '${ecasErrorInfo.getErrorCode()}', '${ecasErrorInfo.getErrorMessage()}', '${ecasErrorInfo.getErrorDetails()}'
                    , '${ecasErrorInfo.getLoggedInUser()}', '${ecasErrorInfo.getSessionId()}', '${ecasErrorInfo.getTimeStamp()}', `${ecasErrorInfo.getStackTrace()}`)">
        <i class="fa fa-envelop-square"></i>
        Report Problem
    </button>

</div>

<script src="/agriculture/AG_ECAS/js/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script src="/AG_ECAS/js/error.js"></script>


</body>
</html>
