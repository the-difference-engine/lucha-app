$(document).ready(function() {
  if ($("#language-select").val() == "Other"){
    $("#other-input").show();
  } 

  $("#language-select").change(function() {
    if ($("#language-select").val() == "Other") {
      $("#other-input").fadeIn('fast');
    } else {
      $("#other-input").fadeOut('fast');
    }
  })

});




// $(function() {
//   $('span.best_in_place[data-html-attrs]').each(function() {
//     var attrs, el;
//     el = $(this);
//     attrs = el.data('html-attrs');
//     if (attrs && attrs['tabindex']) {
//       el.attr('tabindex', attrs['tabindex']);
//     }
//   }).focus(function() {
//     var el;
//     el = $(this);
//     el.click();
//   });
// });
