<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="description"
          content="Представляем вам новый раздел сайта - Физика. Начни дополнительно заниматься предметом на TutRes.com">
    <jsp:include page="/includes/links.jsp"/>
    <title>Физика – запускаем новый раздел сайта — TutRes.com</title>
</head>
<body>
<div class="full_code">
    <jsp:include page="/includes/header.jsp"/>
    <jsp:include page="/includes/slider.jsp"/>
    <jsp:include page="/news/news-viewer-template.jsp"/>
    <script>

        $("#section-title-slider-text").text("Запускаем раздел \"Физика\"")
        $("#news-date").text("новость от 10.10.2020")
        $("#section-title-slider-block").show()
        $("#img-news-viewer").attr("src", main_site_path + "vectors/physics.svg");
        $("#title-news-viewer").html('Запускаем раздел \"Физика\"')
        $("#text-news-viewer").html('<p>Привет, сегодня TutRes.com рада представить вам новый раздел портала - <a href="' + main_site_path + 'subjects/phys">"Физика"</a>!<br>\n' +
            '        Всё также просто, как и в разделе <a href="' + main_site_path + 'subjects/maths">"Математика"</a>.\n' +
            ' С инструкциями по предметам вы можете ознакомиться в разделе нужного вам предмета либо <a ' +
            'href="' + main_site_path + 'news/articles/tutrescom-portal-online-repetitorstva">здесь</a></p>\n' +
            '       Также мы добавили выбор предметов, которыми вы планируете заниматься с репетитором, в окно регистрации, исправили ошибки в работе Личного кабинета, усовершенствовали\n' +
            '       алгоритм обновления ваших данных, поработали с дизайном и т.п.)\n' +
            '       Надеемся, вы останетесь довольны как новым разделом, так и всем обновлением в целом!<br>Приятных занятий!  <i style="color: #00D363" class="fa fa-smile-o"></i>')
    </script>

</div>
<jsp:include page="/includes/footer.jsp"/>
</body>
</html>