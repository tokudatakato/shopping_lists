$(document).ready(function () {
  $('.js-trigger').on('click', function(){
    $('.sidebar').toggleClass('open-sidebar');
    $('.main-contents').toggleClass('slide-right');
  });
});

