window.actionApp.initializers.push(function() {
  $('.take-action-button').click( function(evt) {
    evt.preventDefault();
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
