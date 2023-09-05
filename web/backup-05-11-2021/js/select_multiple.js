var subjects_count = [];
$(".custom-select-multiple").each(function () {
    var classes = $(this).attr("class"),
        id = $(this).attr("id"),
        name = $(this).attr("name");
    var template = '<div class="' + classes + '">';
    var placeholder = 'не выбрано';
    if ($(this).attr("placeholder") === "subs_lk") {
        if (getCookie("user") !== undefined) {
            placeholder = getCookie("user").split("/")[11];
        }
    } else placeholder = $(this).attr("placeholder");
    subjects_count = placeholder.split(", ");
    template += '<span class="custom-select-trigger-multiple">' + placeholder + '</span>';
    template += '<div class="custom-options-multiple">';
    $(this).find("option").each(function () {
        if (placeholder.split(", ").includes($(this).html())) template += '<span class="custom-option-multiple selection-multiple ' +
            $(this).attr("class") + '" data-value="' + $(this).attr("value") + '">' + $(this).html() + '</span>';
        else template += '<span class="custom-option-multiple ' + $(this).attr("class") + '" data-value="' + $(this).attr("value") + '">' + $(this).html() + '</span>';
    });
    template += '</div></div>';

    $(this).wrap('<div class="custom-select-wrapper-multiple"></div>');
    $(this).hide();
    $(this).after(template);
});
$(".custom-option-multiple:first-of-type").hover(function () {
    $(this).parents(".custom-options-multiple").addClass("option-hover-multiple");
}, function () {
    $(this).parents(".custom-options-multiple").removeClass("option-hover-multiple");
});
$(".custom-select-trigger-multiple").on("click", function (e) {
    $("html").one('click', function () {
        $(".custom-select-multiple").removeClass("opened-multiple");
    });
    $(".custom-option-multiple").on('click', function () {
        event.stopPropagation();
    });
    $(this).parents(".custom-select-multiple").toggleClass("opened-multiple");
    event.stopPropagation();
});
/*var all_subs = ["Математика", "Физика", "Информатика", "Русский язык", "Обществознание", "История", "Английский язык", "Химия", "Биология", "Программирование"];*/
/*for (var i = 0; i < all_subs.length-1; i++){
   subjects_count.push("")
}*/
$(".custom-option-multiple").on("click", function () {
    var text = $(this).text();
    var parent = $(this).parents(".custom-select-multiple").find(".custom-select-trigger-multiple");
    /*var element = "";*/
    /*for (var k = 0; k < all_subs.length; k++){
        if (text === all_subs[k]) element = k;
    }*/

    /*else if (text === all_subs[1]) element = 1;
    else if (text === all_subs[2]) element = 2;
    else if (text === all_subs[3]) element = 3;*/
    /*$(this).parents(".custom-options").find(".custom-option").removeClass("selection");*/
    if ($(this).hasClass("selection-multiple")) {
        if (subjects_count.length > 1) {
            $(this).removeClass("selection-multiple");
            subjects_count.splice(subjects_count.indexOf(text), 1)
            parent.text(subjects_count.join(", "));
        } else {
            parent.notify("Минимум - 1 предмет", {
                position: "top left",
                autoHideDelay: 2000,
                height: '10px',
                arrowShow: false,
                className: 'error',
                gap: 1
            });
        }

    } else {
        if (subjects_count.length <= 4) {
            $(this).addClass("selection-multiple");
            subjects_count.unshift(text)
            /*subjects_count[element]=text;*/
            parent.text(subjects_count.join(", "));
        } else {
            parent.notify("Максимум - 5 предметов", {
                position: "top left",
                autoHideDelay: 2000,
                height: '10px',
                arrowShow: false,
                className: 'error',
                gap: 1
            });
        }
    }
    var value = $(this).parents(".custom-select-multiple").find(".custom-select-trigger-multiple").text();
    $("#sub-reg-option-1").val(value);
    $("#sub-lk-option-1").val(value);
    $(this).parents(".custom-select-wrapper-multiple").find("select").val(value);
    /*alert("value: " + $(this).parents(".custom-select-wrapper-multiple").find("select").val()+"\ntext: "+
        $(this).parents(".custom-select-multiple").find(".custom-select-trigger-multiple").text());*/
});