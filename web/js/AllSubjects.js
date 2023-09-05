var accs_all_subs;
var allStudents_all_subs;


function AllSubjectsButton(titleID, containerID, imgPath, maxInList) {
    var list_all_subs_counter = 1;
    var user = getCookie("user");
    if (user === undefined || user.split('/')[3] === "Ученик") {
        $.ajax({
            url: ttrlist_servlet_path,
            type: "POST",
            dataType: "html",
            data: "id=3",
            success: function (resultText) {
                accs_all_subs = resultText.split("//");
                var counter_id = 1
                var subjects = []
                var time = new Date().toLocaleTimeString('en-US', {
                    hour12: false,
                    hour: "numeric",
                    minute: "numeric"
                });
                if (accs_all_subs.length === 0 || (accs_all_subs.length === 1 && accs_all_subs[0] === "")) $(titleID).html("Репетиторов пока нет (обн. в " + time + ")");
                for (var i = 0; i < accs_all_subs.length; i++) {
                    if (accs_all_subs[i] !== "") {
                        var personalData = accs_all_subs[i].split("_");
                        $(titleID).html("Все предметы - Список доступных репетиторов (обн. в " + time + ")");
                        var local_subjects = personalData[6].split(", ")
                        subjects.push(...local_subjects)
                        for (var k = 0; k < local_subjects.length; k++) {
                            $(containerID).html($(containerID).html() + "<div class=\"col-lg-12 col-md-12\" style='display: none' id=\"general-userinfo-container-" + counter_id + "\">\n" +
                                "                            <div class=\"single_jobs white-bg d-flex justify-content-between\">\n" +
                                "                                <div class=\"jobs_left d-flex align-items-center\">\n" +
                                "                                    <div class=\"thumb\">\n" +
                                "                                        <img src=\"" + imgPath + "\" width='48px' height='48px' alt=\"\">\n" +
                                "                                    </div>\n" +
                                "                                    <div class=\"jobs_conetent\">\n" +
                                "                                        <a onclick=''><h4 id=\"" + "tutor-name-" + counter_id + "\"></h4></a>\n" +
                                "                                        <div class=\"links_locat d-flex align-items-center\">\n" +
                                "                                            <div class=\"location\">\n" +
                                "                                                <p > <i class=\"fa fa-envelope-o\"></i> <a style='font-size: 16px; color: #AAB1B7;' id=\"" + "email-" + counter_id + "\"></a></p>\n" +
                                "                                                <p> <i class=\"fa fa-map-marker\"></i> <a style='font-size: 16px; color: #AAB1B7;' id=\"" + "address-" + counter_id + "\"></a></p>\n" +
                                "                                            </div>\n" +
                                "                                        </div>\n" +
                                "                                    </div>\n" +
                                "                                </div>\n" +
                                "                                <div class=\"jobs_right\">\n" +
                                "                                    <div class=\"apply_now\">\n" +
                                "                                        <a style=\"display: none\" id=\"" + "request-button-" + counter_id + "-user-" + i + "\" onclick=''> <i id=\"" + "request-button-icon-" + counter_id + "\"></i> </a>" +
                                "                                        <a id=\"" + "status-" + counter_id + "-user-" + i + "\" onclick='' class=\"boxed-btn3\" style=\"color: white\">Добавить</a>\n" +
                                /* "                                        <a style=\"display: none\" id=\"" + "delete-request-button-" + (i+1) + "\" onclick='' class=\"boxed-btn3-red\" style=\"color: white\">Удалить</a>\n" +*/
                                "                                    </div>\n" +
                                "                                    <div class=\"jobs_conetent\">\n" +
                                "                                    <div class=\"links_locat d-flex align-items-center\">\n" +
                                "                                    <div class=\"location\">\n" +
                                "                                        <p style=\"margin-bottom: 0; font-size: 16px; color: #AAB1B7;\"> <i class=\"fa fa-phone\"></i> <a style='font-size: 16px; color: #AAB1B7;' id=\"" + "phone-" + counter_id + "\"></a></p>\n" +
                                "                                        <p style=\"margin-bottom: 0; font-size: 16px; color: #AAB1B7;\"> <i class=\"fa fa-graduation-cap\"></i> <span id=\"" + "subjects-" + counter_id + "\"></span></p>\n" +
                                "                                    </div>\n" +
                                "                                    </div>\n" +
                                "                                    </div>\n" +
                                "                                </div>\n" +
                                "                            </div>\n" +
                                "                        </div>\n")
                            var m = moment(new Date());
                            var years = m.diff(new Date(personalData[7]), 'years');
                            var address = personalData[2].split(", ")[2] + ", " + personalData[2].split(", ")[0];
                            $("#tutor-name-" + counter_id).html(personalData[1] + " " + personalData[0] + ", " + years)
                            $("#address-" + counter_id).html(address).attr('href', 'http://maps.google.com/?q=' + address).attr('target', '_blank');
                            $("#email-" + counter_id).html(personalData[3]).attr('href', 'mailto:' + personalData[3]);
                            $("#phone-" + counter_id).html(personalData[4]).attr('href', 'tel:' + personalData[4]);
                            $("#subjects-" + counter_id).html(subjects[counter_id - 1])
                            var button_visible = true;
                            if (getCookie('user') !== undefined) {
                                var cookies_arr = getCookie('user').split('/');
                                $.ajax({
                                    url: all_subs_servlet_path,
                                    type: "POST",
                                    dataType: "html",
                                    data: "id=2&tutorValid=" + personalData[5] + "&studentId=" + cookies_arr[5] + "&subject=" + $("#subjects-" + counter_id).html() + "&counterId=" + counter_id + "&i=" + i,
                                    success: function (resultText) {
                                        var counter_id_arr = resultText.split("|");
                                        var result_arr = counter_id_arr[0].split("_");
                                        var counter_id_servlet = counter_id_arr[1];
                                        var i_servlet = counter_id_arr[2];
                                        if (result_arr[0] === "true") {
                                            if (result_arr[1] === "active") {
                                                $("#status-" + counter_id_servlet + "-user-" + i_servlet).text("Подтверждено");

                                            } else if (result_arr[1] === "inactive") {
                                                $("#status-" + counter_id_arr[1] + "-user-" + counter_id_arr[2]).removeClass("boxed-btn3").addClass("boxed-btn3-red").text("В ожидании");
                                            }
                                            $("#request-button-" + counter_id_servlet + "-user-" + i_servlet).addClass("unsuccessful-tutor-request").show().prop('title', 'удалить запрос');
                                            $("#request-button-icon-" + counter_id_servlet).addClass("fa fa-times").show();

                                            $(document).on('click', "#request-button-" + counter_id_servlet + "-user-" + i_servlet, function () {
                                                remove_all(this.id, titleID, containerID, imgPath, maxInList);
                                            });
                                        } else {
                                            $(document).on('click', "#status-" + counter_id_servlet + "-user-" + i_servlet, function () {
                                                var selected_subject = $("#subjects-" + this.id.split("-")[1]).html()
                                                if (getCookie("user") !== undefined && getCookie("user").split("/")[11].split(", ").includes(selected_subject)) add_all(this.id, titleID, containerID, imgPath, maxInList);
                                                else if (getCookie("user") !== undefined) {
                                                    swal.fire({
                                                        title: "Функция недоступна!",
                                                        html: "Предмет \"" + selected_subject + "\" не указан в списке предметов вашего аккаунта. Изменить это вы можете в " +
                                                            "<a style='font-size: 18px;' onclick='toLKPage()'>личном кабинете</a>.",
                                                        icon: "error",
                                                        footer: '<a style="color: rgb(72, 31, 187); cursor: pointer; font-size: 20px" onclick="toFeedBackPage()">Вопросы? Обратитесь к нам</a>',
                                                    })
                                                    document.body.style.paddingRight = '0';
                                                } else add_all(this.id, titleID, containerID, imgPath, maxInList);
                                            });
                                        }
                                    },
                                    error: function (response) {
                                        serverError();
                                    }
                                });
                            } else {
                                $(document).on('click', "#status-" + counter_id + "-user-" + i, function () {
                                    add_all(this.id, titleID, containerID, imgPath, maxInList);
                                });
                            }
                            counter_id++
                        }
                    }
                }
                for (var g = 1; g <= maxInList; g++) {
                    var id = $("#general-userinfo-container-" + g);
                    if (id.length !== 0) id.show()
                }
                $(containerID).html($(containerID).html() + "<div class=\"row\" id='next-previous-container' style='margin-right: auto; margin-left: auto; display: none'>\n" +
                    "                        <div class=\"col-lg-12\">\n" +
                    "                            <div class=\"pagination_wrap\">\n" +
                    "                                <ul>\n" +
                    "                                    <li><a id=\"all_subs_list_previous\" style='display: none' class='list-next-previous'> <i class=\"ti-angle-left list-next-previous-icon\"></i> </a></li>\n" +
                    "                                    <li><a id=\"all_subs_list_next\" class='list-next-previous'> <i class=\"ti-angle-right list-next-previous-icon\"></i> </a></li>\n" +
                    "                                </ul>\n" +
                    "                            </div>\n" +
                    "                        </div>\n" +
                    "                    </div>")
                /*$("#all_subs_list_next").attr("href", "#" + parseInt(window.location.hash))*/
                if (counter_id > maxInList) $("#next-previous-container").show()
                $("#all_subs_list_next").on('click', function () {
                    if (counter_id - maxInList * list_all_subs_counter > 0) {
                        var local = maxInList * (list_all_subs_counter - 1);
                        for (var g = 1 + local; g <= maxInList + local; g++) {
                            $("#general-userinfo-container-" + g).hide()
                        }
                        list_all_subs_counter++;
                        var local_post = maxInList * (list_all_subs_counter - 1);
                        for (var p = 1 + local_post; p <= maxInList + local_post; p++) {
                            $("#general-userinfo-container-" + p).show()
                        }
                        if (list_all_subs_counter <= 1) $("#all_subs_list_previous").hide()
                        else $("#all_subs_list_previous").show()

                        if (counter_id - maxInList * list_all_subs_counter <= 0) $("#all_subs_list_next").hide()
                        else $("#all_subs_list_next").show()
                        $("html,body").animate({scrollTop: $(containerID).offset().top - 200}, 300);
                    }
                })
                $("#all_subs_list_previous").on('click', function () {
                    if (list_all_subs_counter > 1) {
                        var local = maxInList * (list_all_subs_counter - 1);
                        for (var g = 1 + local; g <= maxInList + local; g++) {
                            $("#general-userinfo-container-" + g).hide()
                        }
                        list_all_subs_counter--;
                        var local_post = maxInList * (list_all_subs_counter - 1);
                        for (var p = 1 + local_post; p <= maxInList + local_post; p++) {
                            $("#general-userinfo-container-" + p).show()
                        }
                        if (list_all_subs_counter <= 1) $("#all_subs_list_previous").hide()
                        else $("#all_subs_list_previous").show()

                        if (counter_id - maxInList * list_all_subs_counter <= 0) $("#all_subs_list_next").hide()
                        else $("#all_subs_list_next").show()
                        $("html,body").animate({scrollTop: $(containerID).offset().top - 200}, 300);
                    }
                })
            },
            error: function (response) {
                serverError();
            }
        });
    } else {
        var user_cookies = getCookie("user").split('/');
        $.ajax({
            url: all_subs_servlet_path,
            type: "POST",
            dataType: "html",
            data: "id=4&tutorID=" + user_cookies[5] + "&subject=all",
            success: function (resultText) {
                allStudents_all_subs = resultText.split("//");
                var students = resultText.split("//");
                var time = new Date().toLocaleTimeString('en-US', {
                    hour12: false,
                    hour: "numeric",
                    minute: "numeric"
                });
                var counter_id = students.length;
                if (counter_id === 0 || (counter_id === 1 && students[0] === "")) $(titleID).html("Запросов нет (обн. в " + time + ")");
                for (var i = 0; i < counter_id; i++) {
                    if (students[i] !== "") {
                        $(titleID).html("Все предметы - Запросы (обн. в " + time + ")");
                        $(containerID).html($(containerID).html() + "<div class=\"col-lg-12 col-md-12\" style='display: none' id=\"general-userinfo-container-" + (i + 1) + "\">\n" +
                            "                            <div class=\"single_jobs white-bg d-flex justify-content-between\">\n" +
                            "                                <div class=\"jobs_left d-flex align-items-center\">\n" +
                            "                                    <div class=\"thumb\">\n" +
                            "                                        <img src=\"" + imgPath + "\" width='48px' height='48px' alt=\"\">\n" +
                            "                                    </div>\n" +
                            "                                    <div class=\"jobs_conetent\">\n" +
                            "                                        <a onclick=''><h4 id=\"" + "tutor-name-" + (i + 1) + "\"></h4></a>\n" +
                            "                                        <div class=\"links_locat d-flex align-items-center\">\n" +
                            "                                            <div class=\"location\">\n" +
                            "                                                <p> <i class=\"fa fa-envelope-o\"></i> <a style='font-size: 16px; color: #AAB1B7;' id=\"" + "email-" + (i + 1) + "\"></a></p>\n" +
                            "                                                <p> <i class=\"fa fa-map-marker\"></i> <a style='font-size: 16px; color: #AAB1B7;' id=\"" + "address-" + (i + 1) + "\"></a></p>\n" +
                            "                                            </div>\n" +
                            "                                        </div>\n" +
                            "                                    </div>\n" +
                            "                                </div>\n" +
                            "                                <div class=\"jobs_right\">\n" +
                            "                                    <div class=\"apply_now\">\n" +
                            "                                        <a style=\"display: none\" id=\"" + "request-button-" + (i + 1) + "\" onclick=''> <i id=\"" + "request-button-icon-" + (i + 1) + "\"></i> </a>" +
                            "                                        <a style=\"display: none\" id=\"" + "status-" + (i + 1) + "\" onclick='' style=\"color: white\"></a>\n" +
                            /*"                                        <a style=\"display: none\" id=\"" + "delete-request-button-" + (i+1) + "\" onclick='' class=\"boxed-btn3-red\" class="boxed-btn3" style=\"color: white\">Отклонить</a>\n" +*/
                            "                                    </div>\n" +
                            "                                    <div class=\"jobs_conetent\">\n" +
                            "                                    <div class=\"links_locat d-flex align-items-center\">\n" +
                            "                                    <div class=\"location\">\n" +
                            "                                        <p style=\"margin-bottom: 0;font-size: 16px;color: #AAB1B7;\"> <i class=\"fa fa-phone\"></i> <a style='font-size: 16px; color: #AAB1B7;' id=\"" + "phone-" + (i + 1) + "\"></a></p>\n" +
                            "                                        <p style=\"margin-bottom: 0;font-size: 16px;color: #AAB1B7;\"> <i class=\"fa fa-graduation-cap\"></i> <span id=\"" + "subjects-" + (i + 1) + "\"></span></p>\n" +
                            "                                    </div>\n" +
                            "                                    </div>\n" +
                            "                                    </div>\n" +
                            "                                </div>\n" +
                            "                            </div>\n" +
                            "                        </div>\n")
                        var personalData = students[i].split(" ||| ");
                        var m = moment(new Date());
                        var years = m.diff(new Date(personalData[15]), 'years');
                        var address = personalData[4] + ", " + personalData[6];
                        $("#tutor-name-" + (i + 1)).html(personalData[0] + " " + personalData[1] + ", " + years)
                        $("#address-" + (i + 1)).html(address).attr('href', 'http://maps.google.com/?q=' + address).attr('target', '_blank');
                        $("#email-" + (i + 1)).html(personalData[10]).attr('href', 'mailto:' + personalData[10]);
                        $("#phone-" + (i + 1)).html(personalData[9]).attr('href', 'tel:' + personalData[9]);
                        $("#subjects-" + (i + 1)).html(personalData[16])

                        if (getCookie('user') !== undefined) {
                            var cookies_arr = getCookie('user').split('/');
                            /*alert(personalData[13] + " " + cookies_arr[5]);*/
                            $.ajax({
                                url: all_subs_servlet_path,
                                type: "POST",
                                dataType: "html",
                                data: "id=2&tutorValid=" + cookies_arr[5] + "&studentId=" + personalData[13] + "&subject=" + $("#subjects-" + (i + 1)).html() + "&counterId=" + i + "&i=" + i,
                                success: function (resultText) {
                                    var counter_id_arr = resultText.split("|");
                                    var result_arr = counter_id_arr[0].split("_");
                                    var counter_id_servlet = parseInt(counter_id_arr[1]);
                                    var i_servlet = parseInt(counter_id_arr[2]);
                                    if (result_arr[0] === "true") {
                                        if (result_arr[1] === "active") {
                                            /* $("#request-status-" + (i+1)).addClass("successful-tutor-request").show();
                                             $("#request-icon-" + (i+1)).addClass("fa fa-check");*/
                                            $("#status-" + (i_servlet + 1)).addClass("boxed-btn3").text("Подтверждено").show();
                                            $("#request-button-icon-" + (i_servlet + 1)).addClass("fa fa-times");
                                            $("#request-button-" + (i_servlet + 1)).addClass("unsuccessful-tutor-request").show().prop('title', 'отклонить запрос');
                                            $(document).on('click', "#request-button-" + (i_servlet + 1), function () {
                                                delete_pair_all(this.id, titleID, containerID, imgPath, maxInList);
                                            });
                                        } else if (result_arr[1] === "inactive") {
                                            $("#status-" + (i_servlet + 1)).addClass("boxed-btn3-red").text("Не Подтверждено").show();
                                            $("#request-button-icon-" + (i_servlet + 1)).addClass("fa fa-check");
                                            $("#request-button-" + (i_servlet + 1)).addClass("successful-tutor-request").show().prop('title', 'принять запрос');
                                            $(document).on('click', "#request-button-" + (i_servlet + 1), function () {
                                                add_pair_all(this.id, titleID, containerID, imgPath, maxInList);
                                            });
                                        }
                                    }
                                },
                                error: function (response) {
                                    serverError();
                                }
                            });
                        }
                    }
                }
                /*testing
               for (var r = 0; r < 50; r++) {
               $(containerID).html($(containerID).html()+"<div class=\"col-lg-12 col-md-12\" style='display: none' id=\"general-userinfo-container-" + counter_id + "\">\n" +
                   "                            <div class=\"single_jobs white-bg d-flex justify-content-between\">\n" +
                   "                                <div class=\"jobs_left d-flex align-items-center\">\n" +
                   "                                    <div class=\"thumb\">\n" +
                   "                                        <img src=\"" + imgPath + "\" width='48px' height='48px' alt=\"\">\n" +
                   "                                    </div>\n" +
                   "                                    <div class=\"jobs_conetent\">\n" +
                   "                                        <a onclick=''><h4 id=\"" + "tutor-name-" + counter_id + "\">" + counter_id + "</h4></a>\n" +
                   "                                        <div class=\"links_locat d-flex align-items-center\">\n" +
                   "                                            <div class=\"location\">\n" +
                   "                                                <p > <i class=\"fa fa-envelope-o\"></i> <a style='font-size: 16px; color: #AAB1B7;' id=\"" + "email-" + counter_id + "\"></a></p>\n" +
                   "                                                <p> <i class=\"fa fa-map-marker\"></i> <a style='font-size: 16px; color: #AAB1B7;' id=\"" + "address-" + counter_id + "\"></a></p>\n" +
                   "                                            </div>\n" +
                   "                                        </div>\n" +
                   "                                    </div>\n" +
                   "                                </div>\n" +
                   "                                <div class=\"jobs_right\">\n" +
                   "                                    <div class=\"apply_now\">\n" +
                   "                                        <a style=\"display: none\" id=\"" + "request-button-" + counter_id + "\" onclick=''> <i id=\"" + "request-button-icon-" + counter_id + "\"></i> </a>" +
                   "                                        <a id=\"" + "status-" + counter_id + "\" onclick='' class=\"boxed-btn3\" style=\"color: white\">Добавить</a>\n" +
                   "                                    </div>\n" +
                   "                                    <div class=\"jobs_conetent\">\n" +
                   "                                    <div class=\"links_locat d-flex align-items-center\">\n" +
                   "                                    <div class=\"location\">\n" +
                   "                                        <p style=\"margin-bottom: 0; font-size: 16px; color: #AAB1B7;\"> <i class=\"fa fa-phone\"></i> <a style='font-size: 16px; color: #AAB1B7;' id=\"" + "phone-" + counter_id + "\"></a></p>\n" +
                   "                                        <p style=\"margin-bottom: 0; font-size: 16px; color: #AAB1B7;\"> <i class=\"fa fa-birthday-cake\"></i> <span id=\"" + "subjects-" + counter_id + "\"></span></p>\n" +
                   "                                    </div>\n" +
                   "                                    </div>\n" +
                   "                                    </div>\n" +
                   "                                </div>\n" +
                   "                            </div>\n" +
                   "                        </div>\n")
                   counter_id += 1
               }
               end testing*/
                for (var g = 1; g <= maxInList; g++) {
                    var id = $("#general-userinfo-container-" + g);
                    if (id.length !== 0) id.show()
                }
                $(containerID).html($(containerID).html() + "<div class=\"row\" id='next-previous-container' style='margin-right: auto; margin-left: auto; display: none'>\n" +
                    "                        <div class=\"col-lg-12\">\n" +
                    "                            <div class=\"pagination_wrap\">\n" +
                    "                                <ul>\n" +
                    "                                    <li><a id=\"all_subs_list_previous\" style='display: none' class='list-next-previous'> <i class=\"ti-angle-left list-next-previous-icon\"></i> </a></li>\n" +
                    "                                    <li><a id=\"all_subs_list_next\" class='list-next-previous'> <i class=\"ti-angle-right list-next-previous-icon\"></i> </a></li>\n" +
                    "                                </ul>\n" +
                    "                            </div>\n" +
                    "                        </div>\n" +
                    "                    </div>")
                /*$("#all_subs_list_next").attr("href", "#" + parseInt(window.location.hash))*/
                if (counter_id > maxInList) $("#next-previous-container").show()
                $("#all_subs_list_next").on('click', function () {
                    if (counter_id - maxInList * list_all_subs_counter > 0) {
                        var local = maxInList * (list_all_subs_counter - 1);
                        for (var g = 1 + local; g <= maxInList + local; g++) {
                            $("#general-userinfo-container-" + g).hide()
                        }
                        list_all_subs_counter++;
                        var local_post = maxInList * (list_all_subs_counter - 1);
                        for (var p = 1 + local_post; p <= maxInList + local_post; p++) {
                            $("#general-userinfo-container-" + p).show()
                        }
                        if (list_all_subs_counter <= 1) $("#all_subs_list_previous").hide()
                        else $("#all_subs_list_previous").show()

                        if (counter_id - maxInList * list_all_subs_counter <= 0) $("#all_subs_list_next").hide()
                        else $("#all_subs_list_next").show()

                        $("html,body").animate({scrollTop: $(containerID).offset().top - 200}, 300);
                    }
                })
                $("#all_subs_list_previous").on('click', function () {
                    if (list_all_subs_counter > 1) {
                        var local = maxInList * (list_all_subs_counter - 1);
                        for (var g = 1 + local; g <= maxInList + local; g++) {
                            $("#general-userinfo-container-" + g).hide()
                        }
                        list_all_subs_counter--;
                        var local_post = maxInList * (list_all_subs_counter - 1);
                        for (var p = 1 + local_post; p <= maxInList + local_post; p++) {
                            $("#general-userinfo-container-" + p).show()
                        }
                        if (list_all_subs_counter <= 1) $("#all_subs_list_previous").hide()
                        else $("#all_subs_list_previous").show()

                        if (counter_id - maxInList * list_all_subs_counter <= 0) $("#all_subs_list_next").hide()
                        else $("#all_subs_list_next").show()

                        $("html,body").animate({scrollTop: $(containerID).offset().top - 200}, 300);
                    }
                })
            },
            error: function (response) {
                serverError();
            }
        });
    }
}

