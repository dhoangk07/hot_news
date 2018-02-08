$(document).ready(function(){
  $(".source-link").click(function(event){
    var target = $(event.target);
    var id = target.attr('id');
    var eventId = id.split('-')[2];
    var url = "/events/" + eventId + "/increase_view_count";
  	$.ajax({
      type: "GET",
      url: url
     })
  });
});


