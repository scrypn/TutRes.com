<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="description" content="Разрабатываем новый раздел сайта TutRes.com — Другие предметы">
    <jsp:include page="/includes/links.jsp"/>
    <title>Разработка нового раздела — TutRes.com</title>
</head>
<body>
<div class="full_code">
    <jsp:include page="/includes/header.jsp"/>
    <jsp:include page="/includes/slider.jsp"/>
    <jsp:include page="/news/news-viewer-template.jsp"/>
    <script>

        $("#section-title-slider-text").text("\"Другие предметы\" - скоро")
        $("#news-date").text("новость от 03.12.2020")
        $("#section-title-slider-block").show()
        $("#img-news-viewer").attr("src", main_site_path + "vectors/web-development.svg");
        $("#title-news-viewer").html('"Другие предметы" - разрабатываем новый раздел сайта')
        $("#text-news-viewer").html('"Другие предметы" - раздел, который будет включать в себя все предметные области сайта TutRes.com, которые ещё не получили ' +
            'своего раздела. К примеру, на момент написания статьи уже существуют отдельные разделы "Математика" и "Физика", значит, в новый раздел будут входить ' +
            'все предметы сайта, кроме указанных ранее. Таким образом, мы повысим количество предметных областей на сайте ВО МНООГО РАЗ и во столько же повысим ваше желание ' +
            'прокачивать свои навыки или изучать что-то новенькое и интересненькое с репетиторами портала TutRes.com')
    </script>

</div>
<jsp:include page="/includes/footer.jsp"/>
</body>
</html>