function add_all(button_id, titleID, containerID, imgPath, maxInList) {
    var id = button_id.split("-")[1] - 1;
    var user = button_id.split("-")[3];
    var person = accs_all_subs[user].split("_");
    if (getCookie('user') === undefined) {
        swal.fire({
            title: "Функция недоступна!",
            text: "Для выбора репетитора необходимо войти в систему",
            icon: "error",
            footer: '<a style="color: rgb(72, 31, 187); cursor: pointer; font-size: 20px" onclick="toFeedBackPage()">Вопросы? Обратитесь к нам</a>',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Войти в систему',
            cancelButtonText: 'Отмена'
        }).then((result) => {
            if (result.isConfirmed) {
                toLoginPage();
            }
        })
        document.body.style.paddingRight = '0';
    } else {
        swal.fire({
            title: "Подтверждение",
            text: "Вы уверены, что хотите подать запрос на добавление репетитора?",
            footer: '<a style="color: rgb(72, 31, 187); cursor: pointer; font-size: 20px" onclick="toFeedBackPage()">Вопросы? Обратитесь к нам</a>',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Да, полностью',
            cancelButtonText: 'Нет, я передумал(а)'
        }).then((result) => {
            if (result.isConfirmed) {
                var arr = getCookie('user').split('/');
                if (arr[3] !== null) {
                    if (arr[3] === 'Ученик') {
                        load_yes()
                        $.ajax({
                            url: all_subs_servlet_path,
                            type: "POST",
                            dataType: "html",
                            data: "id=1&tutorId=" + person[5] + "&studentId=" + arr[5] + "&subject=" + $("#subjects-" + (id + 1)).html(),
                            success: function (resultText) {
                                if (resultText.toString() === "ttr_error") {
                                    load_no()
                                    ntf("Ошибка", "Вы не можете иметь более одного репетитора по данному предмету", "error");

                                } else {
                                    $.ajax({
                                        url: all_subs_request_servlet_path,
                                        type: "POST",
                                        dataType: "html",
                                        data: "action=add&emailtutor=" + person[3] + "&surnametutor=" + person[1] + "&nametutor=" + person[0]
                                            + "&surnamestudent=" + arr[0] + "&namestudent=" + arr[1] + "&secnamestudent=" + arr[6]
                                            + "&phonestudent=" + arr[7] + "&addressstudent=" + arr[8] + "&emailstudent=" + arr[4] + "&subject=" + $("#subjects-" + (id + 1)).html(),
                                        success: function (resultText) {
                                            load_no();
                                            swal.fire({
                                                title: "Запрос зарегистрирован",
                                                text: "Ваш запрос на добавление репетитора зарегистрирован.\nВ ближайшее время репетитор свяжется с вами",
                                                icon: "success",
                                                footer: '<a style="color: rgb(72, 31, 187); cursor: pointer; font-size: 20px" onclick="toFeedBackPage()">Вопросы? Обратитесь к нам</a>',
                                            }).then((result) => {
                                            });
                                            document.body.style.paddingRight = '0';
                                            $(containerID).html("")
                                            $(titleID).html("")
                                            AllSubjectsButton(titleID, containerID, imgPath, maxInList)
                                        },
                                        error: function (response) {
                                            load_no();
                                            serverError();
                                        }
                                    });
                                }


                            },
                            error: function (response) {
                                load_no();
                                serverError();
                            }
                        });
                    } else ntf("Ошибка", "Ваш аккаунт не имеет доступ к данной функции", "error");
                } else serverError();

            }
        })
        document.body.style.paddingRight = '0';

    }

}

