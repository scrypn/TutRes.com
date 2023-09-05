<header>
    <div class="header-area">
        <div id="sticky-header" class="main-header-area" style="height: inherit">
            <div class="container-fluid " style="height: inherit">
                <div class="header_bottom_border">
                    <div class="row align-items-center" id="header-row" style="position: relative;">
                        <div id="logo-container">
                            <div class="logo" style="width: inherit; height: inherit">
                                <a href="${pageContext.request.contextPath}/" style="width: inherit">
                                    <img src="${pageContext.request.contextPath}/vectors/logo.svg"
                                         style="width: inherit; height: inherit" alt="" id="logo-header">
                                </a>
                            </div>
                        </div>
                        <div class="menuh" id="mobile_menu" title="Открыть меню">
                            <div class="hambergerIcon"></div>
                        </div>
                        <div style="position: absolute; left: 50%; width: 70%; margin-left: -35%">
                            <div class="main-menu  d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">
                                        <li><a href="${pageContext.request.contextPath}/">Домой</a></li>
                                        <li><a href="https://www.scryp.ru/user/feedback">Обратная связь</a></li>
                                        <li><a><span id="find-tutor-header">Найти репетитора</span> <i
                                                class="ti-angle-down"></i></a>
                                            <ul class="submenu">
                                                <li><a href="${pageContext.request.contextPath}/subjects/maths"
                                                       style="cursor: pointer">Математика</a></li>
                                                <li><a href="${pageContext.request.contextPath}/subjects/phys"
                                                       style="cursor: pointer">Физика</a></li>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/subjects/computer-science"
                                                       style="cursor: pointer">Информатика</a></li>
                                                <li><a href="${pageContext.request.contextPath}/subjects/programming"
                                                       style="cursor: pointer">Программирование</a></li>
                                                <li><a href="${pageContext.request.contextPath}/subjects/"
                                                       style="cursor: pointer">Другие</a></li>
                                            </ul>
                                        </li>
                                        <li><a>Scryp.ru <i class="ti-angle-down"></i></a>
                                            <ul class="submenu">
                                                <li><a href="https://www.scryp.ru/" target="_blank">Официальный сайт</a>
                                                </li>
                                                <li><a href="https://mail.scryp.ru/" target="_blank">Почта</a></li>
                                                <li><a href="https://app.scryp.ru/" target="_blank">Программы</a></li>
                                                <li><a href="https://cloud.scryp.ru/" target="_blank">Облако</a></li>
                                                <li><a href="https://test.scryp.ru/" target="_blank">Тесты</a></li>
                                            </ul>
                                        </li>
                                        <li><a>Другое <i class="ti-angle-down"></i></a>
                                            <ul class="submenu">
                                                <li><a href="${pageContext.request.contextPath}/news/"
                                                       style="cursor: pointer">Новости портала</a></li>
                                                <li><a href="${pageContext.request.contextPath}/about/"
                                                       style="cursor: pointer">Об авторе </a></li>
                                                <li><a href="${pageContext.request.contextPath}/policies/privacy-policy"
                                                       style="cursor: pointer">Политика конфиденциальности </a></li>
                                                <li><a href="${pageContext.request.contextPath}/policies/terms"
                                                       style="cursor: pointer">Пользовательское Соглашение </a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 d-lg-block"
                             style="position: absolute; right: 0; padding: 0;width: fit-content">
                            <div class="Appointment" style="top: 0">
                                <div class="phone_num" id="reg-header">
                                    <a href="${pageContext.request.contextPath}/auth/create-account">Нет аккаунта?</a>
                                </div>
                                <div class="phone_num" id="name-header" style="display: none">
                                    <div id="name-header-div"
                                         style="cursor:pointer; font-size: 18px; color: white; text-align: right"
                                         onclick="toLKPage()"></div>
                                </div>
                                <div class="d-lg-block">
                                    <div class="enter-container"></div>
                                    <div class="main-menu" id="lk-header" style="display: none; margin-top: 30px">
                                        <ul>
                                            <li style="margin: 0"><img
                                                    src="${pageContext.request.contextPath}/vectors/user.svg"
                                                    id="user-img-header" width="58" height="88"
                                                    style="cursor: pointer; padding-bottom: 30px">
                                                <ul class="submenu" id="lk_header_dropdowner">
                                                    <li class="dropdown-elements"><a
                                                            href="${pageContext.request.contextPath}/usr/personal-cabinet">
                                                        Личный кабинет</a></li>
                                                    <li class="dropdown-elements"><a onclick="lkExit()"
                                                                                     style="color: red;"> Выйти</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</header>

<!--<div id="darker"></div>-->
<!--<div id="loader"></div>-->
<div id="loader-ellipsis" class="lds-ellipsis">
    <div></div>
    <div></div>
    <div></div>
    <div></div>
</div>
<div id="darker"></div>

<script>
    var user = getCookie("user");
    if (getCookie("user") !== undefined) {
        $("#log-header").hide();
        $("#reg-header").hide();
        $("#lk-header").show();
        $("#name-header-div").html(user.split("/")[0] + " " + user.split("/")[1] + "<br>" + user.split("/")[3]);
        if ($(window).width() > 1300) {
            $("#name-header").show();
        }
        $(window).resize(function () {
            if ($(window).width() > 1300) {
                $("#name-header").show();
            } else {
                $("#name-header").hide();
            }
        });
        if (user.split("/")[3] === 'Репетитор') {
            $('#find-tutor-header').text("Запросы");
            $('#slider-button-text').text("Запросы");

        }
    } else {
        var log_header_mini = "<a id=\"log-header-mini\" class=\"boxed-btn3\" style=\"max-width: 40px; max-height: 32px;" +
            " padding: 4px 8px; border-radius: 7px\" href=" + main_site_path + "auth/sign-in><i style=\"font-size: 24px\" class=\"fa fa-sign-in\"></i></a>";
        var log_header = "<a id=\"log-header\" class=\"boxed-btn3\" href=" + main_site_path + "auth/sign-in>Войти</a>"

        if ($(window).width() > 991) {
            $(".enter-container").html(log_header);
        } else $(".enter-container").html(log_header_mini);

        $(window).resize(function () {
            if ($(window).width() > 991) {
                $(".enter-container").html(log_header);
            } else {
                $(".enter-container").html(log_header_mini);
            }
        });
    }
    if (domain === "debug.tutres.com") {
        if (getCookie("auth") === undefined) {
            document.location = main_site_path + "security/403"
        }
    }

    /*alert(window.location.hostname)*/
</script>
<script src="${pageContext.request.contextPath}/js/cookies.js"></script>
<script>download_cookies_data()</script>