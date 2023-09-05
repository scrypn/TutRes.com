<script>
    if (getCookie('user') === undefined) toLoginPage();

    $("#section-title-slider-text").text("Личный кабинет")
    $("#section-title-slider-block").show()
</script>
<div class="job_details_area" id="lk_div">
    <div class="container">
        <div class="row">
            <div class="apply_job_form white-bg" style="margin-right: auto; margin-left: auto; max-width: 1100px">
                <h4 style="color: rgb(146, 117, 250);" class="wow fadeInLeft" data-wow-duration="1s"
                    data-wow-delay=".1s">Личный кабинет <i id="lk-active-status"></i></h4>
                <form novalidate method="POST" autocomplete="on" id="lk_form" action="javascript:void(0);">
                    <div class="row">
                        <div class="col-md-4 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".15s"
                             style="margin-bottom: 25px; margin-top: 20px">
                            <div class="mein-labels">Фамилия</div>
                            <div class="input_field">
                                <input type="text" class="mein-inputs" maxlength="20" id="surname_lk" name="surname">
                            </div>
                        </div>
                        <div class="col-md-4 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".15s"
                             style="margin-bottom: 25px; margin-top: 20px">
                            <div class="mein-labels">Имя</div>
                            <div class="input_field">
                                <input type="text" class="mein-inputs" maxlength="20" id="name_lk" name="name">
                            </div>
                        </div>
                        <div class="col-md-4 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".15s"
                             style="margin-bottom: 25px; margin-top: 20px">
                            <div class="mein-labels">Отчество <span
                                    style="font-size: 10px">( — в случае отсутствия)</span></div>
                            <div class="input_field">
                                <input type="text" class="mein-inputs" id="sec_name_lk" name="sec_name" maxlength="20">
                            </div>
                        </div>
                        <div class="col-md-4 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".2s"
                             style="margin-bottom: 25px">
                            <div class="mein-labels">Статус</div>
                            <div class="input_field">
                                <input type="text" style="background: #F5F7FA" disabled class="mein-inputs" id="emp_lk"
                                       name="emp" maxlength="20">
                                <!--<select name="emp" id="emp_lk" class="custom-select-class" placeholder="emp_lk">
                                    <option selected value="Ученик">Ученик</option>
                                    <option value="Репетитор">Репетитор</option>
                                </select>-->
                            </div>
                        </div>
                        <div class="col-md-3 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".2s"
                             style="margin-bottom: 25px">
                            <div class="mein-labels">Дата Рождения</div>
                            <div class="input_field">
                                <input type="date" id="date_lk" class="mein-inputs" name="date"/>
                            </div>
                        </div>
                        <div class="col-md-5 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".2s"
                             style="margin-bottom: 25px">
                            <div class="mein-labels">Предмет(ы)</div>
                            <div>
                                <select name="subs" id="subjects_reg_lk" class="custom-select-multiple"
                                        placeholder="subs_lk">
                                    <option selected id="sub-lk-option-1" value="Математика">Математика</option>
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
                                <select name="country" id="country_lk" class="custom-select-class"
                                        placeholder="country_lk">
                                    <option selected value="Российская Федерация">Российская Федерация</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".25s"
                             style="margin-bottom: 25px">
                            <div class="mein-labels">Регион</div>
                            <div class="input_field">
                                <input type="text" class="mein-inputs" maxlength="20" id="region_lk" name="region">
                            </div>
                        </div>
                        <div class="col-md-3 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".25s"
                             style="margin-bottom: 25px">
                            <div class="mein-labels">Населённый пункт</div>
                            <div class="input_field">
                                <input type="text" class="mein-inputs" maxlength="20" id="city_lk" name="city">
                            </div>
                        </div>
                        <div class="col-md-3 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".3s"
                             style="margin-bottom: 25px">
                            <div class="mein-labels">Улица</div>
                            <div class="input_field">
                                <input type="text" class="mein-inputs" maxlength="20" id="street_lk" name="street">
                            </div>
                        </div>
                        <div class="col-md-2 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".3s"
                             style="margin-bottom: 25px">
                            <div class="mein-labels">Строение</div>
                            <div class="input_field">
                                <input type="text" class="mein-inputs" id="house_lk" maxlength="20" name="house">
                            </div>
                        </div>
                        <div class="col-md-3 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".3s"
                             style="margin-bottom: 25px">
                            <div class="mein-labels">Номер телефона</div>
                            <div class="input_field">
                                <input type="tel" class="mein-inputs" maxlength="20" id="phone_lk" name="phone">
                            </div>
                        </div>
                        <div class="col-md-4 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".3s"
                             style="margin-bottom: 25px">
                            <div class="mein-labels">Email</div>
                            <div class="input_field" style="position: relative">
                                <input type="email" disabled class="mein-inputs" style="background: #F5F7FA"
                                       maxlength="50" id="email_lk" name="email">
                                <div class="loader-input" id="loader-input-email"></div>
                            </div>
                        </div>
                        <div class="col-md-6" id="change-psw" style="margin-bottom: 25px; display: none;">
                            <div class="mein-labels">Новый пароль</div>
                            <div class="input_field" style="position: relative">
                                <input type="password" disabled class="mein-inputs" id="pass_lk" maxlength="20"
                                       name="pass">
                                <a class="password-control" id="password-control-4"></a>
                                <div class="psw-validate">
                                    <p id="letter_lk" class="invalid"><i id="letter-status-lk" class="fa fa-times"></i>
                                        Строчная буква</p>
                                    <p id="capital_lk" class="invalid"><i id="capital-status-lk"
                                                                          class="fa fa-times"></i> Заглавная буква</p>
                                    <p id="number_lk" class="invalid"><i id="number-status-lk" class="fa fa-times"></i>
                                        Цифра</p>
                                    <p id="length_lk" class="invalid"><i id="length-status-lk" class="fa fa-times"></i>
                                        От 8 до 20 символов</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6" id="change-psw-repeat" style="display: none; margin-bottom: 25px;">
                            <div class="mein-labels">Повторите новый пароль</div>
                            <div class="input_field" style="position: relative">
                                <input type="password" disabled class="mein-inputs" maxlength="20" required
                                       id="pass2_lk" name="pass2">
                                <a class="password-control" id="password-control-5"></a>
                            </div>
                        </div>
                        <div class="col-md-8 wow fadeInUp" data-wow-duration="1s" data-wow-delay=".4s"
                             style="margin-right: auto; margin-left: auto">
                            <button class="buttons" id="sub_lk" style="margin: 50px 0 0 0; width: 100%">Сохранить
                            </button>
                        </div>
                        <div class="col-md-12 wow fadeInLeft" style="margin-top: 70px" data-wow-duration="1s"
                             data-wow-delay=".45s">
                            <div align="center"><a id="change-psw-href" onclick="">Изменить пароль <i
                                    class="fa fa-refresh"></i></a></div>
                        </div>
                        <div class="col-md-12 wow fadeInRight" style="margin-top: 20px" data-wow-duration="1s"
                             data-wow-delay=".45s">
                            <div align="center"><a onclick="delete_account()" style="color: red">Удалить аккаунт <i
                                    class="fa fa-trash-o"></i></a></div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>