function remove_all(button_id, titleID, containerID, imgPath, maxInList) {
    swal.fire({
        title: "Подтверждение",
        text: "Вы уверены, что хотите подать запрос на удаление репетитора?",
        footer: '<a style="color: rgb(72, 31, 187); cursor: pointer; font-size: 20px" onclick="toFeedBackPage()">Вопросы? Обратитесь к нам</a>',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Да, полностью',
        cancelButtonText: 'Нет, я передумал(а)'
    }).then((result) => {
        if (result.isConfirmed) {
            var id = button_id.split("-")[2] - 1;
            var user = button_id.split("-")[4];
            var person = accs_all_subs[user].split("_");
            var arr = getCookie('user').split('/');
            if (arr[3] !== null) {
                load_yes();
                $.ajax({
                    url: all_subs_servlet_path,
                    type: "POST",
                    dataType: "html",
                    data: "id=3&tutorId=" + person[5] + "&studentId=" + arr[5] + "&subject=" + $("#subjects-" + (id + 1)).html(),
                    success: function (resultText) {
                        if (resultText.toString() === "yes") {
                            $.ajax({
                                url: all_subs_request_servlet_path,
                                type: "POST",
                                dataType: "html",
                                data: "action=remove&emailtutor=" + person[3] + "&surnametutor=" + person[1] + "&nametutor=" + person[0]
                                    + "&surnamestudent=" + arr[0] + "&namestudent=" + arr[1] + "&secnamestudent=" + arr[6]
                                    + "&phonestudent=" + arr[7] + "&addressstudent=" + arr[8] + "&emailstudent=" + arr[4] + "&subject=" + $("#subjects-" + (id + 1)).html(),
                                success: function (resultText) {
                                    load_no();
                                    swal.fire({
                                        title: "Репетитор удалён",
                                        text: "Удаление репетитора прошло успешно",
                                        icon: "success",
                                        footer: '<a style="color: rgb(72, 31, 187); cursor: pointer; font-size: 20px" onclick="toFeedBackPage()">Вопросы? Обратитесь к нам</a>',
                                    }).then((result) => {
                                    });
                                    document.body.style.paddingRight = '0';
                                    $(containerID).html("")
                                    $(titleID).html("")
                                    AllSubjectsButton(titleID, containerID, imgPath, maxInList)
                                },
                                error: function (response) {
                                    load_no();
                                    serverError();
                                }
                            });
                        } else {
                            ntf("Ошибка", "Репетитор не удалён", "error");
                            load_no();
                        }
                    },
                    error: function (response) {
                        load_no();
                        serverError();
                    }
                });

            } else serverError();
        }
    })
    document.body.style.paddingRight = '0';
}

