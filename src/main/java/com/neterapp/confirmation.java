package com.neterapp;

import java.io.PrintWriter;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.*;
import java.nio.charset.StandardCharsets;
import com.neterlibs.Hasher;
import ru.scryp.Mailer;


@WebServlet("/conf.ntr")
public class confirmation extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest reg_request, HttpServletResponse reg_response)
            throws ServletException, IOException {
            reg_response.setContentType("text/html");
            reg_response.setCharacterEncoding("UTF-8");
            PrintWriter writer = reg_response.getWriter();
            try {
                reg_request.setCharacterEncoding("UTF-8");
                String id = new String(reg_request.getParameter("id").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
                if (id.equals("1") || id.equals("3")) {
                    char[] alphabet = "mno23hJTUVijkabcd6efg19stuvBWPQRKlqr78LMNCD45p0OSwEFGHIxyzAXYZ".toCharArray();
                    StringBuilder code = new StringBuilder();
                    for (int i = 0; i < 6; i++) {
                        code.append(alphabet[(int) (Math.random() * 62)]);
                    }
                    String email = new String(reg_request.getParameter("to").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
                    String title = code.toString() + new String(" - ваш код подтверждения TutRes.com".getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
                    String body;
                    if (id.equals("1")) {
                        String surname = new String(reg_request.getParameter("surname").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
                        String name = new String(reg_request.getParameter("name").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
                        body = "<p>Здравствуйте, " + surname + " " + name + "!</p><p>Вы получаете данное уведомление всвязи " +
                                "с недавней регистрацией на портале онлайн-репетиторства <a href='https://tutres.com/'>TutRes.com</a></p><p>Ваш код подтверждения: " + code.toString() + "</p><p>Если это были не вы, проигнорируйте данное сообщение и никому не " +
                                "сообщайте код подтверждения!</p>";
                    }else {
                        body = "<p>Здравствуй, уважаемый пользователь портала онлайн-репетиторства <a href='https://tutres.com/'>TutRes.com</a>!</p><p>Вы получаете данное уведомление всвязи " +
                                "с недавней попыткой восстановления пароля учётной записи <a href='https://tutres.com/'>TutRes.com</a></p><p>Ваш код подтверждения: " + code.toString() + "</p><p>Если это были не вы, проигнорируйте данное сообщение и никому не " +
                                "сообщайте код подтверждения!</p>";
                    }
                    new Mailer("support@tutres.com", "sW5QN5Rb6TFN7hYD").send(title, body, "tutres.html","TutRes.com", email);
                    String originalPassword = code.toString();
                    String hash = Hasher.hash(originalPassword, 65536, false, "4da746a4ebcffa461bebce37527678cc");
                    writer.print(hash);
                }else if (id.equals("2")){
                    String originalPassword = new String(reg_request.getParameter("val").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
                    String userHash = new String(reg_request.getParameter("hash").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
                    String hash = Hasher.hash(originalPassword, 65536, false, "4da746a4ebcffa461bebce37527678cc");
                    if (hash.equals(userHash)) writer.print("1");
                    else writer.print("0");
                }
            } catch (Exception e) {
                writer.print(e);
            } finally {
                writer.close();
            }
    }
}