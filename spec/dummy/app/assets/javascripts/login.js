// Turn the browserid_button into a link to the browserid authentication service
// assumes that the 
$(document).ready( function() {

  $('#browserid_button').bind('click', function(e) {
      e.preventDefault();

      navigator.id.getVerifiedEmail(function(assertion) {
          if (assertion) {
            $('#browserid_assertion').val(assertion.toString());
            $('#browserid_form').submit();
          }
        });

  });
  
});
