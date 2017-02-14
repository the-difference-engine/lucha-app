$(document).ready(function(){
  $(".sidebar-nav a").on("click", function(){
     $(".sidebar-nav").find(".active").removeClass("active");
     $(this).parent().addClass("active");
  });
  $(function(){
    function stripTrailingSlash(str) {
      if(str.substr(-1) == '/') {
        return str.substr(0, str.length - 1);
      }
      return str;
    }

    var url = window.location.pathname;
    var activePage = stripTrailingSlash(url);

    $('.nav li a').each(function(){
      var currentPage = stripTrailingSlash($(this).attr('href'));

      if (activePage == currentPage) {
        $(this).parent().addClass('active');
      }
    });
  });
});
