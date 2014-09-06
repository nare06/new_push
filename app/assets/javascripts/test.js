  $(document).ready(function() {
    $('#event_sdatetime').datetimepicker({
    step:15,
    format:'d/m/Y g:i A',
    formatTime:'g:i A',
    timepicker: true,
    lang: 'en',
    minDate: '-1970/01/01'});
  });
   $(document).ready(function() {
    $('#event_edatetime').datetimepicker({
    step:15,
    format:'d/m/Y g:i A',
    formatTime:'g:i A',
    timepicker: true,
    lang: 'en',
    minDate: '-1970/01/01'});
  });
   $(document).ready(function() {
    $('#event_startdatesearch').datetimepicker({
    step:15,
    format:'d/m/Y',
    //formatTime:'g:i A',
    timepicker: false,
    lang: 'en',
    minDate: '-1970/01/01'});
  });
   $(document).ready(function() {
    $('#event_enddatesearch').datetimepicker({
    step:15,
    format:'d/m/Y',
    //formatTime:'g:i A',
    timepicker: false,
    lang: 'en',
    minDate: '-1970/01/01'});
  });
 
$(document).ready(function(){
     $(window).scroll(function () {
            if ($(this).scrollTop() > 50) {
                $('#back-to-top').fadeIn();
            } else {
                $('#back-to-top').fadeOut();
            }
        });
        // scroll body to 0px on click
        $('#back-to-top').click(function () {
            $('#back-to-top').tooltip('hide');
            $('body,html').animate({
                scrollTop: 0
            }, 800);
            return false;
        });
        
        $('#back-to-top').tooltip('show');

});
$( document ).ready(function() {
    $("[rel='tooltip']").tooltip();    
 
    $('.thumbnail').hover(
        function(){
            $(this).find('.caption').slideDown(250); //.fadeIn(250)
        },
        function(){
            $(this).find('.caption').slideUp(250); //.fadeOut(205)
        }
    ); 
});
$( document ).ready(function () {
  var all_classes = "";
  var timer = undefined;
  $.each($('li', '.social-class'), function (index, element) {
    all_classes += " btn-" + $(element).data("code");
  });
  $('li', '.social-class').mouseenter(function () {
    var icon_name = $(this).data("code");
    if ($(this).data("icon")) {
      icon_name = $(this).data("icon");
    }
    var icon = "<i class='fa fa-" + icon_name + "'></i>";
    $('.btn-social', '.social-sizes').html(icon + "Sign in with " + $(this).data("name"));
    $('.btn-social-icon', '.social-sizes').html(icon);
    $('.btn', '.social-sizes').removeClass(all_classes);
    $('.btn', '.social-sizes').addClass("btn-" + $(this).data('code'));
  });
  $($('li', '.social-class')[Math.floor($('li', '.social-class').length * Math.random())]).mouseenter();
});
(function($) {
    $.fn.goTo = function() {
        $('html, body').animate({
            scrollTop: $(this).offset().top + 'px'
        }, 'fast');
        return this; // for chaining...
    }
})(jQuery);
//Buttons in Feedback form
$(document).ready(function () {
    $('#button1').on('click', function () {
        var text = $('#feedback_name');
        text.val('Feedback: ');    
    });
});
$(document).ready(function () {
    $('#button2').on('click', function () {
        var text = $('#feedback_name');
        text.val('Bug Report: ');    
    });
});
$(document).ready(function () {
    $('#button3').on('click', function () {
        var text = $('#feedback_name');
        text.val('Hey wassup!');    
    });
});
////end
///////slider
$(document).ready(function() {
  $('#media').carousel({
    pause: true,
    interval: false
  });
});
$(document).ready(function() {
  $('#media1').carousel({
    pause: true,
    interval: false
    
  });
});
$(document).ready(function() {
 var $container = $('#media'),
    scroll = $container.width();
    $('a.right.carousel-control').hover(function() {
    $container.animate({
        'scrollLeft': scroll
    }, '500');
}, function(){
    $container.stop();
});
});
//////hover
