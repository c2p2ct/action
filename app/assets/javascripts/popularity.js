window.actionApp.initializers.push(function() {
  $(".take-action-button").on("click", function(evt) {
    evt.preventDefault();

    $.ajax({
      url: $(evt.target).data("url"),
      type: 'PUT'
    });
  });
});
