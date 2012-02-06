$(document).ready(function () {
  $("nav#menu ul li").hover(
      function () {
        $("ul", this).css(
          {
            left: $(this).width() + "px",
            top: $(this).height() + "px"
          }
        )
        $('>ul', this).slideDown(100);
      },
      function () {
        $('ul', this).slideUp(100);
      }
  )
})
