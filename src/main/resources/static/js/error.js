
function sendErrorViaEmail(csrfHeader, csrfToken, errorCode, errorMessage, errorDetails,
		loggedInUser, sessionId, timeStamp, stackTrace)
{
	var data = {
		"errorCode" : errorCode,
		"errorMessage" : errorMessage,
		"errorDetails" : errorDetails,
		"loggedInUser" : loggedInUser,
		"sessionId" : sessionId,
		"timeStamp" : timeStamp,
		"stackTrace" : stackTrace
	}
	
	$.ajax({
        type: "POST",	                
        dataType: 'json',
        beforeSend: function(request) {
            request.setRequestHeader(csrfHeader, csrfToken);
            request.setRequestHeader("content-type","application/json");
          },
        url: "/AG_ECAS/email/",
        data: JSON.stringify(data),	                
        timeout: 600000,
        success: function (data) {
        	console.log('Email with error details sent successfully');
        	disableReportErrorButton();
        },
        error: function (e) {
        	console.log('Failed to send error details email', e);
        }
	});
}


function disableReportErrorButton()
{
	$('.reportButton').addClass('disabled');
	$('.reportButton').text("Error reported...");
}