/*Иванов ||| Иван ||| Иванович ||| Ученик ||| Российская Федерация ||| Краснодарский край |||
                    Геленджик ||| Ленина ||| 34Б ||| +7 (123) 456-78-90 ||| skripnichenko.n@bk.ru ||| tutorea.RU_2020
                    ||| active ||| 564666 ||| active//*/

/*Иванов/Иван/inactive/Репетитор/m.neter.century@gmail.com/12982950/Иванович/+7(375) 434-53-45/
Российская Федерация, Краснодарский край, Геленджик, Ленина, 34Б/tutorea.RU_2020/10*/
function add_pair_all(button_id, titleID, containerID, imgPath, maxInList) {
    swal.fire({
        title: "Подтверждение",
        text: "Вы уверены, что хотите подтвердить запрос на добавление ученика?",
        footer: '<a style="color: rgb(72, 31, 187); cursor: pointer; font-size: 20px" onclick="toFeedBackPage()">Вопросы? Обратитесь к нам</a>',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Да, полностью',
        cancelButtonText: 'Нет, я передумал(а)'
    }).then((result) => {
        if (result.isConfirmed) {
            var id = button_id.split("-")[2] - 1;
            var person = allStudents_all_subs[id].split(" ||| ");
            load_yes();
            var arr = getCookie('user').split('/');
            $.ajax({
                url: all_subs_servlet_path,
                type: "POST",
                dataType: "html",
                data: "id=5&tutorID=" + arr[5] + "&studentID=" + person[13] + "&lessonStatus=active" +
                    "&surnametutor=" + arr[0] + "&nametutor=" + arr[1]
                    + "&surnamestudent=" + person[0] + "&namestudent=" + person[1] + "&secnametutor=" + arr[6]
                    + "&phonetutor=" + arr[7] + "&addresstutor=" + arr[8] + "&emailtutor=" + arr[4] + "&emailstudent=" + person[10] + "&subject=" + $("#subjects-" + (id + 1)).html(),
                success: function (resultText) {
                    load_no();
                    swal.fire({
                        title: "Успешно",
                        text: "Добавление ученика произошло успешно",
                        icon: "success",
                        footer: '<a style="color: rgb(72, 31, 187); cursor: pointer; font-size: 20px" onclick="toFeedBackPage()">Вопросы? Обратитесь к нам</a>',
                    }).then((result) => {
                    });
                    document.body.style.paddingRight = '0';
                    $(containerID).html("")
                    $(titleID).html("")
                    AllSubjectsButton(titleID, containerID, imgPath, maxInList)
                },
                error: function (response) {
                    load_no();
                    serverError();
                }
            });

        }
    })
    document.body.style.paddingRight = '0';

}

