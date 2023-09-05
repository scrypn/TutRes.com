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
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


@WebServlet("/allsubs.ntr")
public class all_subjects extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest reg_request, HttpServletResponse reg_response)
            throws ServletException, IOException {
        reg_response.setContentType("text/html");
        reg_response.setCharacterEncoding("UTF-8");
        PrintWriter writer = reg_response.getWriter();

        try {
            reg_request.setCharacterEncoding("UTF-8");
            String path = new URL(reg_request.getRequestURL().toString()).getHost();
            String scheme = (path.equals("localhost") || path.equals("debug.tutres.com")) ? "tutrestest" : "tutoreadatabase";
            String sqlDomain = (path.equals("localhost")) ? "tutres.com" : "localhost";
            char[] alphabet = "mno23hJTUVijkabcd6efg19stuvBWPQRKlqr78LMNCD45p0OSwEFGHIxyzAXYZ".toCharArray();
            List<String> all_users_ids = new ArrayList<>();
            try (Connection connection = DriverManager.getConnection("jdbc:mysql://" + sqlDomain + "/" + scheme + "?serverTimezone=UTC&useSSL=true", "root", "59R2d{YPVqb@QLrE")) {
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM all_subjects");
                if (reg_request.getParameter("id").equals("1")){
                    boolean bool = true;
                    while (resultSet.next()) {
                        if (resultSet.getString(3).equals(reg_request.getParameter("studentId")) &&
                                resultSet.getString(5).equals(reg_request.getParameter("subject")))bool = false;
                        all_users_ids.add(resultSet.getString(1));
                    }
                    if (bool){
                        StringBuilder random = new StringBuilder();
                        while (true) {
                            for (int i = 0; i < 20; i++) {
                                random.append(alphabet[(int) (Math.random() * 62)]);
                            }
                            boolean r = true;
                            for (int i = 0; i < all_users_ids.size(); i++)  {
                                if (all_users_ids.get(i).equals(random.toString())) r = false;
                            }
                            if (r) break;
                            else random.setLength(0);

                        }
                        String addDatatoBase = "INSERT all_subjects(lessonID, tutorID, studentID, lessonStatus, subject) VALUES ('" + random.toString() +
                                "#all-subs-pair', '" + reg_request.getParameter("tutorId") + "', '" + reg_request.getParameter("studentId") + "', 'inactive', '" + reg_request.getParameter("subject") + "')";
                        statement.executeUpdate(addDatatoBase);
                        writer.print("success, data: tutorId - " + reg_request.getParameter("tutorId") + ", studentId - " + reg_request.getParameter("studentId"));
                    }else writer.print("ttr_error");
                } else if (reg_request.getParameter("id").equals("2")){
                    boolean flag = false;
                    while (resultSet.next()) {
                        if (resultSet.getString(2).equals(reg_request.getParameter("tutorValid")) &&
                                resultSet.getString(3).equals(reg_request.getParameter("studentId")) &&
                                resultSet.getString(5).equals(reg_request.getParameter("subject"))){
                                if (resultSet.getString(4).equals("active"))writer.print("true_active|" + reg_request.getParameter("counterId") + "|" + reg_request.getParameter("i"));
                                else writer.print("true_inactive|" + reg_request.getParameter("counterId") + "|" + reg_request.getParameter("i"));
                                flag = true;
                                break;
                        }
                    }
                    if (!flag) writer.print("false|" + reg_request.getParameter("counterId") + "|" + reg_request.getParameter("i"));
                }else if (reg_request.getParameter("id").equals("3")){
                    int rows = statement.executeUpdate("DELETE FROM all_subjects WHERE tutorID = '"+reg_request.getParameter("tutorId") +
                            "' AND studentID = '" + reg_request.getParameter("studentId") + "' AND subject='"
                            + reg_request.getParameter("subject") + "'");
                    if (rows == 0)writer.print("no");
                    else writer.print("yes");
                } else if (reg_request.getParameter("id").equals("4")){
                    Statement statementAccs = connection.createStatement();
                    ResultSet resultSetAccs;
                    int count = 0;
                    while (resultSet.next()) {
                        if (resultSet.getString(2).equals(reg_request.getParameter("tutorID"))){
                            String subs = reg_request.getParameter("subject");
                            List<String> separate_subs = Arrays.asList("Математика", "Физика", "Информатика", "Программирование");
                            List<String> response_list = new ArrayList<>();
                                resultSetAccs = statementAccs.executeQuery("SELECT * FROM accs");
                                while (resultSetAccs.next()) {
                                    if (resultSetAccs.getString(15).equals(resultSet.getString(3))) {
                                        List<String> local_response_list = new ArrayList<>();
                                        for (int i = 2; i <= 15; i++) {
                                            local_response_list.add(resultSetAccs.getString(i));
                                            /*response.append(resultSetAccs.getString(i)).append(" ||| ");*/
                                        }
                                        local_response_list.add(resultSet.getString(4));
                                        local_response_list.add(resultSetAccs.getString(17));
                                        local_response_list.add(resultSet.getString(5));
                                        response_list.add(String.join(" ||| ", local_response_list));

                                        /*response.append(resultSet.getString(4)).append(" ||| ")
                                                .append(resultSetAccs.getString(17)).append(" ||| ")
                                                .append(resultSet.getString(5)).append("//");*/
                                    }

                                }
                            switch (subs){
                                case "all":
                                    if (!separate_subs.contains(resultSet.getString(5)))writer.print(String.join("//", response_list));
                                    break;
                                case "Математика":
                                    if (resultSet.getString(5).equals("Математика"))writer.print(String.join("//", response_list));
                                    break;
                                case "Физика":
                                    if (resultSet.getString(5).equals("Физика"))writer.print(String.join("//", response_list));
                                    break;
                                case "Информатика":
                                    if (resultSet.getString(5).equals("Информатика"))writer.print(String.join("//", response_list));
                                    break;
                                case "Программирование":
                                    if (resultSet.getString(5).equals("Программирование"))writer.print(String.join("//", response_list));
                                    break;
                            }
                        }

                    }
                }else if (reg_request.getParameter("id").equals("5")){
                    String addDatatoBase = "UPDATE all_subjects SET lessonStatus=? WHERE tutorID=? AND studentID=? AND subject=?";
                    try (PreparedStatement preparedStatement = connection.prepareStatement(addDatatoBase)) {
                        preparedStatement.setString(1, reg_request.getParameter("lessonStatus"));
                        preparedStatement.setString(2, reg_request.getParameter("tutorID"));
                        preparedStatement.setString(3, reg_request.getParameter("studentID"));
                        preparedStatement.setString(4, reg_request.getParameter("subject"));
                        writer.print(preparedStatement.executeUpdate());

                        String email_tutor = new String(reg_request.getParameter("emailtutor").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
                        String surname_tutor = new String(reg_request.getParameter("surnametutor").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
                        String name_tutor = new String(reg_request.getParameter("nametutor").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
                        String surname_student = new String(reg_request.getParameter("surnamestudent").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
                        String name_student = new String(reg_request.getParameter("namestudent").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
                        String secname_tutor = new String(reg_request.getParameter("secnametutor").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
                        String phone_tutor = new String(reg_request.getParameter("phonetutor").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
                        String address_tutor = new String(reg_request.getParameter("addresstutor").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
                        String email_student = new String(reg_request.getParameter("emailstudent").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
                        String subject = new String(reg_request.getParameter("subject").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
                        String title;
                        String body;
                        if (reg_request.getParameter("lessonStatus").equals("active")){
                            title = new String("Ваш запрос на добавление репетитора подтверждён".getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
                            body = "<p>Здравствуйте, " + surname_student + " " + name_student + "!</p><p>Репетитор " + surname_tutor + " " + name_tutor +
                                    " принял вас в ряды своих учеников по предмету \"" + subject + "\", подравляем! Вы можете связаться с репетитором для уточнения деталей грядущих занятий, используя данные," +
                                    " указанные ниже.</p><p><div>Личные данные репетитора TutRes.com:</div><div>ФИО: " + surname_tutor + " " + name_tutor + " " + secname_tutor +
                                    "</div><div>Номер телефона: " + phone_tutor + "</div><div>Email: " + email_tutor + "</div><div>Адрес: " + address_tutor + "</div></p>";
                        }else {
                            title = new String("Ваш запрос на добавление репетитора отклонён".getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
                            body = "<p>Здравствуйте, " + surname_student + " " + name_student + "!</p><p>Репетитор " + surname_tutor + " " + name_tutor +
                                    " удалил вас из состава своих учеников по предмету \"" + subject + "\", надеемся, что вы не потратили время зря и смогли 'прокачаться' по выбранному предмету. " +
                                    "Вы можете связаться с репетитором для уточнения деталей и причин удаления, используя данные, указанные ниже.</p>" +
                                    "<p><div>Личные данные репетитора TutRes.com:</div><div>ФИО: " + surname_tutor + " " + name_tutor + " " + secname_tutor +
                                    "</div><div>Номер телефона: " + phone_tutor + "</div><div>Email: " + email_tutor + "</div><div>Адрес: " + address_tutor + "</div></p>";
                        }
                        try {
                            new Mailer("support@tutres.com", "sW5QN5Rb6TFN7hYD").send(title, body, "tutres.html", "TutRes.com", email_student);
                        }catch (Exception e){}

                    } catch (Exception e) {
                        writer.print(e);
                    }
                }
            } catch (Exception e) {
                writer.print(e);
            } finally {
                writer.close();
            }
        } catch (Exception e) {
            writer.print(e);
        } finally {
            writer.close();
        }
    }
}
