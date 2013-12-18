/*global $:false */
/*global document:false */
/*global jQuery:false */

(function($) {
  //custom tab click event
  $.fn.custom_tab_click = function (event) {
    //check other tab button
    $("a[id^='tab_btn_']").each(function( index ) {
      if($(this).hasClass("btn-primary")){
        $(this).removeClass("btn-primary");
        $(this).addClass("btn-default");
      }
    });
    
    //make the button as a primary
    $(this).addClass("btn-primary");
    
    //list coverlist
    $("div[id^='tab_content_']").addClass("hidden");
    $($(this).data("target")).removeClass("hidden");
  };
})(jQuery);