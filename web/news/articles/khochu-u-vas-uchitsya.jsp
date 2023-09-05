<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="description" content="Обучение у репетиторов TutRes.com">
    <jsp:include page="/includes/links.jsp"/>
    <title>Как стать учеником портала — TutRes.com</title>
</head>
<body>
<div class="full_code">
    <jsp:include page="/includes/header.jsp"/>
    <jsp:include page="/includes/slider.jsp"/>
    <jsp:include page="/news/news-viewer-template.jsp"/>
    <script>

        $("#section-title-slider-text").text("Хочу у вас учиться")
        $("#news-date").text("инструкция")
        $("#section-title-slider-block").show()
        $("#img-news-viewer").attr("src", main_site_path + "vectors/learner.svg");
        $("#title-news-viewer").html('Хочу у вас учиться')
        $("#text-news-viewer").html('Хочешь найти репетитора по приемлемой цене и качественно готовиться к экзаменам, тогда ты по адресу. В составе репетиторов не только опытные учителя и педогоги,\n' +
            '        но и учащиеся старших классов и студенты. В чём разница? Всё просто - студенты имеют меньше знаний чем учителя, но при этом объясняют темы(низкой и средней сложности в силу своей частичной неопытности)\n' +
            '        порой интереснее и доходчевее, чем это сделают некоторые преподаватели (да и берут за занятие они по-меньше*). Будем рады видеть тебя среди учеников!\n' +
            'Ознакомиться с инструкциями добавления/удаления репетиторов вы можете в предметном разделе либо <a href="' + main_site_path + 'news/articles/tutrescom-portal-online-repetitorstva">здесь</a>')
    </script>

</div>
<jsp:include page="/includes/footer.jsp"/>
</body>
</html>