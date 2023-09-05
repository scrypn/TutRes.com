<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.io.UnsupportedEncodingException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    public static String redirectTo(String url) {
        String to = url;
        try {
            to = URLEncoder.encode(url, StandardCharsets.UTF_8.toString());
        }catch (Exception e){
            e.printStackTrace();
        }
        return "https://r.scryp.ru?url=" + to;
    }
%>
<html>
<head>
    <meta name="description" content="TutRes.com — портал онлайн репетиторства. Здесь вы можете заниматься дополнительно с репетитором за адекватные деньги, а также и сами
    можете стать репетитором уже с 16 ЛЕТ, что является хорошей практикой для школьников и студентов в оттачивании своих предметных знаний, ещё и получая за это деньги. Сделайте
вместе с нами важный шаг к репетиторству на TutRes.com">
    <jsp:include page="/includes/links.jsp"/>

    <title>TutRes.com — репетиторство высокого разрешения</title>
</head>
<body>
<div class="full_code">
    <jsp:include page="/includes/header.jsp"/>
    <jsp:include page="/includes/slider.jsp"/>
    <script>$("#tutres-title-slider-block").show()</script>
    <%--<div class="alert alert-warning alert-dismissible wow fadeInDown custom-bootstrap-alerts" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <strong>Holy guacamole!</strong> You should check in on some of those fields below.
    </div>--%>
    <div class="catagory_area">
        <section class="blog_area section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 mb-5 mb-lg-0">
                        <div class="section_title mb-40">
                            <h3>Последние новости</h3>
                        </div>
                        <div class="blog_left_sidebar">
                            <div class="row">
                                <article class="blog_item col-md-6 wow fadeInLeft" data-wow-duration="1s"
                                         data-wow-delay=".15s">
                                    <div class="blog_item_img">
                                        <div style="width: 300px; height: 300px; margin-right: auto; margin-left: auto">
                                            <img class="card-img rounded-0"
                                                 src="${pageContext.request.contextPath}/vectors/books.svg" width="300"
                                                 height="300" alt="PHYS.TUTOREA.RU"></div>
                                    </div>

                                    <div class="blog_details news">
                                        <div class="blog_item_img">
                                            <a href="${pageContext.request.contextPath}/news/articles/zapuskaem-3-novyh-razdela-news-16-12-2020"
                                               class="blog_item_date">
                                                <h3>Новенькое!</h3>
                                                <p>Запускаем сразу 3 новых раздела сайта <i
                                                        class="fa fa-arrow-right"></i></p>
                                                <h3 style="font-size: 14px; margin-top: 10px; text-align: center">
                                                    новость от 16.12.2020</h3>
                                            </a>

                                        </div>
                                    </div>
                                </article>
                                <article class="blog_item col-md-6 wow fadeInLeft" data-wow-duration="1s"
                                         data-wow-delay=".15s">
                                    <div class="blog_item_img">
                                        <div style="width: 300px; height: 300px; margin-right: auto; margin-left: auto">
                                            <img class="card-img rounded-0"
                                                 src="${pageContext.request.contextPath}/vectors/web-development.svg"
                                                 width="300" height="300" alt="PHYS.TUTOREA.RU"></div>
                                    </div>

                                    <div class="blog_details news">
                                        <div class="blog_item_img">
                                            <a href="${pageContext.request.contextPath}/news/articles/razrabativaem-noviy-razdel-drugie-predmety"
                                               class="blog_item_date">
                                                <h3>Другие предметы</h3>
                                                <p>Разрабатываем новый раздел сайта <i class="fa fa-code"></i></p>
                                                <h3 style="font-size: 14px; margin-top: 10px; text-align: center">
                                                    новость от 03.12.2020</h3>
                                            </a>

                                        </div>
                                    </div>
                                </article>
                                <article class="blog_item col-md-6 wow fadeInLeft" data-wow-duration="1s"
                                         data-wow-delay=".15s">
                                    <div class="blog_item_img">
                                        <div style="width: 300px; height: 300px; margin-right: auto; margin-left: auto">
                                            <img class="card-img rounded-0"
                                                 src="${pageContext.request.contextPath}/vectors/physics.svg"
                                                 width="300"
                                                 height="300" alt="PHYS.TUTOREA.RU"></div>
                                    </div>

                                    <div class="blog_details news">
                                        <div class="blog_item_img">
                                            <a href="${pageContext.request.contextPath}/news/articles/zapuskaem-razdel-phisika"
                                               class="blog_item_date">
                                                <h3>Физика</h3>
                                                <p>Запускаем раздел <i class="fa fa-arrow-right"></i></p>
                                                <h3 style="font-size: 14px; margin-top: 10px; text-align: center">
                                                    новость от 10.10.2020</h3>
                                            </a>

                                        </div>
                                    </div>
                                </article>

                                <article class="blog_item col-md-6 wow fadeInLeft" data-wow-duration="1s"
                                         data-wow-delay=".15s">
                                    <div class="blog_item_img">
                                        <div style="width: 300px; height: 300px; margin-right: auto; margin-left: auto">
                                            <img class="card-img rounded-0"
                                                 src="${pageContext.request.contextPath}/vectors/favicon.svg"
                                                 width="300"
                                                 height="300" alt="PHYS.TUTOREA.RU"></div>
                                    </div>

                                    <div class="blog_details news">
                                        <div class="blog_item_img">
                                            <a href="${pageContext.request.contextPath}/news/articles/tutrescom-portal-online-repetitorstva"
                                               class="blog_item_date">

                                                <h3>TutRes.com</h3>
                                                <p>репетиторство высокого разрешения <i class="fa fa-arrow-right"></i>
                                                </p>
                                                <h3 style="font-size: 14px; margin-top: 10px; text-align: center">
                                                    описание, инструкции</h3>
                                            </a>

                                        </div>
                                    </div>
                                </article>
                                <div class="col-md-12" style="margin-top: 50px" align="center"><a
                                        style="font-size: 18px" href="${pageContext.request.contextPath}/news/">Хочу
                                    больше <i
                                            class="fa fa-arrow-right"></i></a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <div class="job_listing_area wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".2s"
         id="subjects-home-container">
        <div class="container">
            <div class="row"><%--align-items-center--%>
                <div class="col-lg-6">
                    <div class="section_title text-center">
                        <h3>Математика</h3>
                    </div>
                    <div class="col-lg-12">
                        <div class="recent_joblist_wrap">
                            <div class="recent_joblist white-bg ">
                                <div class="row align-items-center">
                                    <div class="col-md-12">
                                        <h4 id="title-student-tutor-maths-home">Загрузка...</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="job_lists m-0">
                            <div class="row" id="tutor-maths-container-home">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="section_title text-center">
                        <h3>Физика</h3>
                    </div>
                    <div class="col-lg-12">
                        <div class="recent_joblist_wrap">
                            <div class="recent_joblist white-bg ">
                                <div class="row align-items-center">
                                    <div class="col-md-12">
                                        <h4 id="title-student-tutor-phys-home">Загрузка...</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="job_lists m-0">
                            <div class="row" id="tutor-phys-container-home">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="section_title text-center">
                        <h3>Информатика</h3>
                    </div>
                    <div class="col-lg-12">
                        <div class="recent_joblist_wrap">
                            <div class="recent_joblist white-bg ">
                                <div class="row align-items-center">
                                    <div class="col-md-12">
                                        <h4 id="title-student-tutor-cs-home">Загрузка...</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="job_lists m-0">
                            <div class="row" id="tutor-cs-container-home">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="section_title text-center">
                        <h3>Программирование</h3>
                    </div>
                    <div class="col-lg-12">
                        <div class="recent_joblist_wrap">
                            <div class="recent_joblist white-bg ">
                                <div class="row align-items-center">
                                    <div class="col-md-12">
                                        <h4 id="title-student-tutor-programming-home">Загрузка...</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="job_lists m-0">
                            <div class="row" id="tutor-programming-container-home">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        getSepSubData("#title-student-tutor-maths-home", "#tutor-maths-container-home", main_site_path + "vectors/group.svg", "Математика", 3)
        getSepSubData("#title-student-tutor-phys-home", "#tutor-phys-container-home", main_site_path + "vectors/group.svg", "Физика", 3)
        getSepSubData("#title-student-tutor-cs-home", "#tutor-cs-container-home", main_site_path + "vectors/group.svg", "Информатика", 3)
        getSepSubData("#title-student-tutor-programming-home", "#tutor-programming-container-home", main_site_path + "vectors/group.svg", "Программирование", 3)
    </script>
    <div class="featured_candidates_area wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".25s">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section_title text-center mb-40">
                        <h3>Крутые статьи сторонних источников</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="candidate_active owl-carousel">
                        <div class="single_candidates text-center">
                            <div class="thumb">
                                <img src="${pageContext.request.contextPath}/vectors/java.svg" width="110" height="110"
                                     alt="">
                            </div>
                            <a href="<%= redirectTo("https://metanit.com/java/tutorial/1.1.php")%>" target="_blank"><h4>Изучение языка
                                программирования JAVA <i class="fa fa-arrow-right"></i></h4></a>
                            <p>Источник: www.metanit.com</p>
                        </div>
                        <div class="single_candidates text-center">
                            <div class="thumb">
                                <img src="${pageContext.request.contextPath}/vectors/formula.svg" alt="">
                            </div>
                            <a href="<%= redirectTo("https://habr.com/ru/post/246747/")%>" target="_blank"><h4>Откуда пошло комплексное
                                число <i class="fa fa-arrow-right"></i></h4></a>
                            <p>Источник: www.habr.com</p>
                        </div>
                        <div class="single_candidates text-center">
                            <div class="thumb">
                                <img src="${pageContext.request.contextPath}/vectors/android.svg" alt="">
                            </div>
                            <a href="<%= redirectTo("https://metanit.com/java/android/")%>" target="_blank"><h4>Android - разработка
                                мобильных приложений <i class="fa fa-arrow-right"></i></h4></a>
                            <p>Источник: www.metanit.com</p>
                        </div>
                        <div class="single_candidates text-center">
                            <div class="thumb">
                                <img src="${pageContext.request.contextPath}/vectors/formula.svg" alt="">
                            </div>
                            <a href="<%= redirectTo("https://ru.wikipedia.org/wiki/%D0%9B%D0%BE%D0%B3%D0%B0%D1%80%D0%B8%D1%84%D0%BC")%>"
                               target="_blank"><h4>Логарифмы, алгебра 10-11 класс <i class="fa fa-arrow-right"></i></h4>
                            </a>
                            <p>Источник: www.wikipedia.org</p>
                        </div>
                        <div class="single_candidates text-center">
                            <div class="thumb">
                                <img src="${pageContext.request.contextPath}/vectors/hash.svg" alt="">
                            </div>
                            <a href="<%= redirectTo("https://www.kaspersky.ru/blog/the-wonders-of-hashing/3633/")%>" target="_blank"><h4>
                                Хеширование == безопасное хранение паролей <i class="fa fa-arrow-right"></i></h4></a>
                            <p>Источник: www.kaspersky.ru</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>

    </script>
    <%--<div class="job_searcing_wrap overlay">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 offset-lg-1 col-md-6">
                    <div class="searching_text">
                        <h3>Looking for a Job?</h3>
                        <p>We provide online instant cash loans with quick approval </p>
                        <a href="#" class="boxed-btn3">Browse Job</a>
                        <ul class="mein-submenu">
                            <li><a onclick="toUserDataAgreementPage()" style="cursor: pointer">Политика конфиденциальности </a></li>
                            <li><a onclick="toUserAgreementPage()" style="cursor: pointer">Пользовательское Соглашение </a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-5 offset-lg-1 col-md-6">
                    <div class="searching_text">
                        <h3>Looking for a Expert?</h3>
                        <p>We provide online instant cash loans with quick approval </p>
                        <a href="#" class="boxed-btn3">Post a Job</a>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>
    <div class="testimonial_area wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".3s">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section_title text-center mb-40">
                        <h3>Пользователю</h3>
                    </div>
                </div>
                <div class="col-xl-12">
                    <div class="testmonial_active owl-carousel">
                        <div class="single_carousel">
                            <div class="row">
                                <div class="col-lg-11">
                                    <div class="single_testmonial d-flex align-items-center">
                                        <div class="thumb">
                                            <img src="${pageContext.request.contextPath}/vectors/favicon.svg"
                                                 width="228" height="228" alt="">
                                            <div class="quote_icon">
                                                <i style="margin-top: 40%" class="fa fa-quote-right"></i>
                                            </div>
                                        </div>
                                        <div class="info">
                                            <p>
                                                Рады приветствовать вас на TutRes.com!<br>
                                                Хочешь у нас учиться? Тогда мы поможем тебе найти репетитора своей
                                                мечты.<br>
                                                Не угадали? Хочешь стать репетитором TutRes.com? С радостью поможем тебе
                                                в этом.<br>
                                                Появились вопросы? В таком случае вы можете онакомиться с <a
                                                    href="${pageContext.request.contextPath}/news/articles/tutrescom-portal-online-repetitorstva">инструкциями
                                                сайта</a> или же написать нам через <a
                                                    href="${pageContext.request.contextPath}/usr/feedback">форму
                                                обратной связи</a>.
                                            </p>
                                            <span>- <a href="">tutres.com</a></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="single_carousel">
                            <div class="row">
                                <div class="col-lg-11">
                                    <div class="single_testmonial d-flex align-items-center">
                                        <div class="thumb">
                                            <img src="${pageContext.request.contextPath}/vectors/favicon.svg"
                                                 width="228" height="228" alt="">
                                            <div class="quote_icon">
                                                <i style="margin-top: 40%" class="fa fa-quote-right"></i>
                                            </div>
                                        </div>
                                        <div class="info">
                                            <p>Надо много учиться, чтобы знать хоть немного.</p>
                                            <span>- Шарль Луи Монтескье</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="single_carousel">
                            <div class="row">
                                <div class="col-lg-11">
                                    <div class="single_testmonial d-flex align-items-center">
                                        <div class="thumb">
                                            <img src="${pageContext.request.contextPath}/vectors/favicon.svg"
                                                 width="228" height="228" alt="">
                                            <div class="quote_icon">
                                                <i style="margin-top: 40%" class="fa fa-quote-right"></i>
                                            </div>
                                        </div>
                                        <div class="info">
                                            <p>Актуальные новости о нашем портале вы можете найти <a
                                                    href="${pageContext.request.contextPath}/news/">здесь</a></p>
                                            <span>- <a href="">tutres.com</a></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="single_carousel">
                            <div class="row">
                                <div class="col-lg-11">
                                    <div class="single_testmonial d-flex align-items-center">
                                        <div class="thumb">
                                            <img src="${pageContext.request.contextPath}/vectors/favicon.svg"
                                                 width="228" height="228" alt="">
                                            <div class="quote_icon">
                                                <i style="margin-top: 40%" class="fa fa-quote-right"></i>
                                            </div>
                                        </div>
                                        <div class="info">
                                            <p>В учении нельзя останавливаться.</p>
                                            <span>- Сюнь-цзы</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="single_carousel">
                            <div class="row">
                                <div class="col-lg-11">
                                    <div class="single_testmonial d-flex align-items-center">
                                        <div class="thumb">
                                            <img src="${pageContext.request.contextPath}/vectors/favicon.svg"
                                                 width="228" height="228" alt="">
                                            <div class="quote_icon">
                                                <i style="margin-top: 40%" class="fa fa-quote-right"></i>
                                            </div>
                                        </div>
                                        <div class="info">
                                            <p>Ознакомиться с <a
                                                    href="${pageContext.request.contextPath}/policies/privacy-policy">Политикой
                                                конфиденциальности</a> и
                                                <a href="${pageContext.request.contextPath}/policies/terms">Пользовательским
                                                    соглашением</a> - дело нужное
                                            </p>
                                            <span>- <a href="">tutres.com</a></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="single_carousel">
                            <div class="row">
                                <div class="col-lg-11">
                                    <div class="single_testmonial d-flex align-items-center">
                                        <div class="thumb">
                                            <img src="${pageContext.request.contextPath}/vectors/favicon.svg"
                                                 width="228" height="228" alt="">
                                            <div class="quote_icon">
                                                <i style="margin-top: 40%" class="fa fa-quote-right"></i>
                                            </div>
                                        </div>
                                        <div class="info">
                                            <p>Забыли пароль от аккаунта? Ничего страшного в этом нет. Вашу проблему
                                                решит простое <a
                                                        href="${pageContext.request.contextPath}/auth/forget-password">восстановление
                                                    пароля</a>.<br>
                                                Если вы уже авторизованы на сайте, то сменить пароль можно в <a
                                                        href="${pageContext.request.contextPath}/usr/personal-cabinet">личном
                                                    кабинете</a>.</p>
                                            <span>- <a href="">tutres.com</a></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="single_carousel">
                            <div class="row">
                                <div class="col-lg-11">
                                    <div class="single_testmonial d-flex align-items-center">
                                        <div class="thumb">
                                            <img src="${pageContext.request.contextPath}/vectors/favicon.svg"
                                                 width="228" height="228" alt="">
                                            <div class="quote_icon">
                                                <i style="margin-top: 40%" class="fa fa-quote-right"></i>
                                            </div>
                                        </div>
                                        <div class="info">
                                            <p>Есть вопросы, предложения, замечание касаемо портала? Пишите нам и мы с
                                                радостью вам ответим!</p>
                                            <p>Наши контакты <i class="fa fa-address-card-o"></i></p>
                                            <p>
                                            <ul>
                                                <li><a href="${pageContext.request.contextPath}/usr/feedback">форма
                                                    обратной связи</a></li>
                                                <li>почтовый адрес <a href="mailto:support@tutres.com">support@tutres.com</a>
                                                </li>
                                                <li>соц.сети (указаны ниже <i class="fa fa-arrow-down"></i>)</li>
                                            </ul>
                                            </p>
                                            <span>- <a href="">tutres.com</a></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/includes/footer.jsp"/>
<script src="${pageContext.request.contextPath}/js/cookies.js"></script>
</body>
</html>
