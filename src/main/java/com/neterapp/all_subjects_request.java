package com.neterapp;

import ru.scryp.Mailer;

import java.io.PrintWriter;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.*;
import java.nio.charset.StandardCharsets;



@WebServlet("/all_subs_request.ntr")
public class all_subjects_request extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest reg_request, HttpServletResponse reg_response)
            throws ServletException, IOException {
        reg_response.setContentType("text/html");
        reg_response.setCharacterEncoding("UTF-8");
        PrintWriter writer = reg_response.getWriter();

        try {
            reg_request.setCharacterEncoding("UTF-8");
            String action = new String(reg_request.getParameter("action").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
            String email_tutor = new String(reg_request.getParameter("emailtutor").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
            String surname_tutor = new String(reg_request.getParameter("surnametutor").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
            String name_tutor = new String(reg_request.getParameter("nametutor").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
            String surname_student = new String(reg_request.getParameter("surnamestudent").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
            String name_student = new String(reg_request.getParameter("namestudent").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
            String secname_student = new String(reg_request.getParameter("secnamestudent").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
            String phone_student = new String(reg_request.getParameter("phonestudent").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
            String address_student = new String(reg_request.getParameter("addressstudent").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
            String email_student = new String(reg_request.getParameter("emailstudent").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
            String subject = new String(reg_request.getParameter("subject").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
            String title = "";
            String body = "";
            if (action.equals("add")){
                title = new String("Запрос на добавление репетитора".getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
                body = "<p>Здравствуйте, " + surname_tutor + " " + name_tutor + "!</p><p>Недавно был получен запрос на добавление вас репетитором по предмету \"" + subject + "\" от ученика "
                        + surname_student + " " + name_student +
                        ". Вы можете связаться с учеником, используя данные, указанные ниже.</p>" +
                        "<p><div>Личные данные ученика TutRes.com:</div><div>ФИО: " + surname_student + " " + name_student + " " + secname_student +
                        "</div><div>Номер телефона: " + phone_student + "</div><div>Email: " + email_student + "</div><div>Адрес: " + address_student + "</div></p>";
            }else if (action.equals("remove")){
                title = new String("Удаление репетитора".getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
                body = "<p>Здравствуйте, " + surname_tutor + " " + name_tutor + "!</p><p>Недавно произошло удаление вас из репетиторского состава ученика "
                        + surname_student + " " + name_student +
                        " по предмету \"" + subject + "\". Вы можете связаться с учеником, используя данные, указанные ниже.</p>" +
                        "<p><div>Личные данные ученика TutRes.com:</div><div>ФИО: " + surname_student + " " + name_student + " " + secname_student +
                        "</div><div>Номер телефона: " + phone_student + "</div><div>Email: " + email_student + "</div><div>Адрес: " + address_student + "</div></p>";
            }


            new Mailer("support@tutres.com", "sW5QN5Rb6TFN7hYD").send(title, body, "tutres.html", "TutRes.com", email_tutor);
        } catch (Exception e) {
            writer.print(e);
        } finally {
            writer.close();
        }
    }
}
