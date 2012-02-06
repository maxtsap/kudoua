$(document).ready(function () {
  $("nav#menu ul li").hover(
    function () {
      if ($(this).attr('id') === undefined) {
        $("ul", this).css(
          {
            left:($(this).position().left + $(this).width()) + "px",
            top:$(this).height() + "px"
          }
        )
      }
      $('>ul', this).toggle(100);
    }
  )
})
