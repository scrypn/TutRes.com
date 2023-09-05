$(".custom-select-class").each(function () {
    var classes = $(this).attr("class"),
        id = $(this).attr("id"),
        name = $(this).attr("name");
    var template = '<div class="' + classes + '">';
    var placeholder = 'не выбрано';
    var arr;
    if ($(this).attr("placeholder") === "emp_lk") {
        if (getCookie("user") !== undefined) {
            arr = getCookie("user").split("/");
            placeholder = arr[3];
        }
    } else if ($(this).attr("placeholder") === "country_lk") {
        if (getCookie("user") !== undefined) {
            arr = getCookie("user").split("/");
            var address = arr[8].split(", ");
            placeholder = address[0];
            if (placeholder === "Российская Федерация") $("#phone_lk").inputmask("+7(999) 999-99-99");
            else if (placeholder === "Украина") $("#phone_lk").inputmask("+380(999) 999-99-99");
            else if (placeholder === "Казахстан") $("#phone_lk").inputmask("+7(999) 999-99-99");
            else if (placeholder === "Республика Белорусь") $("#phone_lk").inputmask("+375(999) 999-99-99");
        }
    } else if ($(this).attr("placeholder") === "subs_lk") {
        if (getCookie("user") !== undefined) {
            placeholder = getCookie("user").split("/")[11];
        }
    } else placeholder = $(this).attr("placeholder");
    template += '<span class="custom-select-trigger">' + placeholder + '</span>';
    template += '<div class="custom-options">';
    $(this).find("option").each(function () {
        if (placeholder === $(this).html()) template += '<span class="custom-option selection ' +
            $(this).attr("class") + '" data-value="' + $(this).attr("value") + '">' + $(this).html() + '</span>';
        else template += '<span class="custom-option ' + $(this).attr("class") + '" data-value="' + $(this).attr("value") + '">' + $(this).html() + '</span>';
    });
    template += '</div></div>';

    $(this).wrap('<div class="custom-select-wrapper"></div>');
    $(this).hide();
    $(this).after(template);
});
$(".custom-option:first-of-type").hover(function () {
    $(this).parents(".custom-options").addClass("option-hover");
}, function () {
    $(this).parents(".custom-options").removeClass("option-hover");
});
$(".custom-select-trigger").on("click", function () {
    $('html').one('click', function () {
        $(".custom-select-class").removeClass("opened");
    });
    $(this).parents(".custom-select-class").toggleClass("opened");
    event.stopPropagation();
});
$(".custom-option").on("click", function () {
    $(this).parents(".custom-select-wrapper").find("select").val($(this).data("value"));
    $(this).parents(".custom-options").find(".custom-option").removeClass("selection");
    $(this).addClass("selection");
    $(this).parents(".custom-select-class").removeClass("opened");
    $(this).parents(".custom-select-class").find(".custom-select-trigger").text($(this).text());
    if ($(this).text() === "Российская Федерация") {
        $("#phone").inputmask("+7(999) 999-99-99");
        $("#phone_lk").inputmask("+7(999) 999-99-99");
    } else if ($(this).text() === "Украина") {
        $("#phone").inputmask("+380(999) 999-99-99");
        $("#phone_lk").inputmask("+380(999) 999-99-99");
    } else if ($(this).text() === "Казахстан") {
        $("#phone").inputmask("+7(999) 999-99-99");
        $("#phone_lk").inputmask("+7(999) 999-99-99");
    } else if ($(this).text() === "Республика Белорусь") {
        $("#phone").inputmask("+375(999) 999-99-99");
        $("#phone_lk").inputmask("+375(999) 999-99-99");
    }
});