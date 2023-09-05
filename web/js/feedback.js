var flags;
var arr;

function valid_feedback() {
    flags = [false, false, false];
    arr = ["#from_name_feedback", "#from_email_feedback", "#feedback_textarea_page"];
    for (var i = 0; i < 2; i++) {
        $(arr[i]).focusin(function () {
            $(this).removeClass("suctextbox");
            $(this).removeClass("errtextbox");
            flags[i] = false;
        });
    }
    $(arr[2]).focusin(function () {
        $(this).removeClass("suctextbox");
        $(this).removeClass("errtextbox");
        $(this).addClass("deftextbox");
        flags[2] = false;
    });
    if (getCookie("user") !== undefined) {
        $(arr[0]).addClass("suctextbox");
        flags[0] = true;
        $(arr[1]).addClass("suctextbox");
        flags[1] = true;
    }
    $(arr[0]).focusout(function () {
        var value = $(this).val().trim();
        if (value.search(/^[A-Za-zА-Яа-я\s.,_-]{3,}$/i) != 0) {
            $(this).notify("Некорректное имя", {
                position: "bottom center",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'error',
                gap: 0
            });
            $(this).removeClass("suctextbox");
            $(this).addClass("errtextbox");
            flags[0] = false;
        } else {
            $(this).notify("Верно", {
                position: "bottom center",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'success',
                gap: 0
            });
            $(this).removeClass("errtextbox");
            $(this).addClass("suctextbox");
            flags[0] = true;

        }
    });
    $(arr[1]).focusout(function () {
        var value = $(this).val().trim();
        if (value.search(/^[a-z0-9._%+-]{3,}@[a-z0-9.-]{1,}\.[a-z]{2,}$/i) == 0) {
            $(this).notify("Верно", {
                position: "bottom center",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'success',
                gap: 0
            });
            $(this).removeClass("errtextbox");
            $(this).addClass("suctextbox");
            flags[1] = true;
        } else {
            $(this).notify("Некорректный email", {
                position: "bottom center",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'error',
                gap: 0
            });
            $(this).removeClass("suctextbox");
            $(this).addClass("errtextbox");
            flags[1] = false;
        }
    });
    $(arr[2]).focusout(function () {
        $(this).removeClass("deftextbox");
        if ($(this).val().trim().length >= 10) {
            $(this).removeClass("errtextbox");
            $(this).addClass("suctextbox");
            $(this).notify("Верно", {
                position: "bottom center",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'success',
                gap: 0
            });

            flags[2] = true;
        } else {
            $(this).notify("Мало символов", {
                position: "bottom center",
                autoHideDelay: 2000,
                arrowShow: false,
                className: 'error',
                gap: 0
            });
            $(this).removeClass("suctextbox");
            $(this).addClass("errtextbox");
            flags[2] = false;
        }
    });
    $("#send_footer_page").click(function () {
        if (flags[0] && flags[1] && flags[2]) {
            var title = "Feedback from TutRes.com user";
            var text = $("#feedback_textarea_page").val().trim() + "<br><br>--<br>Best regards,<br>" +
                $("#from_name_feedback").val() + "<br>sent from " + $("#from_email_feedback").val();
            $("#loader").show();
            $("#send_footer_page").attr("disabled", true);

            $.ajax({
                url: feed_servlet_path,
                type: "POST",
                dataType: "html",
                data: "text=" + text + "&title=" + title,
                success: function (resultText) {
                    $("#loader").hide();
                    $("#send_footer_page").attr("disabled", false)
                    if (resultText.toString() === "success") {
                        $("#send_footer_page").notify("Отправлено", {
                            position: "top center",
                            autoHideDelay: 3000,
                            arrowShow: false,
                            className: 'success',
                            gap: 0
                        });
                        $("#feedback_textarea_page").val("").removeClass("suctextbox").removeClass("errtextbox").addClass("deftextbox");
                        flags[2] = false;
                    } else $("#send_footer_page").notify("Ошибка",
                        {
                            position: "top center",
                            autoHideDelay: 3000,
                            arrowShow: false,
                            className: 'error',
                            gap: 0
                        });
                },
                error: function (response) {
                    $("#loader").hide();
                    $("#send_footer_page").attr("disabled", false).notify("Ошибка", {
                        position: "top center",
                        autoHideDelay: 3000,
                        arrowShow: false,
                        className: 'error',
                        gap: 0
                    });
                }
            });
        } else {
            $(this).notify("Форма заполнена некорректно", {
                position: "top center",
                autoHideDelay: 5000,
                arrowShow: false,
                className: 'error',
                gap: 0
            });
        }
    });

}
