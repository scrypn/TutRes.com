<script>

    $("#section-title-slider-text").text("Математика")
    $("#section-title-slider-block").show()
</script>
<section class="blog_area section-padding">
    <div class="container">
        <div class="row">
            <div class="col-lg-5 mb-5 mb-lg-0">
                <div class="blog_left_sidebar">
                    <article class="blog_item wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".15s">
                        <div class="blog_item_img"
                             style="width: 300px; height: 300px; margin-right: auto; margin-left: auto">
                            <img class="card-img rounded-0" src="${pageContext.request.contextPath}/vectors/algebra.svg"
                                 id="maths_pic_1" width="300" height="300" alt="maths.TutRes.com">
                            <!--<a href="#" class="blog_item_date">
                                <h3>15</h3>
                                <p>Jan</p>
                            </a>-->
                        </div>

                        <div class="blog_details">
                            <a class="d-inline-block">
                                <h2>Приветствуем вас в разделе "Математика"!</h2>
                            </a>
                            <p>Приветствуем вас в разделе "Математика". Здесь вы можете найти репетитора и подать запрос
                                на его добавление по данному предмету, если вы - ученик, и просматривать, принимать и
                                отклонять запросы от учеников
                                , если вы являетесь репетитором.</p>
                            <ul class="blog-info-link">
                                <li><a href="https://www.scryp.ru/"><i class="fa fa-user"></i> Николай Скрипниченко</a>
                                </li>
                                <!--<li><a href="#"><i class="fa fa-comments"></i> 0 Comments</a></li>-->
                            </ul>
                        </div>
                    </article>

                    <article class="blog_item wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".2s">
                        <div class="blog_details">
                            <a class="d-inline-block">
                                <h2>Оплата за предметные занятия</h2>
                            </a>
                            <p>Оплата за занятие происходит напрямую репетитору, точную сумму оплаты вам уточнит
                                преподаватель при подтверждении вашего запроса. Как правило цена варьируется от 350 до
                                450
                                рублей при занятиях со старшеклассниками и от 550-650 рублей - с преподавателями и
                                учителями.</p>
                            <ul class="blog-info-link">
                                <li><a href="https://www.scryp.ru/"><i class="fa fa-user"></i> Николай Скрипниченко</a>
                                </li>
                                <!--<li><a href="#"><i class="fa fa-comments"></i> 03 Comments</a></li>-->
                            </ul>
                        </div>
                    </article>

                    <article class="blog_item wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".25s"
                             id="instruction_maths_student" style="display: none">
                        <div class="blog_details">
                            <a class="d-inline-block">
                                <h2>Инструкция добавления/удаления репетитора</h2>
                            </a>
                            <p>
                                <span style="font-size: 20px; color: #00D363">Как добавить?</span><br>
                                1. Найти нужного репетитора из списка, представленного правее <i
                                    class="fa fa-arrow-right"></i><br>
                                2. Нажать на кнопку <span style="color: #00D363">Добавить</span> рядом с данными
                                выбранного вами репетитора.<br>
                                3. Если вы не авторизованы на сайте, для начала вам предложиться сделать это, в ином
                                случае будет необходимо подтвердить действие.<br>
                                4. После подтверждения репетитору будет отправлено email-письмо с вашими контактными
                                данными для дальнейшей связи с вами в случае, если последний одобрит ваш запрос.<br>
                                5. Статус запроса вы можете отслеживать прямо на карточке выбранного репетитора.<br>
                                6. После принятие репетитором решения, вам будет направлено соответствующее
                                email-уведомление с контактными данными преподавателя.</p>
                            <p>
                                <span style="font-size: 20px; color: red">Как удалить?</span><br>
                                Если вы захотите отменить запрос (удалить репетитора), вам предоставляется возможность
                                сделать это, нажав на кнопку <a class="unsuccessful-tutor-request" style="color: red"
                                                                onclick=''> <i class="fa fa-times"></i></a>,
                                находящуюся левее от статуса запроса. После удаления заявки, репетитору будет отправлено
                                соответствующее email-уведомление.</p>
                            <p>
                                Надеюсь, я всё понятно объяснил, но всё же если появились вопросы, вы всегда можете
                                написать мне через <a href="${pageContext.request.contextPath}/usr/feedback">форму
                                обратной связи</a>.<br>
                                Приятных занятий! <i style="color: #00D363" class="fa fa-smile-o"></i>
                            </p>
                            <ul class="blog-info-link">
                                <li><a href="https://www.scryp.ru/"><i class="fa fa-user"></i> Николай Скрипниченко</a>
                                </li>
                                <!-- <li><a href="#"><i class="fa fa-comments"></i> 03 Comments</a></li>-->
                            </ul>
                        </div>
                    </article>
                    <article class="blog_item wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".25s"
                             id="instruction_maths_tutor" style="display: none">
                        <div class="blog_details">
                            <a class="d-inline-block">
                                <h2>Инструкция добавления/удаления ученика</h2>
                            </a>
                            <p>
                                <span style="font-size: 20px; color: #00D363">Как добавить?</span><br>
                                1. Правее вам доступен список заявок, полученных вами от учеников, желающих заниматься с
                                вами по данному предмету <i class="fa fa-arrow-right"></i><br>
                                2. Ознакомиться с данными ученика можно на карточке его запроса и в email-письме,
                                адресованном вам при регистрации его заявки.<br>
                                3. Если вы, ознакомившись с данными ученика, решите начать заниматься с ним, вам следует
                                нажать на кнопку <a class="successful-tutor-request" style="color: #00D363" onclick=''>
                                <i class="fa fa-check"></i></a>, находящуюся левее от статуса заявки.<br>
                                4. После этого ученику будет отправлен email с вашими контактными данными для дальнейшей
                                связи с вами.</p>
                            <p>
                                <span style="font-size: 20px; color: red">Как удалить?</span><br>
                                Если вы захотите отклонить заявку (перестать заниматься с учеником), вам предоставляется
                                возможность сделать это, нажав на кнопку
                                <a class="unsuccessful-tutor-request" style="color: red" onclick=''> <i
                                        class="fa fa-times"></i></a>, после чего заявка выбранного
                                ученика будет отклонена (ученику будет направлено соответствующее email-уведомление).
                            </p>
                            <p>
                                Надеюсь, я всё понятно объяснил, но всё же если появились вопросы, вы всегда можете
                                написать мне через <a href="${pageContext.request.contextPath}/usr/feedback">форму
                                обратной связи</a>.<br>
                                Приятных занятий! <i style="color: #00D363" class="fa fa-smile-o"></i>
                            </p>
                            <ul class="blog-info-link">
                                <li><a href="https://www.scryp.ru/"><i class="fa fa-user"></i> Николай Скрипниченко</a>
                                </li>
                                <!-- <li><a href="#"><i class="fa fa-comments"></i> 03 Comments</a></li>-->
                            </ul>
                        </div>
                    </article>

                    <article class="blog_item wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".3s"
                             onclick="toFeedBackPage()" style="cursor: pointer;">
                        <div class="blog_details">
                            <a class="d-inline-block" href="${pageContext.request.contextPath}/usr/feedback">
                                <h2>Обратная связь</h2>
                            </a>
                            <p>Есть вопросы по поводу использования функций сайта или заметили какую-то ошибку в работе
                                портала?
                                Не постесняйся написать в службу поддержки TutRes.com</p>
                            <ul class="blog-info-link">
                                <li><a href="https://www.scryp.ru/"><i class="fa fa-user"></i> Николай Скрипниченко</a>
                                </li>
                            </ul>
                        </div>
                    </article>

                    <!--<div class="row">
                        <div class="col-lg-12">
                            <div class="pagination_wrap">
                                <ul>
                                    <li><a href="#"> <i class="ti-angle-left"></i> </a></li>
                                    <li><a href="#"><span>01</span></a></li>
                                    <li><a href="#"><span>02</span></a></li>
                                    <li><a href="#"> <i class="ti-angle-right"></i> </a></li>
                                </ul>
                            </div>
                        </div>
                    </div>-->
                </div>
            </div>
            <div class="job_listing_area plus_padding col-lg-7 wow fadeInRight" data-wow-duration="1s"
                 data-wow-delay=".15s" style="padding: 30px 10px; height: fit-content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="col-lg-12">
                                <div class="recent_joblist_wrap">
                                    <div class="recent_joblist white-bg ">
                                        <div class="row align-items-center">
                                            <div class="col-md-12">
                                                <h4 id="title-student-tutor-maths">Загрузка...</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="job_lists m-0">
                                    <div class="row" id="tutor-maths-container">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>

<script>
    getSepSubData("#title-student-tutor-maths", "#tutor-maths-container", main_site_path + "vectors/group.svg", "Математика", 12);
    var user = getCookie("user");
    if (user === undefined || user.split('/')[3] === "Ученик") document.getElementById("instruction_maths_student").style.display = "block";
    else document.getElementById("instruction_maths_tutor").style.display = "block";
    $("#feedback_maths_block").on('click', function () {
        toFeedBackPage();
    });
</script>