<script>
    if (getCookie("user") !== undefined) toHomePage();

    $("#section-title-slider-text").text("Восстановление пароля")
    $("#section-title-slider-block").show()
</script>
<div class="job_details_area" id="fp-email-container">
    <div class="container">
        <div class="row">
            <div class="apply_job_form white-bg" style="margin-right: auto; margin-left: auto; max-width: 700px">
                <h4 style="color: rgb(146, 117, 250);" class="wow fadeInLeft" data-wow-duration="1s"
                    data-wow-delay=".1s">Восстановление пароля</h4>
                <h5 style="color: #00D363" class="wow fadeInLeft col-md-10" data-wow-duration="1s"
                    data-wow-delay=".15s">Забыли пароль? Ничего страшного, сейчас создадим новый.
                    Для начала введите email-адрес, на который зарегистрирован ваш аккаунт TutRes.com</h5>
                <form novalidate method="POST" autocomplete="on" action="javascript:void(0);">
                    <div class="row">
                        <div class="col-md-6 wow fadeInRight" style="margin: 20px auto" data-wow-duration="1s"
                             data-wow-delay=".2s">
                            <div class="mein-labels">Email</div>
                            <div class="input_field">
                                <input type="email" class="mein-inputs" maxlength="50" id="fp-email" name="fp-email">
                            </div>
                        </div>
                        <div class="col-md-4" style="margin-right: auto; margin-left: auto">
                            <button class="buttons wow fadeInUp" data-wow-duration="1s" data-wow-delay=".25s"
                                    id="sub_fp_email" style="margin: 44px 0 0 0; width: 100%">Дальше
                            </button>
                        </div>
                        <div class="col-md-12 wow fadeInRight" style="margin-top: 50px" data-wow-duration="1s"
                             data-wow-delay=".45s">
                            <div align="center"><a href="${pageContext.request.contextPath}/auth/sign-in">
                                Уже вспомнили<i class="fa fa-question"></i></a></div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>
<div class="job_details_area" id="fp-code-container" style="display: none">
    <div class="container">
        <div class="row">
            <div class="apply_job_form white-bg" style="margin-right: auto; margin-left: auto; max-width: 700px">
                <h4 style="color: rgb(146, 117, 250);" class="wow fadeInLeft" data-wow-duration="1s"
                    data-wow-delay=".1s">Подтверждение email</h4>
                <h5 style="color: #00D363" class="wow fadeInLeft col-md-10" data-wow-duration="1s"
                    data-wow-delay=".15s">На ваш email направлен код подтверждения адреса. Если вам не пришло
                    письмо, проверьте Спам либо <a style="text-decoration: underline;" onclick="repeat_code_fp()">повторите
                        отправку кода</a>.</h5>
                <form novalidate method="POST" autocomplete="on" action="javascript:void(0);">
                    <div class="row">
                        <div class="col-md-3 wow fadeInRight" style="margin: 20px auto" data-wow-duration="1s"
                             data-wow-delay=".2s">
                            <div class="mein-labels">Код</div>
                            <div class="input_field">
                                <input type="text" class="mein-inputs" style="text-align: center; padding: 1px 2px;"
                                       maxlength="7" id="ft-code" name="ft-code">
                            </div>
                        </div>
                        <div class="col-md-5" style="margin-right: auto; margin-left: auto">
                            <button class="buttons wow fadeInUp" data-wow-duration="1s" data-wow-delay=".25s"
                                    id="sub_ft_code" style="margin: 44px auto; width: 100%">Подтвердить
                            </button>
                        </div>
                        <div class="col-md-12 wow fadeInRight" style="margin-top: 50px" data-wow-duration="1s"
                             data-wow-delay=".45s">
                            <div align="center"><a onclick="repeat_code_fp()">
                                Отправить заново <i class="fa fa-repeat"></i></a></div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>
<div class="job_details_area" id="fp-new-psw-container" style="display: none">
    <div class="container">
        <div class="row">
            <div class="apply_job_form white-bg" style="margin-right: auto; margin-left: auto; max-width: 700px">
                <h4 style="color: rgb(146, 117, 250);" class="wow fadeInLeft" data-wow-duration="1s"
                    data-wow-delay=".1s">Восстановление пароля</h4>
                <form novalidate method="POST" autocomplete="on" action="javascript:void(0);">
                    <div class="row">
                        <div class="col-md-8 wow fadeInRight" data-wow-duration="1s" data-wow-delay=".15s"
                             style="margin-right: auto; margin-left: auto">
                            <div class="mein-labels">Новый пароль</div>
                            <div class="input_field" style="position: relative">
                                <input type="password" class="mein-inputs" id="fp-new-pass" maxlength="20" name="pass">
                                <a class="password-control" id="password-control-6"></a>
                                <div class="psw-validate">
                                    <p id="letter-np" class="invalid"><i id="letter-status-np" class="fa fa-times"></i>
                                        Строчная буква</p>
                                    <p id="capital-np" class="invalid"><i id="capital-status-np"
                                                                          class="fa fa-times"></i> Заглавная буква</p>
                                    <p id="number-np" class="invalid"><i id="number-status-np" class="fa fa-times"></i>
                                        Цифра</p>
                                    <p id="length-np" class="invalid"><i id="length-status-np" class="fa fa-times"></i>
                                        От 8 до 20 символов</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8 wow fadeInRight" data-wow-duration="1s" data-wow-delay=".2s"
                             style="margin-right: auto; margin-left: auto">
                            <div class="mein-labels">Повторите новый пароль</div>
                            <div class="input_field" style="position: relative">
                                <input type="password" class="mein-inputs" required maxlength="20"
                                       id="fp-new-pass-repeat" name="pass"/>
                                <a class="password-control" id="password-control-7"></a>
                            </div>
                        </div>
                        <div class="col-md-6 wow fadeInUp" data-wow-duration="1s" data-wow-delay=".25s"
                             style="margin-right: auto; margin-left: auto">
                            <button class="buttons" id="sub_np" style="margin: 50px 0 0 0; width: 100%">Готово</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>
