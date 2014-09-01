$(function() {
$('#toggleButton').click( function() {
  $('#AllActionsPanel').toggle('5000');
  $('#footer').toggle('5000', function(){
 if ($('#AllActionsPanel').is(':visible')) {
  $('#toggleButton').val('Hide') 
 } else {
  $('#toggleButton').val('Show') 
   }
    });
  });
});
