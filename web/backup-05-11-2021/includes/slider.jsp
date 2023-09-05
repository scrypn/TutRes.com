<div class="slider_area">
    <div class="single_slider  d-flex align-items-center slider_bg_1">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12 col-md-12">
                    <div class="slider_text">
                        <div id="tutres-title-slider-block" style="display: none">
                            <h5 class="wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".2s">Найти репетитора
                                мечты на</h5>
                            <h3 class="wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".3s">TutRes.com</h3>
                            <p class="wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".4s">Репетиторство высокого
                                разрешения</p>
                            <div class="sldier_btn wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".5s">
                                <a onclick="anim_func('#subjects-home-container')" id="slider-button-text"
                                   class="boxed-btn3">Посмотреть репетиторов</a>
                            </div>
                        </div>
                        <div id="section-title-slider-block" style="display: none">
                            <!--<h5 class="wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".2s">Раздел</h5>-->
                            <h3 class="wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".2s"
                                id="section-title-slider-text"></h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="ilstration_img wow fadeInRight d-none d-lg-block text-right" data-wow-duration="1s"
         data-wow-delay=".2s">
        <img src="${pageContext.request.contextPath}/vectors/favicon.svg" width="512" height="512"
             id="logo-slider" alt="">
    </div>
</div>
<script>
    var user = getCookie("user");
    if (getCookie("user") !== undefined && user.split("/")[3] === 'Репетитор') $('#slider-button-text').text("Запросы");
</script>