(function ($) {
    $.fn.labelauty = function (tag) {
        
        //判断是否选中
           rdochecked(tag);
  
            //单选
            $(".rdobox").click(function () {
                $(this).prev().prop("checked", "checked");
                rdochecked(tag);
            });
        
        //判断是否选中
        function rdochecked(tag) {
            $('.' + tag).each(function (i) {
                var rdobox = $('.' + tag).eq(i).next();
                if ($('.' + tag).eq(i).prop("checked") == false) {
                    rdobox.removeClass("checked");
                    rdobox.addClass("unchecked");    
                }
                else {
                    rdobox.removeClass("unchecked");
                    rdobox.addClass("checked");
                    rdobox.find(".check-image").css("background", "url(../images/input-checked.png) no-repeat");
                }
            });
        }
    }
}(jQuery));
$(".rdolist").labelauty("rdolist");