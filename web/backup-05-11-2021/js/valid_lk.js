function Valid_LK() {
    var lk_valid = [];
    for (var i = 0; i < 15; i++) {
        lk_valid[i] = true;
    }
    var arr = ["#surname_lk", "#name_lk", "#sec_name_lk", "#phone_lk", "#emp_lk",
        "#country_lk", "#region_lk", "#city_lk", "#street_lk", "#house_lk",
        "#email_lk", "#pass_lk", "#pass2_lk", "#date_lk"];
    for (var i = 0; i < arr.length; i++) {
        $(arr[i]).focusin(function () {
            $(this).removeClass("suctextbox");
            $(this).removeClass("errtextbox");
            lk_valid[i + 1] = false;
        });
    }
    $(arr[11]).focusin(function () {
        $(".psw-validate").addClass("open-psw");
        $(arr[12]).val("").removeClass("suctextbox").addClass("errtextbox")
        lk_valid[13] = false;
        $(this).off("mouseover").off("mouseout")
    });
    $(arr[11]).on('mouseover', function () {
        $(".psw-validate").addClass("open-psw");
    })
    $(arr[11]).on('mouseout', function () {
        $(".psw-validate").removeClass("open-psw");
    })
    $(arr[11]).focusout(function () {
        $(this).on('mouseover', function () {
            $(".psw-validate").addClass("open-psw");
        })
        $(this).on('mouseout', function () {
            $(".psw-validate").removeClass("open-psw");
        })
    });

    $(arr[0]).focusout(function () {
        var value = $(this).val();
        if (value.search(/^[A-Za-zА-Яа-яЁё]{2,}$/i) != 0) {
            if (value.trim() === "") $(this).notify("Заполните поле", {
                position: "top left",
                autoHideDelay: 2000,
                height: '10px',
                arrowShow: false,
                className: 'warn',
                gap: 1
            });
            else $(this).notify("Фамилия введена некорректно", {
                position: "top left",
                autoHideDelay: 2000,
                height: '10px',
                arrowShow: false,
                className: 'error',
                gap: 1
            });
            $(this).removeClass("suctextbox");
            $(this).addClass("errtextbox");
            lk_valid[1] = false;
        } else {
            $(this).notify("Данные введены корректно", {
                position: "top left",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'success',
                gap: 1
            });
            $(this).removeClass("errtextbox");
            $(this).addClass("suctextbox");
            lk_valid[1] = true;

        }
    });
    $(arr[1]).focusout(function () {
        var value = $(this).val();
        if (value.search(/^[A-Za-zА-Яа-яЁё]{2,}$/i) != 0) {
            if (value.trim() === "") $(this).notify("Заполните поле", {
                position: "top left",
                autoHideDelay: 2000,
                height: '10px',
                arrowShow: false,
                className: 'warn',
                gap: 1
            });
            else $(this).notify("Имя введено некорректно", {
                position: "top left",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'error',
                gap: 1
            });
            $(this).removeClass("suctextbox");
            $(this).addClass("errtextbox");
            lk_valid[2] = false;
        } else {
            $(this).notify("Данные введены корректно", {
                position: "top left",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'success',
                gap: 1
            });
            $(this).removeClass("errtextbox");
            $(this).addClass("suctextbox");
            lk_valid[2] = true;
        }
    });
    $(arr[2]).focusout(function () {
        var value = $(this).val();
        if (value.search(/^[A-Za-zА-Яа-яЁё]{2,}$/i) != 0 && value != "-") {
            if (value.trim() === "") $(this).notify("Заполните поле", {
                position: "top left",
                autoHideDelay: 2000,
                height: '10px',
                arrowShow: false,
                className: 'warn',
                gap: 1
            });
            else $(this).notify("Отчество введено некорректно", {
                position: "top left",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'error',
                gap: 1
            });
            $(this).removeClass("suctextbox");
            $(this).addClass("errtextbox");
            lk_valid[3] = false;
        } else {
            $(this).notify("Данные введены корректно", {
                position: "top left",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'success',
                gap: 1
            });
            $(this).removeClass("errtextbox");
            $(this).addClass("suctextbox");
            lk_valid[3] = true;
        }
    });
    $(arr[3]).focusout(function () {
        var value = $(this).val();
        if (value.search(/^[\+]{0,1}\d{1,4}[\(]\d{3}[\)]\s\d{3}[\-]\d{2}[\-]\d{2}$/i) != 0) {
            if (value.trim() === "") $(this).notify("Заполните поле", {
                position: "top left",
                autoHideDelay: 2000,
                height: '10px',
                arrowShow: false,
                className: 'warn',
                gap: 1
            });
            else $(this).notify("Номер введён некорректно", {
                position: "top left",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'error',
                gap: 1
            });
            $(this).removeClass("suctextbox");
            $(this).addClass("errtextbox");
            lk_valid[4] = false;
        } else {
            $(this).notify("Данные введены корректно", {
                position: "top left",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'success',
                gap: 1
            });
            $(this).removeClass("errtextbox");
            $(this).addClass("suctextbox");
            lk_valid[4] = true;
        }
    });
    $(arr[6]).focusout(function () {
        var value = $(this).val();
        if (value.search(/^[A-Za-zА-Яа-яЁё\s\-]{2,}$/i) != 0) {
            if (value.trim() === "") $(this).notify("Заполните поле", {
                position: "top left",
                autoHideDelay: 2000,
                height: '10px',
                arrowShow: false,
                className: 'warn',
                gap: 1
            });
            else $(this).notify("Регион введён некорректно", {
                position: "top left",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'error',
                gap: 1
            });
            $(this).removeClass("suctextbox");
            $(this).addClass("errtextbox");
            lk_valid[7] = false;
        } else {
            $(this).notify("Данные введены корректно", {
                position: "top left",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'success',
                gap: 1
            });
            $(this).removeClass("errtextbox");
            $(this).addClass("suctextbox");
            lk_valid[7] = true;
        }
    });
    $(arr[7]).focusout(function () {
        var value = $(this).val();
        if (value.search(/^[A-Za-zА-Яа-яЁё\s\-]{2,}$/i) != 0) {
            if (value.trim() === "") $(this).notify("Заполните поле", {
                position: "top left",
                autoHideDelay: 2000,
                height: '10px',
                arrowShow: false,
                className: 'warn',
                gap: 1
            });
            else $(this).notify("Город введён некорректно", {
                position: "top left",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'error',
                gap: 1
            });
            $(this).removeClass("suctextbox");
            $(this).addClass("errtextbox");
            lk_valid[8] = false;
        } else {
            $(this).notify("Данные введены корректно", {
                position: "top left",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'success',
                gap: 1
            });
            $(this).removeClass("errtextbox");
            $(this).addClass("suctextbox");
            lk_valid[8] = true;
        }
    });
    $(arr[8]).focusout(function () {
        var value = $(this).val();
        if (value.search(/^[A-Za-zА-Яа-яЁё\s\.\-]{2,}$/i) != 0) {
            if (value.trim() === "") $(this).notify("Заполните поле", {
                position: "top left",
                autoHideDelay: 2000,
                height: '10px',
                arrowShow: false,
                className: 'warn',
                gap: 1
            });
            else $(this).notify("Улица введена некорректно", {
                position: "top left",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'error',
                gap: 1
            });
            $(this).removeClass("suctextbox");
            $(this).addClass("errtextbox");
            lk_valid[9] = false;
        } else {
            $(this).notify("Данные введены корректно", {
                position: "top left",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'success',
                gap: 1
            });
            $(this).removeClass("errtextbox");
            $(this).addClass("suctextbox");
            lk_valid[9] = true;
        }
    });

    $(arr[9]).focusout(function () {
        var value = $(this).val();
        if (value.search(/^[0-9]{1,}[А-Яа-я]{0,1}$/i) != 0) {
            if (value.trim() === "") $(this).notify("Заполните поле", {
                position: "top left",
                autoHideDelay: 2000,
                height: '10px',
                arrowShow: false,
                className: 'warn',
                gap: 1
            });
            else $(this).notify("Номер дома введён некорректно", {
                position: "top left",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'error',
                gap: 1
            });
            $(this).removeClass("suctextbox");
            $(this).addClass("errtextbox");
            lk_valid[10] = false;
        } else {
            $(this).notify("Данные введены корректно", {
                position: "top left",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'success',
                gap: 1
            });
            $(this).removeClass("errtextbox");
            $(this).addClass("suctextbox");
            lk_valid[10] = true;
        }
    });
    var pass_check = $(arr[11]).val().trim();
    $(arr[11]).focusout(function () {
        $(".psw-validate").removeClass("open-psw");
        var lowerCaseLetters = /[a-zа-я]/g;
        var upperCaseLetters = /[A-ZА-Я]/g;
        var numbers = /[0-9]/g;
        var psw = $(this).val().trim();
        pass_check = psw;
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
            lk_valid[12] = true;
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
            lk_valid[12] = false;
        }
    });
    $(arr[12]).focusout(function () {
        var value = $(this).val().trim();
        if (value === pass_check && pass_check !== "") {
            $(this).notify("Верно", {
                position: "top left",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'success',
                gap: 1
            });
            $(this).removeClass("errtextbox");
            $(this).addClass("suctextbox");
            lk_valid[13] = true;
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
            lk_valid[13] = false;

        }
    });

    $(arr[13]).focusout(function () {
        if ($(this).val() === "") {
            $(this).notify("Заполните поле", {
                position: "top left",
                autoHideDelay: 2000,
                height: '10px',
                arrowShow: false,
                className: 'warn',
                gap: 1
            });
            $(this).addClass("errtextbox");
            lk_valid[14] = false;
        } else {
            var m = moment(new Date());
            var years = m.diff(new Date($(this).val()), 'years');
            if (years <= 100 && years >= 5) {
                if ($("#emp_lk").val() === "Репетитор" && years >= 16) {
                    $(this).notify("Верно", {
                        position: "top left",
                        autoHideDelay: 2000,
                        arrowShow: false,
                        className: 'success',
                        gap: 1
                    });
                    $(this).addClass("suctextbox");
                    lk_valid[14] = true;
                } else if ($("#emp_lk").val() === "Репетитор") {
                    $(this).notify("Репетитором можно стать строго с 16 лет", {
                        position: "top left",
                        autoHideDelay: 2000,
                        arrowShow: false,
                        className: 'error',
                        gap: 1
                    });
                    $(this).addClass("errtextbox");
                    lk_valid[14] = false;
                }
                if ($("#emp_lk").val() === "Ученик") {
                    $(this).notify("Верно", {
                        position: "top left",
                        autoHideDelay: 2000,
                        arrowShow: false,
                        className: 'success',
                        gap: 1
                    });
                    $(this).addClass("suctextbox");
                    lk_valid[14] = true;
                }
            } else if (years <= 100) {
                $(this).notify("Минимум: 5 лет", {
                    position: "top left",
                    autoHideDelay: 2000,
                    arrowShow: false,
                    className: 'error',
                    gap: 1
                });
                $(this).addClass("errtextbox");
                lk_valid[14] = false;
            } else if (years >= 5) {
                $(this).notify("Максимум: 100 лет", {
                    position: "top left",
                    autoHideDelay: 2000,
                    arrowShow: false,
                    className: 'error',
                    gap: 1
                });
                $(this).addClass("errtextbox");
                lk_valid[14] = false;
            }
        }
    }).focusin(function () {
        var date = new Date()
        if ($("#emp_lk").val() === "Репетитор") {
            $(this).attr("max", (date.getFullYear() - 16) + "-" + (date.getMonth() + 1) + "-" + date.getDate())
                .attr("min", (date.getFullYear() - 100) + "-" + (date.getMonth() + 1) + "-" + date.getDate())
        } else {
            $(this).attr("max", (date.getFullYear() - 5) + "-" + (date.getMonth() + 1) + "-" + date.getDate())
                .attr("min", (date.getFullYear() - 100) + "-" + (date.getMonth() + 1) + "-" + date.getDate())
        }

    });


    $(".custom-option").on("click", function () {
        if (($(this).text() === "Репетитор" || $(this).text() === "Ученик") && $(arr[13]).val().trim() !== "") {
            $(arr[13]).notify("Внесены изменения", {
                position: "top left",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'error',
                gap: 1
            });
            $(arr[13]).removeClass("suctextbox").addClass("errtextbox");
            $(arr[13]).val("");
            lk_valid[14] = false;
        }
    });
    $("#change-psw-href").on("click", function () {
        var psw = $("#change-psw");
        var psw_rpt = $("#change-psw-repeat");
        if (psw.css('display') === 'none' && psw_rpt.css('display') === 'none') {
            psw.show()
            psw_rpt.show()
            $("#pass_lk").val("").addClass("errtextbox").prop("disabled", false)
            $("#pass2_lk").val("").addClass("errtextbox").prop("disabled", false)
            lk_valid[12] = false;
            lk_valid[13] = false;
        } else if (psw.css('display') === 'block' && psw_rpt.css('display') === 'block') {
            $("#pass_lk").val("").removeClass("errtextbox").prop("disabled", true)
            $("#pass2_lk").val("").removeClass("errtextbox").prop("disabled", true)
            psw.hide()
            lk_valid[12] = true;
            psw_rpt.hide()
            lk_valid[13] = true;
        }


    })
    $("#sub_lk").on('click', function () {
        var count = 0;
        for (var i = 0; i < 15; i++) {
            if (lk_valid[i]) count++;
        }
        if (count === 15) {
            if (getCookie("user") === undefined) {
                swal.fire({
                    title: "Ошибка операции",
                    text: "Был произведён выход из аккаунта",
                    icon: "error",
                    footer: '<a style="color: rgb(72, 31, 187); cursor: pointer; font-size: 20px" onclick="toFeedBackPage()">Вопросы? Обратитесь к нам</a>',
                }).then((result) => {
                    toHomePage();
                });
                document.body.style.paddingRight = '0';
            } else {
                var arr_cookies = getCookie("user").split("/");
                /*var change_active = arr_cookies[2];
                if (arr_cookies[3] === "Репетитор" && $("#emp_lk").val() === "Ученик")change_active = "active";
                else if (arr_cookies[3] === "Ученик" && $("#emp_lk").val() === "Репетитор")change_active = "inactive";
                if (change_active !== "active" && change_active !== "inactive")change_active = "inactive";*/
                load_yes();
                $.ajax({
                    url: lk_servlet_path,
                    type: "POST",
                    dataType: "html",
                    data: $("#lk_form").serialize() + "&id=1&userId=" + arr_cookies[10] + "&email=" + arr_cookies[4],
                    success: function (resultText) {
                        var lk_response = resultText.split("|");
                        if (lk_response[0] === '0') {
                            load_no();
                            ntf("Ошибка обновления данных", "Произошёл сбой обновления данных.\n" +
                                "Повторите попытку позже, либо свяжитесь с нами", "error");
                        } else if (lk_response[0] === '1') {
                            if (lk_response[1] === "true") sendLKForm("email=" + arr_cookies[4] + "&pass=" + lk_response[2]);
                            if (lk_response[1] === "false") sendLKForm("email=" + arr_cookies[4] + "&pass=" + arr_cookies[9]);
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
            }
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
}

function delete_account() {
    swal.fire({
        title: "Подтверждение",
        text: "Вы действительно хотите удалить свой аккаунт TutRes.com? Учтите, что действие является необратимым!",
        footer: '<a style="color: rgb(72, 31, 187); cursor: pointer; font-size: 20px" onclick="toFeedBackPage()">Вопросы? Обратитесь к нам</a>',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#3085d6',
        confirmButtonText: 'Удалить',
        cancelButtonText: 'Отмена'
    }).then((result) => {
        if (result.isConfirmed) {
            load_yes();
            var arr_cookies = getCookie("user").split("/");
            $.ajax({
                url: lk_servlet_path,
                type: "POST",
                dataType: "html",
                async: false,
                data: "id=2&userId=" + arr_cookies[10] + "&email=" + arr_cookies[4] + "&personalId=" + arr_cookies[5],
                success: function (resultText) {
                    if (parseInt(resultText) > 0) {
                        swal.fire({
                            title: "Удалено",
                            text: "Ваш аккаунт успешно удалён.",
                            icon: "success",
                            footer: '<a style="color: rgb(72, 31, 187); cursor: pointer; font-size: 20px" onclick="toFeedBackPage()">Вопросы? Обратитесь к нам</a>',
                        }).then((result) => {
                            document.body.style.paddingRight = '0';
                            var myDate = new Date();
                            myDate.setTime(myDate.getTime() - 1);
                            document.cookie = "user=; path=/; expires=" + myDate.toUTCString();
                            toHomePage();
                        });
                    } else if (parseInt(resultText) === 0) {
                        load_no();
                        ntf("Ошибка", "Произошла ошибка во время удаления вашего аккаунта.\n" +
                            "Повторите попытку позже, либо свяжитесь с нами", "error");
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
        }
    })
    document.body.style.paddingRight = '0';
}