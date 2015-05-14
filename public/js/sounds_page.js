$(document).ready(function(){
  $('.sounds-button').addClass("disabled secondary");
  $('#switcher').click(function(e) {
    e.preventDefault();
    if ($('.sounds_list').text() === "Soundcloud tracks") {
      $('.sounds_list').text("KALW stories")
    } else {
      $('.sounds_list').text("Soundcloud tracks")
    }
    $('.noises').toggleClass("hide");
  });
});