<script>
    Valid_PSW_LK();
</script>
<script src="${pageContext.request.contextPath}/js/select.js"></script>
<script src="${pageContext.request.contextPath}/js/select_multiple.js"></script>
<script>
    $("#password-control-4").mousedown(function () {
        $(this).addClass('view');
        $('#pass_lk').attr('type', 'text');
        $(document).one("mouseup", function () {
            $("#password-control-4").removeClass('view');
            $('#pass_lk').attr('type', 'password');
            return false;
        });
        return false;
    }).on('touchstart', function () {
        $(this).addClass('view');
        $('#pass_lk').attr('type', 'text');
        $(this).on('touchend', function () {
            $("#password-control-4").removeClass('view');
            $('#pass_lk').attr('type', 'password');
            return false;
        });
        return false;
    });
    $("#password-control-5").mousedown(function () {
        $(this).addClass('view');
        $('#pass2_lk').attr('type', 'text');
        $(document).one("mouseup", function () {
            $("#password-control-5").removeClass('view');
            $('#pass2_lk').attr('type', 'password');
            return false;
        });
        return false;
    }).on('touchstart', function () {
        $(this).addClass('view');
        $('#pass2_lk').attr('type', 'text');
        $(this).on('touchend', function () {
            $("#password-control-5").removeClass('view');
            $('#pass2_lk').attr('type', 'password');
            return false;
        });
        return false;
    });

    function update_lk_data() {
        var arr = getCookie("user").split("/");
        $("#surname_lk").val(arr[0]);
        $("#name_lk").val(arr[1]);
        if (arr[2] === 'active') $("#lk-active-status").css({color: '#00D363'}).addClass("fa fa-check-circle-o").attr('title',
            'аккаунт подтверждён модератором портала TutRes.com, вам доступен весь функционал сайта')
        else $("#lk-active-status").css({color: '#faba17'}).addClass("fa fa-exclamation-circle").attr('title',
            'аккаунт не подтверждён модератором портала TutRes.com, часть функционала сайта недоступна')
        $("#sec_name_lk").val(arr[6]);
        $("#phone_lk").val(arr[7]);
        var address = arr[8].split(", ");
        $("#region_lk").val(address[1]);
        $("#city_lk").val(address[2]);
        $("#street_lk").val(address[3]);
        $("#house_lk").val(address[4]);
        $("#email_lk").val(arr[4]);
        $("#country_lk").val(address[0]);
        $("#emp_lk").val(arr[3]);
        $("#sub-lk-option-1").val(arr[11]);
        $("#subjects_lk").val(arr[11]);
        $("#date_lk").val(arr[12]);
    }

    update_lk_data()
    Valid_LK();
    anim_func("#lk_div");
</script>
