<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.Date" %>
<%!
    public static String redirectTo(String url) {
        String to = url;
        try {
            to = URLEncoder.encode(url, StandardCharsets.UTF_8.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "https://r.scryp.ru?url=" + to;
    }
%>
<footer class="footer">
    <div class="footer_top">
        <div class="container">
            <div class="row">
                <div class="col-xl-3 col-md-6 col-lg-3">
                    <div class="footer_widget wow fadeInUp" data-wow-duration="1s" data-wow-delay=".3s">
                        <div class="footer_logo">
                            <a href="${pageContext.request.contextPath}/">
                                <img src="${pageContext.request.contextPath}/vectors/logo.svg" id="logo-footer" alt="">
                            </a>
                        </div>
                        <p>Любое использование либо копирование материалов или подборки материалов сайта,
                            элементов дизайна и оформления допускается лишь с разрешения правообладателя и только со
                            ссылкой на источник:
                            <a href="${pageContext.request.contextPath}/"
                               title="TutRes.com — репетиторство высокого разрешения" style="cursor: pointer">www.tutres.com</a>
                        </p>
                        <p>
                            <a href="mailto:support@tutres.com">support@tutres.com</a> <br>
                            <a href="tel:+79184759741">+7 916 581 40 24</a> <br>
                            <a href="https://www.scryp.ru/" target="_blank">Николай Скрипниченко</a><br><br>
                            <a href="${pageContext.request.contextPath}/policies/privacy-policy"
                               title="Политика конфиденциальности и обработки персональных данных"
                               style="cursor: pointer">
                                • Политика конфиденциальности</a><br>
                            <a href="${pageContext.request.contextPath}/policies/terms"
                               title="Пользовательское соглашение" style="cursor: pointer">
                                • Пользовательское соглашение</a><br><br>
                            Icons made by <a href="<%= redirectTo("https://www.freepik.com/")%>" target="_blank"
                                             title="Freepik">Freepik</a>
                            from <a href="<%= redirectTo("https://www.flaticon.com/")%>" target="_blank"
                                    title="Flaticon">www.flaticon.com</a>.<br>
                            Site's template made by <a href="<%= redirectTo("https://colorlib.com")%>" target="_blank"
                                                       title="Colorlib">Colorlib</a>.<br>
                            Template's changes and site's backend made by <a href="https://www.scryp.ru/"
                                                                             target="_blank">Nikolay Skripnichenko</a>.
                        </p>
                        <div class="socail_links">
                            <ul>
                                <li>
                                    <a href="<%= redirectTo("https://vk.com/tutrescom")%>" target="_blank">
                                        <i class="fa fa-vk"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="<%= redirectTo("https://wa.me/79165814024")%>" target="_blank">
                                        <i class="fa fa-whatsapp"></i>
                                    </a>
                                </li>

                                <li>
                                    <a href="<%= redirectTo("https://twitter.com/ClausWeiter")%>" target="_blank">
                                        <i class="fa fa-twitter"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="<%= redirectTo("https://www.instagram.com/nick_scryp/")%>" target="_blank">
                                        <i class="fa fa-instagram"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="<%= redirectTo("https://www.t.me/nikolay_skrip")%>" target="_blank">
                                        <i class="fa fa-telegram"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>

                    </div>
                </div>
                <div class="col-xl-2 col-md-6 col-lg-2">
                    <div class="footer_widget wow fadeInUp" data-wow-duration="1.1s" data-wow-delay=".4s">
                        <h3 class="footer_title">
                            Предметы
                        </h3>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/subjects/maths" style="cursor: pointer">Математика</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/subjects/phys" style="cursor: pointer">Физика</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/subjects/computer-science"
                                   style="cursor: pointer">Информатика</a></li>
                            <li><a href="${pageContext.request.contextPath}/subjects/programming"
                                   style="cursor: pointer">Программирование</a></li>
                            <li><a href="${pageContext.request.contextPath}/subjects/"
                                   style="cursor: pointer">Другие</a></li>
                        </ul>

                    </div>
                </div>
                <div class="col-xl-3 col-md-6 col-lg-3">
                    <div class="footer_widget wow fadeInUp" data-wow-duration="1.2s" data-wow-delay=".5s">
                        <h3 class="footer_title">
                            Другое
                        </h3>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/auth/sign-in" id="footer_login"
                                   style="cursor: pointer">Вход в систему <i class="fa fa-sign-in"></i></a></li>
                            <li><a href="${pageContext.request.contextPath}/auth/create-account" id="footer_reg"
                                   style="cursor: pointer">Создать аккаунт <i class="fa fa-user-plus"></i></a></li>
                            <li><a href="${pageContext.request.contextPath}/auth/forget-password" id="footer_cp"
                                   style="cursor: pointer">Восстановить пароль <i class="fa fa-refresh"></i></a></li>
                            <li><a href="${pageContext.request.contextPath}/usr/personal-cabinet" id="footer_lk"
                                   style="cursor: pointer; display: none">Личный кабинет <i
                                    class="fa fa-user-circle"></i></a></li>
                            <li><a href="https://www.scryp.ru/user/feedback" target="_blank" style="cursor: pointer">Обратная
                                связь <i class="fa fa-comments-o"></i></a></li>
                            <li><a href="${pageContext.request.contextPath}/news/" style="cursor: pointer">Новости <i
                                    class="fa fa-newspaper-o"></i></a></li>
                            <li><a onclick="lkExit()" id="footer_exit">
                                Выйти из аккаунта <i class="fa fa-sign-out"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-xl-4 col-md-6 col-lg-4">
                    <div class="footer_widget wow fadeInUp" data-wow-duration="1.3s" data-wow-delay=".6s">
                        <h3 class="footer_title">
                            Рассылка
                        </h3>
                        <form action="javascript:void(0);" class="newsletter_form">
                            <input type="text" disabled placeholder="Временно недоступно">
                            <button type="submit">Подписаться*</button>
                        </form>
                        <p class="newsletter_text">Подпишись на рассылку и следи за всем самым интересным от
                            TutRes.com<br><br>
                            *Подписываясь на рассылку, вы принимаете условия <a
                                    href="${pageContext.request.contextPath}/policies/privacy-policy">Политики
                                конфиденциальности</a> и
                            <a href="${pageContext.request.contextPath}/policies/terms">Пользовательского соглашения</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="copy-right_text wow fadeInUp" data-wow-duration="1.4s" data-wow-delay=".3s">
        <div class="container">
            <div class="footer_border"></div>
            <div class="row">
                <div class="col-xl-12">
                    <p class="copy_right text-center">
                        Copyright &copy;<%=new Date().getYear() + 1900%>
                        <a href="https://www.scryp.ru/" target="_blank">Nikolay Skripnichenko, Scryp.ru</a>. All rights
                        reserved.
                    </p>
                </div>
            </div>
        </div>
    </div>
</footer>
<script>
    if (getCookie("user") !== undefined) {
        $("#footer_login").hide()
        $("#footer_reg").hide()
        $("#footer_cp").hide()
        $("#footer_lk").show()
        $("#footer_exit").show()
    }
</script>