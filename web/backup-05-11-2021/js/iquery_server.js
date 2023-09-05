function sendLoginForm(form_data, url, kind_of_form) {
    var has_cookies = getCookie("user") !== undefined;
    $.ajax({
        url: url,
        type: "POST",
        dataType: "html",
        data: $("#" + form_data).serialize(),
        success: function (result) {
            load_no();
            if (kind_of_form === 'login') {
                if (result === "1") {
                    if (!has_cookies) toHomePage();
                    else $("#sub_log").notify("Вход в аккаунт уже выполнен", {
                        position: "top center",
                        autoHideDelay: 5000,
                        arrowShow: false,
                        className: 'error',
                        gap: 0
                    });
                } else {
                    $("#pass_log").val('')
                    $("#sub_log").notify("Ошибка входа!", {
                        position: "top center",
                        autoHideDelay: 5000,
                        arrowShow: false,
                        className: 'error',
                        gap: 0
                    });
                }
            } else if (kind_of_form === 'reg') {
                window.onbeforeunload = null;
                if (result === '1') {
                    swal.fire({
                        title: "Аккаунт создан!",
                        text: "Вы успешно создали новый аккаунт, приятного вам пользования услугами сайта!",
                        icon: "success",
                        footer: '<a style="color: rgb(72, 31, 187); cursor: pointer; font-size: 20px" onclick="toFeedBackPage()">Вопросы? Обратитесь к нам</a>',
                    }).then((result) => {
                        toLoginPage();
                    })
                    document.body.style.paddingRight = '0';
                } else {
                    swal.fire({
                        title: "Ошибка регистрации",
                        text: "Во время создания аккаунта произошла непредвиденная ошибка. Ваш аккаунт не зарегистрирован!\nПовторите попытку позже, либо свяжитесь с нами",
                        icon: "error",
                        footer: '<a style="color: rgb(72, 31, 187); cursor: pointer; font-size: 20px" onclick="toFeedBackPage()">Вопросы? Обратитесь к нам</a>',
                    }).then((result) => {
                        toRegPage();
                    })
                    document.body.style.paddingRight = '0';
                }
            }
        },
        error: function (response) {
            serverError();
            load_no();
        }
    });
}

function sendLKForm(data) {
    $.ajax({
        url: cookies_servlet_path,
        type: "POST",
        dataType: "html",
        data: data,
        success: function (result) {
            if (result === "1") {
                load_no();
                swal.fire({
                    title: "Данные обновлены",
                    text: "Ваши персональные данные успешно обновлены",
                    icon: "success",
                    footer: '<a style="color: rgb(72, 31, 187); cursor: pointer; font-size: 20px" onclick="toFeedBackPage()">Вопросы? Обратитесь к нам</a>',
                }).then((result) => {
                })
                document.body.style.paddingRight = '0';
                $("#change-psw").hide()
                $("#change-psw-repeat").hide()
                update_lk_data()
            } else {
                load_no();
                ntf("Данные обновлены частично", "Ваши данные обновлены в базе, но произошла ошибка загрузки новых данных. Попробуйте выйти из аккаунта и заново войти", "error")
            }
        },
        error: function (response) {
            serverError();
            load_no();
        }
    });
}

function getCookie(name) {
    let matches = document.cookie.match(new RegExp(
        "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
    ));
    return matches ? decodeURIComponent(matches[1]) : undefined;
}

function deleteCookie(name) {
    setCookie(name, "", {
        'max-age': -1
    })
}

function setCookie(name, value, options = {}) {

    options = {
        path: '/',
        // при необходимости добавьте другие значения по умолчанию
        ...options
    };

    if (options.expires instanceof Date) {
        options.expires = options.expires.toUTCString();
    }

    let updatedCookie = encodeURIComponent(name) + "=" + encodeURIComponent(value);

    for (let optionKey in options) {
        updatedCookie += "; " + optionKey;
        let optionValue = options[optionKey];
        if (optionValue !== true) {
            updatedCookie += "=" + optionValue;
        }
    }

    document.cookie = updatedCookie;
}
