$(document).ready(function(){
    $(".hide-btn").click(function(event){
      var target = $(event.target);
      $(target).parents('.event-wrapper').hide();
    });
});
