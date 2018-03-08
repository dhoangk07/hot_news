$(document).ready(function(){
  $(".hide-btn").click(function(event){
    var target = $(event.target);
    $(target).parents('.event-wrapper').hide();
    var id = target.attr('id');
    var eventId = id.split('-')[1];
    var url = "/events/" + eventId + "/hide";
    $.ajax({
      type: "GET",
      url: url
    })
  });
});
