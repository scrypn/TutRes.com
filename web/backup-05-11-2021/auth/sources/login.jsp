<script>
    if (getCookie("user") !== undefined) toHomePage();

    $("#section-title-slider-text").text("Вход в аккаунт")
    $("#section-title-slider-block").show()
</script>


<div class="job_details_area" id="login">
    <div class="container">
        <div class="row">
            <div class="apply_job_form white-bg" style="margin-right: auto; margin-left: auto; max-width: 700px">
                <h4 style="color: rgb(146, 117, 250);" class="wow fadeInLeft" data-wow-duration="1s"
                    data-wow-delay=".1s">Вход в систему</h4>
                <form method="POST" novalidate autocomplete="on" id="login_form" action="javascript:void(0);">
                    <div class="row">
                        <div class="col-md-8 wow fadeInRight" data-wow-duration="1s" data-wow-delay=".15s"
                             style="margin-right: auto; margin-left: auto">
                            <div class="mein-labels">Email</div>
                            <div class="input_field">
                                <input type="email" class="mein-inputs" maxlength="50" required id="email_log"
                                       name="email"/>
                            </div>
                        </div>
                        <div class="col-md-8 wow fadeInRight" data-wow-duration="1s" data-wow-delay=".2s"
                             style="margin-right: auto; margin-left: auto">
                            <div class="mein-labels">Пароль</div>
                            <div class="input_field" style="position: relative">
                                <input type="password" class="mein-inputs" required maxlength="20" id="pass_log"
                                       name="pass"/>
                                <a class="password-control" id="password-control-3"></a>
                            </div>
                        </div>
                        <div class="col-md-6 wow fadeInUp" data-wow-duration="1s" data-wow-delay=".25s"
                             style="margin-right: auto; margin-left: auto">
                            <button class="buttons" id="sub_log" style="margin: 50px 0 0 0; width: 100%">Войти</button>
                        </div>
                        <div class="col-md-12 wow fadeInLeft" style="margin-top: 70px" data-wow-duration="1s"
                             data-wow-delay=".3s">
                            <div align="center"><a href="${pageContext.request.contextPath}/auth/create-account">
                                Создать новый аккаунт <i class="fa fa-user-plus"></i></a></div>
                        </div>
                        <div class="col-md-12 wow fadeInLeft" style="margin-top: 15px" data-wow-duration="1s"
                             data-wow-delay=".3s">
                            <div align="center"><a href="${pageContext.request.contextPath}/auth/forget-password">
                                Забыли пароль<i class="fa fa-question"></i></a></div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $("#password-control-3").mousedown(function () {
            $(this).addClass('view');
            $('#pass_log').attr('type', 'text');
            $(document).one("mouseup", function () {
                $("#password-control-3").removeClass('view');
                $('#pass_log').attr('type', 'password');
                return false;
            });
            return false;
        }).on('touchstart', function () {
            $(this).addClass('view');
            $('#pass_log').attr('type', 'text');
            $(this).on('touchend', function () {
                $("#password-control-3").removeClass('view');
                $('#pass_log').attr('type', 'password');
                return false;
            });
            return false;
        });

        $("#sub_log").click(
            function () {
                if (getCookie("user") === undefined) {
                    load_yes();
                    sendLoginForm('login_form', login_servlet_path, 'login');
                } else {
                    swal.fire({
                        title: "Ошибка операции",
                        text: "Судя по всему, вы уже вошли в аккаунт",
                        icon: "error",
                        footer: '<a style="color: rgb(72, 31, 187); cursor: pointer; font-size: 20px" onclick="toFeedBackPage()">Вопросы? Обратитесь к нам</a>',
                    }).then((result) => {
                        toHomePage();
                    });
                    document.body.style.paddingRight = '0';
                }

                return false;
            }
        );
    });
    anim_func("#login");
</script>

