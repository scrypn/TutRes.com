$(document).ready(function () {
    var bool = true;
    $('.slicknav_nav').show()
    $(".menuh").on('click', function () {

        if (bool) {
            $("#mobile_menu").attr('title', "Закрыть меню")
            bool = false;
            $(this).find(".hambergerIcon").addClass("open");

            $('html').one('click', function () {
                $('.slicknav_nav').removeClass("slicknav_hidden").removeClass("open_nav")
                $("#mobile_menu").attr('title', "Открыть меню");
                $('.menuh').find(".hambergerIcon").removeClass("open");
                bool = true;
            });
            $('.slicknav_nav').removeClass("slicknav_hidden").addClass("open_nav").click(function (event) {
                event.stopPropagation();
            });
        } else {
            $('.slicknav_nav').removeClass("slicknav_hidden").removeClass("open_nav")
            $("#mobile_menu").attr('title', "Открыть меню")
            $(this).find(".hambergerIcon").removeClass("open");
            bool = true;
        }
        event.stopPropagation();
    });
    /*$(window).resize(function(e) {
        let width = e.target.innerWidth;
        if(width > 1700) {
            document.getElementById("drop_subjects").style.transform = 'scaleY(0)';
            document.getElementById("drop_subjects").style.opacity = '0';
            $('.menu').find(".hambergerIcon").removeClass("open");
            bool = true;
        }
    });*/
})
