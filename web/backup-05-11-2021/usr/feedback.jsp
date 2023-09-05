<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="description"
          content="Если у вас возникли какие-то проблемы при использовании Scryp-сервисов или хотите сообщить об ошибке, напишите нам здесь, либо на почту support@scryp.ru">
    <title>Scryp.ru — Обратная связь</title>
</head>
<body>
<%
    String redirectURL = "https://www.scryp.ru/user/feedback";
    response.sendRedirect(redirectURL);
%>
</body>
</html>
