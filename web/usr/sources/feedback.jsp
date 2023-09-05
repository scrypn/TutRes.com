<%--
<script>

    $("#section-title-slider-text").text("Обратная связь")
    $("#section-title-slider-block").show()
</script>
<div class="job_details_area" id="feedback_div">
    <div class="container">
        <div class="row">
            <div class="apply_job_form white-bg" style="margin-right: auto; margin-left: auto; max-width: 900px">
                <h4 style="color: rgb(146, 117, 250);" class="wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".1s">Обратная связь</h4>
                <h5 style="color: #00D363; text-align: center" class="wow fadeInRight" data-wow-duration="1s" data-wow-delay=".15s">
                    Напиши нам о своей проблеме, и мы вместе её решим! Также принимаются предложения и замечания по работе сервиса TutRes.com</h5>
                <form novalidate method="POST" autocomplete="on" id="feedback_form" action="javascript:void(0);">
                    <div class="row">
                        <div class="col-md-6 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".2s" style="margin-bottom: 25px; margin-top: 20px">
                            <div class="mein-labels">ФИ</div>
                            <div class="input_field">
                                <input type="text" class="mein-inputs" maxlength="50" id="from_name_feedback" name="from_name_feedback">
                            </div>
                        </div>
                        <div class="col-md-6 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".25s" style="margin-bottom: 25px; margin-top: 20px">
                            <div class="mein-labels">Email</div>
                            <div class="input_field">
                                <input type="email" class="mein-inputs" maxlength="50" id="from_email_feedback" name="from_email_feedback">
                            </div>
                        </div>
                        <div class="col-md-12 wow fadeInRight" data-wow-duration="1s" data-wow-delay=".3s" style="margin-bottom: 25px; margin-top: 20px">
                            <div class="mein-labels">Текст <span style="font-size: 12px">(10-255 символов)</span></div>
                            <div class="input_field">
                                <textarea id="feedback_textarea_page" class="mein-inputs" style="min-height: 100px; max-height: 400px"
                                          maxlength="255" placeholder="Введите текст сообщения..."></textarea>
                            </div>
                        </div>
                <div class="col-md-8 wow fadeInUp" data-wow-duration="1s" data-wow-delay=".35s" style="margin-right: auto; margin-left: auto">
                    <button class="buttons" id="send_footer_page"  style="margin: 50px 0 0 0; width: 100%">Отправить</button>
                </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

    <script>
    if(getCookie("user") !== undefined){
    var user_data = getCookie("user").split('/');
    $("#from_name_feedback").val(user_data[0] + " " + user_data[1] + ", " + user_data[3].toLowerCase());
    $("#from_email_feedback").val(user_data[4]);
    }
valid_feedback();
    anim_func("#feedback_div");
    </script>
</font></b></div>
--%>
