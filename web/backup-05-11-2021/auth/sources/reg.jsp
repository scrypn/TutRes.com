<script>
    if (getCookie("user") !== undefined) toHomePage();

    $("#section-title-slider-text").text("Регистрация")
    $("#section-title-slider-block").show()
</script>
<div class="job_details_area" id="reg">
    <div class="container">
        <div class="row">
            <div class="apply_job_form white-bg" style="margin-right: auto; margin-left: auto; max-width: 1100px">
                <h4 style="color: rgb(146, 117, 250);" class="wow fadeInLeft" data-wow-duration="1s"
                    data-wow-delay=".1s">Регистрация</h4>
                <form novalidate method="POST" autocomplete="on" id="reg_form" action="javascript:void(0);">
                    <div class="row">
                        <div class="col-md-4 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".15s"
                             style="margin-bottom: 25px;">
                            <div class="mein-labels">Фамилия</div>
                            <div class="input_field">
                                <input type="text" class="mein-inputs" maxlength="20" id="surname" name="surname">
                            </div>
                        </div>
                        <div class="col-md-4 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".15s"
                             style="margin-bottom: 25px;">
                            <div class="mein-labels">Имя</div>
                            <div class="input_field">
                                <input type="text" class="mein-inputs" maxlength="20" id="name" name="name">
                            </div>
                        </div>
                        <div class="col-md-4 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".15s"
                             style="margin-bottom: 25px;">
                            <div class="mein-labels">Отчество <span
                                    style="font-size: 10px">( — в случае отсутствия)</span></div>
                            <div class="input_field">
                                <input type="text" class="mein-inputs" id="sec_name" name="sec_name" maxlength="20">
                            </div>
                        </div>

                        <div class="col-md-4 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".2s"
                             style="margin-bottom: 25px">
                            <div class="mein-labels">Статус</div>
                            <div class="input_field">
                                <select name="emp" id="emp" class="custom-select-class" placeholder="Ученик">
                                    <option selected value="Ученик">Ученик</option>
                                    <option value="Репетитор">Репетитор</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".2s"
                             style="margin-bottom: 25px">
                            <div class="mein-labels">Дата Рождения</div>
                            <div class="input_field">
                                <input type="date" id="date" class="mein-inputs" name="date"/>
                            </div>
                        </div>
                        <div class="col-md-5 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".2s"
                             style="margin-bottom: 25px">
                            <div class="mein-labels">Предмет(ы) 1-5 вкл.</div>
                            <div>
                                <select name="subs" id="subjects_reg" class="custom-select-multiple"
                                        placeholder="Математика">
                                    <option selected id="sub-reg-option-1" value="Математика">Математика</option>
                                    <option value="Физика">Физика</option>
                                    <option value="Информатика">Информатика</option>
                                    <option value="Программирование">Программирование</option>
                                    <option value="Русский язык">Русский язык</option>
                                    <option value="Русский язык">Литература</option>
                                    <option value="Обществознание">Обществознание</option>
                                    <option value="История">История</option>
                                    <option value="Химия">Химия</option>
                                    <option value="Биология">Биология</option>
                                    <option value="Английский язык">Английский язык</option>
                                    <option value="Немецкий язык">Немецкий язык</option>
                                    <option value="Французский язык">Французский язык</option>
                                    <option value="Китайский язык">Китайский язык</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-5 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".25s"
                             style="margin-bottom: 25px">
                            <div class="mein-labels">Страна</div>
                            <div class="input_field">
                                <select name="country" id="country" class="custom-select-class"
                                        placeholder="Российская Федерация">
                                    <option selected value="Российская Федерация">Российская Федерация</option>
                                    <!--<option value="Украина">Украина</option>
                                    <option value="Казахстан">Казахстан</option>
                                    <option value="Республика Беларусь">Республика Белорусь</option>-->
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".25s"
                             style="margin-bottom: 25px">
                            <div class="mein-labels">Регион</div>
                            <div class="input_field">
                                <input type="text" class="mein-inputs" maxlength="20" id="region" name="region">
                            </div>
                        </div>
                        <div class="col-md-3 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".25s"
                             style="margin-bottom: 25px">
                            <div class="mein-labels">Населённый пункт</div>
                            <div class="input_field">
                                <input type="text" class="mein-inputs" maxlength="20" id="city" name="city">
                            </div>
                        </div>
                        <div class="col-md-3 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".3s"
                             style="margin-bottom: 25px">
                            <div class="mein-labels">Улица</div>
                            <div class="input_field">
                                <input type="text" class="mein-inputs" maxlength="20" id="street" name="street">
                            </div>
                        </div>
                        <div class="col-md-2 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".3s"
                             style="margin-bottom: 25px">
                            <div class="mein-labels">Строение</div>
                            <div class="input_field">
                                <input type="text" class="mein-inputs" id="house" maxlength="20" name="house">
                            </div>
                        </div>
                        <div class="col-md-3 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".3s"
                             style="margin-bottom: 25px">
                            <div class="mein-labels">Номер телефона</div>
                            <div class="input_field">
                                <input type="tel" class="mein-inputs" maxlength="20" id="phone" name="phone">
                            </div>
                        </div>
                        <div class="col-md-4 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".3s"
                             style="margin-bottom: 25px">
                            <div class="mein-labels">Email</div>
                            <div class="input_field" style="position: relative">
                                <input type="email" class="mein-inputs" maxlength="50" id="email" name="email">
                                <div class="loader-input" id="loader-input-email"></div>
                            </div>
                        </div>
                        <div class="col-md-6 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".35s"
                             style="margin-bottom: 25px">
                            <div class="mein-labels">Придумайте пароль</div>
                            <div class="input_field" style="position: relative">
                                <input type="password" class="mein-inputs" id="pass" maxlength="20" name="pass">
                                <a class="password-control" id="password-control-1"></a>
                                <div class="psw-validate">
                                    <p id="letter" class="invalid"><i id="letter-status" class="fa fa-times"></i>
                                        Строчная буква</p>
                                    <p id="capital" class="invalid"><i id="capital-status" class="fa fa-times"></i>
                                        Заглавная буква</p>
                                    <p id="number" class="invalid"><i id="number-status" class="fa fa-times"></i> Цифра
                                    </p>
                                    <p id="length" class="invalid"><i id="length-status" class="fa fa-times"></i> От 8
                                        до 20 символов</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".35s"
                             style="margin-bottom: 25px">
                            <div class="mein-labels">Повторите пароль</div>
                            <div class="input_field" style="position: relative">
                                <input type="password" class="mein-inputs" maxlength="20" required id="pass2"
                                       name="pass2">
                                <a class="password-control" id="password-control-2"></a>
                            </div>
                        </div>
                        <div class="col-md-5 wow fadeInRight" data-wow-duration="1s" data-wow-delay=".4s">
                            <!--<div><input type="checkbox" id="policy-checkbox"/></div>-->
                            <div style="margin-left: 15px; display: inline-block">Я ознакомился(лась) и принимаю условия
                                положений: "<a
                                        onclick="$('#pers_data').show();$('#reg').hide();$('#privacy-policy-back-to-reg').show();$('#section-title-slider-text').text('Политика Конфиденциальности')"
                                        style="cursor: pointer; color: #00aced">
                                    Политика конфиденциальности и обработки персональных данных</a>" и
                                "<a onclick="
										$('#terms_data').show();$('#reg').hide();
										$('#terms-back-to-reg').show();
										$('#section-title-slider-text').text('Пользовательское соглашение');
