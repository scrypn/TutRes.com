var code;
var email;
var surname;
var name;
/*var errorNull = false, errorSurName = false, errorName = false, errorSecName = false, errorNumber = false, errorEmp = true, errorCountry = true, errorRegion = false, errorCity = false,
	errorStreet = false, errorHouse = false, errorEmail = false, errorPass1 = false, errorPass2 = false;*/
var flags = [];

function Valid_Reg() {
    for (var i = 0; i < 15; i++) {
        flags[i] = false;
    }
    /*var checkNull = function(){
      $(this).val($(this).val().trim());
      if ($(this).val() === "") {
        $(this).notify("Заполните поле", "warn");
        $(this).addClass("errtextbox");
        flags[0] = false;
      } else {
          flags[0] = true;
        $(this).removeClass("errtextbox");
      }
    };*/
    var arr = ["#surname", "#name", "#sec_name", "#phone", "#emp",
        "#country", "#region", "#city", "#street", "#house",
        "#email", "#pass", "#pass2", "#date"];
    /*for(var i=0; i<arr.length;i++){
        $(arr[i]).focusout(checkNull);
    }*/
    for (var i = 0; i < arr.length; i++) {
        $(arr[i]).focusin(function () {
            $(this).removeClass("suctextbox");
            $(this).removeClass("errtextbox");
            flags[i + 1] = false;
            window.onbeforeunload = function () {
                return true;
            };
        });
    }
    $(arr[11]).focusin(function () {
        $(".psw-validate").addClass("open-psw");
        $(arr[12]).val("").removeClass("suctextbox").addClass("errtextbox");
        flags[13] = false;
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
        surname = value;
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
            flags[1] = false;
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
            flags[1] = true;

        }
    });
    $(arr[1]).focusout(function () {
        var value = $(this).val();
        name = value;
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
            flags[2] = false;
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
            flags[2] = true;
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
            flags[3] = false;
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
            flags[3] = true;
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
            flags[4] = false;
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
            flags[4] = true;
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
            flags[7] = false;
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
            flags[7] = true;
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
            flags[8] = false;
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
            flags[8] = true;
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
            flags[9] = false;
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
            flags[9] = true;
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
            flags[10] = false;
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
            flags[10] = true;
        }
    });
    $(arr[10]).focusout(function () {
        var value = $(this).val();
        email = value;
        if (value.search(/^[a-z0-9._%+-]{3,}@[a-z0-9.-]{1,}\.[a-z]{2,}$/i) == 0) {
            $("#loader-input-email").show();
            $.ajax({
                url: val_servlet_path,
                type: "POST",
                dataType: "html",
                data: "id=1&valid=" + value,
                success: function (resultText) {
                    $("#loader-input-email").hide();
                    if (resultText === "no") {
                        $(arr[10]).notify("Email доступен", {
                            position: "top left",
                            autoHideDelay: 2000,
                            arrowShow: false,
                            className: 'success',
                            gap: 1
                        });
                        $(arr[10]).removeClass("errtextbox");
                        $(arr[10]).addClass("suctextbox");
                        flags[11] = true;
                    } else {
                        $(arr[10]).notify("email занят", {
                            position: "top left",
                            autoHideDelay: 2000,
                            arrowShow: false,
                            className: 'error',
                            gap: 1
                        });
                        $(arr[10]).removeClass("suctextbox");
                        $(arr[10]).addClass("errtextbox");
                        flags[11] = false;
                    }
                },
                error: function (response) {
                    $("#loader-input-email").hide();
                    serverError();
                }
            });

        } else {
            if (value.trim() === "") $(this).notify("Заполните поле", {
                position: "top left",
                autoHideDelay: 2000,
                height: '10px',
                arrowShow: false,
                className: 'warn',
                gap: 1
            });
            else $(this).notify("email некорректен", {
                position: "top left",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'error',
                gap: 1
            });
            $(this).removeClass("suctextbox");
            $(this).addClass("errtextbox");
            flags[11] = false;
        }
    });

    var pass_check = "";
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
            flags[12] = true;
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
            flags[12] = false;
        }
    });
    $(arr[12]).focusout(function () {
        var value = $(this).val().trim();
        if (value == pass_check && pass_check != "") {
            $(this).notify("Верно", {
                position: "top left",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'success',
                gap: 1
            });
            $(this).removeClass("errtextbox");
            $(this).addClass("suctextbox");
            flags[13] = true;
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
            flags[13] = false;

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
            flags[14] = false;
        } else {
            var m = moment(new Date());
            var years = m.diff(new Date($(this).val()), 'years');
            if (years <= 100 && years >= 5) {
                if ($("#emp").val() === "Репетитор" && years >= 16) {
                    $(this).notify("Верно", {
                        position: "top left",
                        autoHideDelay: 2000,
                        arrowShow: false,
                        className: 'success',
                        gap: 1
                    });
                    $(this).addClass("suctextbox");
                    flags[14] = true;
                } else if ($("#emp").val() === "Репетитор") {
                    $(this).notify("Репетитором можно стать строго с 16 лет", {
                        position: "top left",
                        autoHideDelay: 2000,
                        arrowShow: false,
                        className: 'error',
                        gap: 1
                    });
                    $(this).addClass("errtextbox");
                    flags[14] = false;
                }
                if ($("#emp").val() === "Ученик") {
                    $(this).notify("Верно", {
                        position: "top left",
                        autoHideDelay: 2000,
                        arrowShow: false,
                        className: 'success',
                        gap: 1
                    });
                    $(this).addClass("suctextbox");
                    flags[14] = true;
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
                flags[14] = false;
            } else if (years >= 5) {
                $(this).notify("Максимум: 100 лет", {
                    position: "top left",
                    autoHideDelay: 2000,
                    arrowShow: false,
                    className: 'error',
                    gap: 1
                });
                $(this).addClass("errtextbox");
                flags[14] = false;
            }
        }
    }).focusin(function () {
        var date = new Date()
        if ($("#emp").val() === "Репетитор") {
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
            flags[14] = false;
        }
    });


    $("#sub_reg").click(function () {
        var count = 0;
        for (var i = 0; i < 15; i++) {
            if (!flags[i]) count++;
        }
        if (count === 3) {
            if ($("#policy-checkbox").prop('checked')) {
                if (getCookie("user") === undefined) {
                    load_yes()
                    $.ajax({
                        url: conf_servlet_path,
                        type: "POST",
                        dataType: "html",
                        data: "id=1&to=" + email + "&surname=" + surname + "&name=" + name,
                        success: function (resultText) {
                            load_no()
                            code = resultText;
                            $("#reg").hide()
                            $("#confirm_email").show()
                            anim_func("#confirm_email");
                        },
                        error: function (response) {
                            load_no()
                            serverError();
                        }
                    });
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

            } else {
                $(this).notify("Вы не ознакомились с условиями", {
                    position: "top center",
                    autoHideDelay: 5000,
                    arrowShow: false,
                    className: 'error',
                    gap: 1
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

function Confirm() {
    if (getCookie("user") === undefined) {
        var hash = window.code.toString();
        load_yes();
        $.ajax({
            url: conf_servlet_path,
            type: "POST",
            dataType: "html",
            data: "id=2&hash=" + hash + "&val=" + $("#confirm").val().trim(),
            success: function (resultText) {
                if (resultText === "1") {
                    sendLoginForm('reg_form', reg_servlet_path, 'reg');
                } else {
                    load_no();
                    $("#policy-checkbox").prop('checked', false);
                    flags[11] = false;
                    $("#email").val("").removeClass("suctextbox").addClass("errtextbox")
                        .notify("Код неверен, повторите ваш email", {
                            position: "top left",
                            autoHideDelay: 10000,
                            arrowShow: false,
                            className: 'error',
                            gap: 1
                        });
                    $("#confirm_email").hide();
                    $("#reg").show();
                    anim_func("#reg");
                }
                $("#confirm").val("");
            },
            error: function (response) {
                serverError();
                load_no();
            }
        });
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

}