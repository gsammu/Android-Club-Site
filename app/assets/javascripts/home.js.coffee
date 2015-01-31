# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.signinCallback = (authResult)->
  if (authResult['status']['signed_in'])
    # Update the app to reflect a signed in user
    console.log(authResult)
    # Hide the sign-in button now that the user is authorized, for example:
    $('#gPlusSigninButton').hide()
  else
    # Update the app to reflect a signed out user
    # Possible error values:
    #   "user_signed_out" - User is signed-out
    #   "access_denied" - User denied access to your app
    #   "immediate_failed" - Could not automatically log in the user
    console.log("Sign-in state: #{ authResult['error'] }")