" style="cursor: pointer; color: #00aced">Пользовательское соглашение</a>"
                            </div>
                        </div>
                        <div class="col-md-1 wow fadeInRight" data-wow-duration="1s" data-wow-delay=".4s">
                            <div style="margin: 20px 0 0 15px"><input type="checkbox" id="policy-checkbox"/>
                                <label for="policy-checkbox" class="check-box"></label>
                            </div>
                        </div>
                        <!--<div class="container">
                            <form action="">
                                <div class="checkbox">
                                    <input id="check" name="check" type="checkbox" />
                                    <label for="check"></label>
                                </div>
                            </form>
                        </div>-->

                        <!--<div class="col-md-6 wow fadeInUp" data-wow-duration="1s" data-wow-delay=".4s" style="margin-right: auto; margin-left: auto">
                            <div class="g-recaptcha" data-sitekey=""></div>
                        </div>-->
                        <div class="col-md-8 wow fadeInUp" data-wow-duration="1s" data-wow-delay=".4s"
                             style="margin-right: auto; margin-left: auto">
                            <button class="buttons" id="sub_reg" style="margin: 50px 0 0 0; width: 100%">Создать
                                аккаунт
                            </button>
                        </div>
                        <div class="col-md-12 wow fadeInRight" style="margin-top: 50px" data-wow-duration="1s"
                             data-wow-delay=".45s">
                            <div align="center"><a href="${pageContext.request.contextPath}/auth/sign-in">
                                <i class="fa fa-sign-in"></i> Уже есть аккаунт?</a></div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>Valid_PSW();</script>
