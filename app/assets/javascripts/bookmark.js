$(document).ready(function(){
  $(".bookmark-btn").click(function(event){
    var target = $(event.target);
    var id = target.attr('id');
    var eventId = id.split('-')[1];
    var url = "/events/" + eventId + "/bookmark";
    $.ajax({
      type: "GET",
      url: url
    })
  });
});
