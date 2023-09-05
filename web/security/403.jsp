<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/includes/links.jsp"/>

    <title>В доступе к ресурсу отказано!</title>
</head>
<body>
<div class="full_code">
    <jsp:include page="/includes/header.jsp"/>
    <jsp:include page="/includes/slider.jsp"/>
    <script>

        $("#section-title-slider-text").text("В доступе отказано")
        $("#section-title-slider-block").show()
    </script>
    <%--<div class="alert alert-warning alert-dismissible wow fadeInDown custom-bootstrap-alerts" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <strong>Holy guacamole!</strong> You should check in on some of those fields below.
    </div>--%>
    <div class="catagory_area">
        <section class="blog_area section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 mb-5 mb-lg-0">
                        <div class="section_title mb-40">
                            <h3>Что-то пошло не так <i class="fa fa-exclamation-circle"></i></h3>
                        </div>
                        <div class="blog_left_sidebar">
                            <div class="row">

                                <article class="blog_item col-md-12 wow fadeInLeft" data-wow-duration="1s"
                                         data-wow-delay=".15s">
                                    <div class="blog_item_img">
                                        <div style="width: 300px; height: 300px; margin-right: auto; margin-left: auto">
                                            <img class="card-img rounded-0"
                                                 src="${pageContext.request.contextPath}/vectors/access-denied.svg"
                                                 width="300" height="300" alt="access-denied"></div>
                                    </div>

                                    <div class="blog_details blog_details_error news">
                                        <div class="blog_item_img">
                                            <a onclick="" class="blog_item_date" id="blog_item_date_error">
                                                <h3>403 Доступ запрещён <i class="fa fa-exclamation-triangle"></i></h3>
                                                <p>Вы не имеете прав на доступ к данному ресурсу</p>
                                            </a>

                                        </div>
                                    </div>
                                </article>
                                <div class="col-md-12" style="margin-top: 50px" align="center"><a
                                        style="font-size: 18px" href="${pageContext.request.contextPath}/">На Главную <i
                                        class="fa fa-arrow-right"></i></a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<jsp:include page="/includes/footer.jsp"/>
</body>
</html>