<script>
    var fp_code;
    $("#sub_fp_email").on('click', function () {
        var email_selector = $("#fp-email");
        var email = email_selector.val().trim();
        if (email.search(/^[a-z0-9._%+-]{3,}@[a-z0-9.-]{1,}\.[a-z]{2,}$/i) == 0) {
            load_yes();
            $.ajax({
                url: val_servlet_path,
                type: "POST",
                dataType: "html",
                data: "id=1&valid=" + email,
                success: function (resultText) {
                    if (resultText === "yes") {
                        $.ajax({
                            url: conf_servlet_path,
                            type: "POST",
                            dataType: "html",
                            data: "id=3&to=" + email,
                            success: function (resultText) {
                                fp_code = resultText;
                                $("#fp-email-container").hide()
                                $("#fp-code-container").show()
                                load_no()
                                new WOW().init()
                            },
                            error: function (response) {
                                load_no()
                                serverError();
                            }
                        });
                    } else {
                        load_no()
                        email_selector.notify("Аккаунт не найден", {
                            position: "top left",
                            autoHideDelay: 2000,
                            arrowShow: false,
                            className: 'error',
                            gap: 1
                        }).removeClass("suctextbox").addClass("errtextbox");
                    }
                },
                error: function (response) {
                    load_no()
                    serverError();
                }
            });
        } else {
            if (email.trim() === "") email_selector.notify("Заполните поле", {
                position: "top left",
                autoHideDelay: 2000,
                height: '10px',
                arrowShow: false,
                className: 'warn',
                gap: 1
            });
            else email_selector.notify("email некорректен", {
                position: "top left",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'error',
                gap: 1
            });
            email_selector.removeClass("suctextbox").addClass("errtextbox");
        }
    });

    function repeat_code_fp() {
        load_yes()
        $.ajax({
            url: conf_servlet_path,
            type: "POST",
            dataType: "html",
            data: "id=3&to=" + $("#fp-email").val().trim(),
            success: function (resultText) {
                fp_code = resultText;
                load_no()
                ntf("Отправлено", "Код подтверждения заново отправлен на ваш email, ожидайте", "success")
            },
            error: function (response) {
                load_no()
                serverError();
            }
        });
    }

    $("#sub_ft_code").on('click', function () {
        var hash = window.fp_code.toString();
        load_yes();
        $.ajax({
            url: conf_servlet_path,
            type: "POST",
            dataType: "html",
            data: "id=2&hash=" + hash + "&val=" + $("#ft-code").val().trim(),
            success: function (resultText) {
                if (resultText === "1") {
                    load_no()
                    $("#fp-code-container").hide()
                    $("#fp-new-psw-container").show()
                    new WOW().init()
                } else {
                    load_no()
                    $("#fp-code-container").hide()
                    $("#fp-email-container").show()
                    new WOW().init()
                    $("#fp-email").val("").removeClass("suctextbox").addClass("errtextbox")
                        .notify("Код неверен, повторите ваш email", {
                            position: "top left",
                            autoHideDelay: 10000,
                            arrowShow: false,
                            className: 'error',
                            gap: 1
                        });
                }
                $("#ft-code").val("");
            },
            error: function (response) {
                serverError();
                load_no();
            }
        });
    });
    Valid_PSW_NP();
    var fp_valid = [false, false]
    $("#password-control-6").mousedown(function () {
        $(this).addClass('view');
        $('#fp-new-pass').attr('type', 'text');
        $(document).one("mouseup", function () {
            $("#password-control-6").removeClass('view');
            $('#fp-new-pass').attr('type', 'password');
            return false;
        });
        return false;
    }).on('touchstart', function () {
        $(this).addClass('view');
        $('#fp-new-pass').attr('type', 'text');
        $(this).on('touchend', function () {
            $("#password-control-6").removeClass('view');
            $('#fp-new-pass').attr('type', 'password');
            return false;
        });
        return false;
    });
    $("#password-control-7").mousedown(function () {
        $(this).addClass('view');
        $('#fp-new-pass-repeat').attr('type', 'text');
        $(document).one("mouseup", function () {
            $("#password-control-7").removeClass('view');
            $('#fp-new-pass-repeat').attr('type', 'password');
            return false;
        });
        return false;
    }).on('touchstart', function () {
        $(this).addClass('view');
        $('#fp-new-pass-repeat').attr('type', 'text');
        $(this).on('touchend', function () {
            $("#password-control-7").removeClass('view');
            $('#fp-new-pass-repeat').attr('type', 'password');
            return false;
        });
        return false;
    });
    var pass_check_fp;
    $("#fp-new-pass").focusin(function () {
        $(".psw-validate").addClass("open-psw");
        $('#fp-new-pass-repeat').val("").removeClass("suctextbox").addClass("errtextbox")
        fp_valid[1] = false;
        $(this).off("mouseover").off("mouseout")
    }).on('mouseover', function () {
        $(".psw-validate").addClass("open-psw");
    }).on('mouseout', function () {
        $(".psw-validate").removeClass("open-psw");
    }).focusout(function () {
        var lowerCaseLetters = /[a-zа-я]/g;
        var upperCaseLetters = /[A-ZА-Я]/g;
        var numbers = /[0-9]/g;
        var psw = $(this).val().trim();
        pass_check_fp = psw;
        if (psw.match(upperCaseLetters) && psw.match(lowerCaseLetters) && psw.match(numbers) && psw.length >= 8 && psw.length <= 20) {
            $(this).notify("Данные введены корректно", {
                position: "top left",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'success',
                gap: 1
            });
            $(this).removeClass("errtextbox");
            $(this).addClass("suctextbox");
            fp_valid[0] = true;
        } else {
            if (psw.trim() === "") $(this).notify("Заполните поле", {
                position: "top left",
                autoHideDelay: 2000,
                height: '10px',
                arrowShow: false,
                className: 'warn',
                gap: 1
            });
            else $(this).notify("Пароль некорректен", {
                position: "top left",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'error',
                gap: 1
            });
            $(this).removeClass("suctextbox");
            $(this).addClass("errtextbox");
            fp_valid[0] = false;
        }
        $(".psw-validate").removeClass("open-psw");
        $(this).on('mouseover', function () {
            $(".psw-validate").addClass("open-psw");
        })
        $(this).on('mouseout', function () {
            $(".psw-validate").removeClass("open-psw");
        })
    });
    $("#fp-new-pass-repeat").focusout(function () {
        var value = $(this).val().trim();
        if (value === pass_check_fp && pass_check_fp !== "") {
            $(this).notify("Верно", {
                position: "top left",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'success',
                gap: 1
            });
            $(this).removeClass("errtextbox");
            $(this).addClass("suctextbox");
            fp_valid[1] = true;
        } else {
            if (value.trim() === "") $(this).notify("Заполните поле", {
                position: "top left",
                autoHideDelay: 2000,
                height: '10px',
                arrowShow: false,
                className: 'warn',
                gap: 1
            });
            else $(this).notify("Пароли не сходятся", {
                position: "top left",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'error',
                gap: 1
            });
            $(this).removeClass("suctextbox");
            $(this).addClass("errtextbox");
            fp_valid[1] = false;

        }
    })
    $("#sub_np").on('click', function () {
        if (fp_valid[0] && fp_valid[1]) {
            load_yes()
            $.ajax({
                url: lk_servlet_path,
                type: "POST",
                dataType: "html",
                data: "id=3&email=" + $("#fp-email").val().trim() + "&pass=" + $("#fp-new-pass").val().trim(),
                success: function (resultText) {
                    if (parseInt(resultText) > 0) {
                        load_no();
                        swal.fire({
                            title: "Пароль успешно восстановлен",
                            text: "Ваш пароль восстановлен.\nТеперь вы снова можете войти в свой аккаунт",
                            icon: "success",
                            footer: '<a style="color: rgb(72, 31, 187); cursor: pointer; font-size: 20px" onclick="toFeedBackPage()">Вопросы? Обратитесь к нам</a>',
                        }).then((result) => {
                            toLoginPage()
                        });
                    } else if (parseInt(resultText) === 0) {
                        load_no()
                        swal.fire({
                            title: "Ошибка",
                            text: "Произошла ошибка во время восстановления вашего пароля.\nПовторите попытку позже, либо свяжитесь с нами",
                            icon: "error",
                            footer: '<a style="color: rgb(72, 31, 187); cursor: pointer; font-size: 20px" onclick="toFeedBackPage()">Вопросы? Обратитесь к нам</a>',
                        }).then((result) => {
                            toLoginPage()
                        });
                    } else {
                        load_no();
                        ntf("Сбой подключения к серверу", "Произошёл сбой подключения к серверу.\nПовторите попытку позже, либо свяжитесь с нами", "error");
                    }
                },
                error: function (response) {
                    load_no();
                    ntf("Сбой подключения к серверу", "Произошёл сбой подключения к серверу.\nПовторите попытку позже, либо свяжитесь с нами", "error");
                }
            });
        } else {
            $(this).notify("Форма заполнена некорректно", {
                position: "top center",
                autoHideDelay: 5000,
                arrowShow: false,
                className: 'error',
                gap: 1
            });
        }
    });
    anim_func("#fp-email-container");
</script>