<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="description" content="Как стать репетитором и преподавать уже с 16 лет на TutRes.com?">
    <jsp:include page="/includes/links.jsp"/>
    <title>Как стать репетитором и преподавать уже с 16 лет — TutRes.com</title>
</head>
<body>
<div class="full_code">
    <jsp:include page="/includes/header.jsp"/>
    <jsp:include page="/includes/slider.jsp"/>
    <jsp:include page="/news/news-viewer-template.jsp"/>
    <script>

        $("#section-title-slider-text").text("Хочу стать репетитором")
        $("#news-date").text("инструкция")
        $("#section-title-slider-block").show()
        $("#img-news-viewer").attr("src", main_site_path + "vectors/tutor.svg");
        $("#title-news-viewer").html('Хочу стать репетитором')
        $("#text-news-viewer").html('Есть свободное время и ты готов потратить его с толком? Можем тебе предложить вступить в ряды репетиторов TutRes.com. Неважно, студент ты, школьник\n' +
            '        или преподаватель, главное, чтобы тебе было чему научить и нравилось делать это. Зарегистрироваться как репетитор вы можете <a onclick="news_viewer_3_to_reg_page()">здесь</a>.<br>\n' +
            'Ознакомиться с инструкциями добавления/удаления учеников вы можете в предметном разделе либо <a href="' + main_site_path + 'news/articles/tutrescom-portal-online-repetitorstva">здесь</a>' +
            '        Важное замечание: По умолчанию аккаунт зарегистрировавшегося репетитора не активен, для его активации следует обратиться\n' +
            '        по электронной почте <a href="mailto:support@tutres.com">support@tutres.com</a>, либо, используя <a href="' + main_site_path + 'usr/feedback">форму обратной связи</a>')
    </script>

</div>
<script>
    function news_viewer_3_to_reg_page() {
        if (getCookie("user") === undefined) toRegPage();
        else ntf("Вы уже авторизованы", "Вы уже выполнили вход в систему, для регистрации ещё одного аккаунта вам необходимо изначально произвести выход из данного.", "error");
    }

</script>
<jsp:include page="/includes/footer.jsp"/>
</body>
</html>