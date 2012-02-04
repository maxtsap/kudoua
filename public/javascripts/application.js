$(document).ready(function () {
  $("nav#menu ul li").hover(
      function () {
        $('>ul', this).slideDown(100);
      },
      function () {
        $('ul', this).slideUp(100);
      }
  )
})