<script src="${pageContext.request.contextPath}/js/select.js"></script>
<script src="${pageContext.request.contextPath}/js/select_multiple.js"></script>
<script>Valid_Reg();</script>
<div class="job_details_area" id="confirm_email" style="display: none;">
    <div class="container">
        <div class="row">
            <div class="apply_job_form white-bg" style="margin-right: auto; margin-left: auto; max-width: 700px">
                <h4 style="color: rgb(146, 117, 250);" class="wow fadeInLeft" data-wow-duration="1s"
                    data-wow-delay=".1s">Подтверждение email</h4>
                <h5 style="color: #00D363" class="wow fadeInLeft col-md-10" data-wow-duration="1s"
                    data-wow-delay=".15s">На ваш email направлен код подтверждения адреса. Если вам не пришло
                    письмо, проверьте Спам либо <a style="text-decoration: underline;" onclick="repeat_code()">повторите
                        отправку кода</a>.</h5>
                <form novalidate method="POST" autocomplete="on" action="javascript:void(0);">
                    <div class="row">
                        <div class="col-md-3 wow fadeInRight" style="margin: 20px auto" data-wow-duration="1s"
                             data-wow-delay=".2s">
                            <div class="mein-labels">Код</div>
                            <div class="input_field">
                                <input type="text" class="mein-inputs" style="text-align: center; padding: 1px 2px;"
                                       maxlength="7" id="confirm" name="confirm">
                            </div>
                        </div>
                        <div class="col-md-5" style="margin-right: auto; margin-left: auto">
                            <button class="buttons wow fadeInUp" data-wow-duration="1s" data-wow-delay=".25s"
                                    id="sub_conf" style="margin: 44px 0 0 0; width: 100%">Подтвердить
                            </button>
                        </div>
                        <div class="col-md-12 wow fadeInRight" style="margin-top: 50px" data-wow-duration="1s"
                             data-wow-delay=".45s">
                            <div align="center"><a onclick="repeat_code()">
                                Отправить заново <i class="fa fa-repeat"></i></a></div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>
<script>
    $("#password-control-1").mousedown(function () {
        $(this).addClass('view');
        $('#pass').attr('type', 'text');
        $(document).one("mouseup", function () {
            $("#password-control-1").removeClass('view');
            $('#pass').attr('type', 'password');
            return false;
        });
        return false;
    }).on('touchstart', function () {
        $(this).addClass('view');
        $('#pass').attr('type', 'text');
        $(this).on('touchend', function () {
            $("#password-control-1").removeClass('view');
            $('#pass').attr('type', 'password');
            return false;
        });
        return false;
    });
    $("#password-control-2").mousedown(function () {
        $(this).addClass('view');
        $('#pass2').attr('type', 'text');
        $(document).one("mouseup", function () {
            $("#password-control-2").removeClass('view');
            $('#pass2').attr('type', 'password');
            return false;
        });
        return false;
    }).on('touchstart', function () {
        $(this).addClass('view');
        $('#pass2').attr('type', 'text');
        $(this).on('touchend', function () {
            $("#password-control-2").removeClass('view');
            $('#pass2').attr('type', 'password');
            return false;
        });
        return false;
    });
    $("#phone").inputmask("+7(999) 999-99-99");
    /*function date_func() {
        var date = new Date()
        $("#date").attr("type", "date").attr("max", (date.getFullYear()-16) + "-" + (date.getMonth()+1) + "-" + date.getDate())
                .attr("min", (date.getFullYear()-100) + "-" + (date.getMonth()+1) + "-" + date.getDate())
    }
    function date_func_out() {
        var el = $("#date");
        el.attr('type', 'text')
        if (el.val() === "") {
            el.notify("Заполните поле", "warn");
            el.addClass("errtextbox");
        } else {
            el.removeClass("errtextbox");
        }
    }*/
    /*$("#phone").on("blur", function() {
        var last = $(this).val().substr( $(this).val().indexOf("-") + 1 );

        if( last.length == 3 ) {
            var move = $(this).val().substr( $(this).val().indexOf("-") - 1, 1 );
            var lastfour = move + last;
            var first = $(this).val().substr( 0, 9 );

            $(this).val( first + '-' + lastfour );
        }
    });*/
    function repeat_code() {
        load_yes()
        $.ajax({
            url: conf_servlet_path,
            type: "POST",
            dataType: "html",
            data: "id=1&to=" + $("#email").val() + "&surname=" + $("#surname").val() + "&name=" + $("#name").val(),
            success: function (resultText) {
                window.code = resultText;
                load_no()
                ntf("Отправлено", "Код подтверждения заново отправлен на ваш email, ожидайте", "success")
            },
            error: function (response) {
                load_no()
                serverError();
            }
        });
    }
</script>
<script>
    $(document).ready(function () {
        $("#sub_conf").click(
            function () {
                Confirm();
                return false;
            }
        );
    });
    anim_func("#reg");
</script>
