(function() {

  window.setTimeout(function(){
    $('.alert').fadeOut();
  }, 2000)
  window.load_sound_file("/media/audio/iknow.mp3");

  var $image = $('#image'),
        $button = $('#play_iknow');

        $image.hide();
  $button.click(function(e) {
    e.preventDefault();
    stop_sound();
    play_sound();
    $image.show();
    $button.hide();
  });

  $image.click(function(e) {
    e.preventDefault();
    stop_sound();
    $image.hide();
    $button.show();
  })

}).call(this);