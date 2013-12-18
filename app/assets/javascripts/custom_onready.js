/*global $:false */
/*global document:false */
/*global jQuery:false */

(function($) {
  $(document).ready(function () {
    //bind custom tab button click event
    $("a[id^='tab_btn_']").bind('click', null, $.fn.custom_tab_click);
  });
})(jQuery);