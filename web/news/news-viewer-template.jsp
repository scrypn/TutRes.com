<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.net.URLEncoder" %>
<%!
    public static String redirectTo(String url) {
        String to = url;
        try {
            to = URLEncoder.encode(url, StandardCharsets.UTF_8.toString());
        }catch (Exception e){
            e.printStackTrace();
        }
        return "https://r.scryp.ru?url=" + to;
    }
%>
<section class="blog_area single-post-area section-padding">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 posts-list" style="margin-right: auto; margin-left: auto">
                <div class="single-post">
                    <div class="feature-img wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".15s" align="center">
                        <img class="img-fluid" id="img-news-viewer" src="" alt="" width="300" height="300">
                    </div>
                    <div class="blog_details wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".2s">
                        <h2 id="title-news-viewer"></h2>
                        <ul class="blog-info-link mt-3 mb-4">
                            <li><a href="${pageContext.request.contextPath}/"><i class="fa fa-user"></i> tutres.com</a>
                            </li>
                        </ul>
                        <p class="excert" id="text-news-viewer"></p>
                    </div>
                </div>
                <div class="navigation-top wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".25s">
                    <div class="d-sm-flex justify-content-between text-center">
                        <p id="news-date"></p>
                        <ul class="social-icons">
                            <li>
                                <a href="<%= redirectTo("https://vk.com/tutrescom")%>" target="_blank">
                                    <i class="fa fa-vk"></i>
                                </a>
                            </li>
                            <li>
                                <a href="<%= redirectTo("https://wa.me/79165814024")%>" target="_blank">
                                    <i class="fa fa-whatsapp"></i>
                                </a>
                            </li>
                            <li>
                                <a href="<%= redirectTo("https://www.t.me/nikolay_skrip")%>" target="_blank">
                                    <i class="fa fa-telegram"></i>
                                </a>
                            </li>
                            <li>
                                <a href="mailto:support@tutres.com" target="_blank">
                                    <i class="fa fa-envelope-o"></i>
                                </a>
                            </li>
                            <li>
                                <a href="tel:+79165814024" target="_blank">
                                    <i class="fa fa-phone"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="blog-author wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".3s">
                    <div class="media align-items-center">
                        <img src="${pageContext.request.contextPath}/vectors/favicon.svg" alt="" width="90" height="90">
                        <div class="media-body">
                            <a href="${pageContext.request.contextPath}/">
                                <h4>TutRes.com</h4>
                            </a>
                            <p>портал онлайн-репетиторства</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>