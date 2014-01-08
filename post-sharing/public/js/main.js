window.fbAsyncInit = function() {
	FB.init({
		appId      : '183003591910669',                        // App ID from the app dashboard
		status     : true,                                 // Check Facebook Login status
		xfbml      : true                                  // Look for social plugins on the page
	});

	FB.Event.subscribe('auth.authResponseChange', function(response) {
		console.log(response);
		if (response.status === 'connected') {
			$("#sharing-submit").show();
			$("#sharing-authtoken").val(response.authResponse.accessToken);
		} else if (response.status === 'not_authorized') {
			FB.login(function(response) {
			// handle the response
		}, {scope: 'email,publish_actions'});
		} else {
			FB.login(function(response) {
			// handle the response
			}, {scope: 'email,publish_actions'});
		}
	});

};

$(document).ready(fbAsyncInit);

// Load the SDK asynchronously
(function(){
// If we've already installed the SDK, we're done
if (document.getElementById('facebook-jssdk')) {return;}

// Get the first script element, which we'll use to find the parent node
var firstScriptElement = document.getElementsByTagName('script')[0];

// Create a new script element and set its id
var facebookJS = document.createElement('script');
facebookJS.id = 'facebook-jssdk';

// Set the new script's source to the source of the Facebook JS SDK
facebookJS.src = '//connect.facebook.net/en_GB/all.js';

// Insert the Facebook JS SDK into the DOM
firstScriptElement.parentNode.insertBefore(facebookJS, firstScriptElement);
}());