function delete_pair_all(button_id, titleID, containerID, imgPath, maxInList) {
    swal.fire({
        title: "Подтверждение",
        text: "Вы уверены, что хотите отклонить запрос на добавление ученика?",
        footer: '<a style="color: rgb(72, 31, 187); cursor: pointer; font-size: 20px" onclick="toFeedBackPage()">Вопросы? Обратитесь к нам</a>',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Да, полностью',
        cancelButtonText: 'Нет, я передумал(а)'
    }).then((result) => {
        if (result.isConfirmed) {
            var id = button_id.split("-")[2] - 1;
            var person = allStudents_all_subs[id].split(" ||| ");
            load_yes();
            var arr = getCookie('user').split('/');
            $.ajax({
                url: all_subs_servlet_path,
                type: "POST",
                dataType: "html",
                data: "id=5&tutorID=" + arr[5] + "&studentID=" + person[13] + "&lessonStatus=inactive" +
                    "&surnametutor=" + arr[0] + "&nametutor=" + arr[1]
                    + "&surnamestudent=" + person[0] + "&namestudent=" + person[1] + "&secnametutor=" + arr[6]
                    + "&phonetutor=" + arr[7] + "&addresstutor=" + arr[8] + "&emailtutor=" + arr[4] + "&emailstudent=" + person[10] + "&subject=" + $("#subjects-" + (id + 1)).html(),
                success: function (resultText) {
                    load_no();
                    swal.fire({
                        title: "Успешно",
                        text: "Удаление ученика произошло успешно",
                        icon: "success",
                        footer: '<a style="color: rgb(72, 31, 187); cursor: pointer; font-size: 20px" onclick="toFeedBackPage()">Вопросы? Обратитесь к нам</a>',
                    }).then((result) => {
                    });
                    document.body.style.paddingRight = '0';
                    $(containerID).html("")
                    $(titleID).html("")
                    AllSubjectsButton(titleID, containerID, imgPath, maxInList)
                },
                error: function (response) {
                    load_no();
                    serverError();
                }
            });

        }
    })
    document.body.style.paddingRight = '0';

}