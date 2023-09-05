package com.neterapp;

import com.neterlibs.Hasher;
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
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet("/reg.ntr")
public class reg extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest reg_request, HttpServletResponse reg_response)
            throws ServletException, IOException {
        try {

            reg_response.setContentType("text/html");
            reg_response.setCharacterEncoding("UTF-8");
            reg_request.setCharacterEncoding("UTF-8");
            PrintWriter writer = reg_response.getWriter();
            String[] arr = {"surname", "name", "sec_name", "emp", "country", "region", "city", "street", "house", "phone", "email"};
            String[] names = {"Фамилия: ", "Имя: ", "Отчество: ", "Должность: ", "Страна: ", "Регион: ", "Город: ", "Улица: ", "Здание: ", "Номер: ", "Email: ", "Пароль: "};
            List<String> all_users_ids = new ArrayList<>();
            char[] alphabet = "mno23hJTUVijkabcd6efg19stuvBWPQRKlqr78LMNCD45p0OSwEFGHIxyzAXYZ".toCharArray();
            String path = new URL(reg_request.getRequestURL().toString()).getHost();
            String scheme = (path.equals("localhost") || path.equals("debug.tutres.com")) ? "tutrestest" : "tutoreadatabase";
            String sqlDomain = (path.equals("localhost")) ? "tutres.com" : "localhost";
            Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
            try (Connection connection = DriverManager.getConnection("jdbc:mysql://" + sqlDomain + "/" + scheme + "?serverTimezone=UTC&useSSL=true", "root", "59R2d{YPVqb@QLrE")) {
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM accs");
                while (resultSet.next()) {
                    all_users_ids.add(resultSet.getString(15));
                }
                String addDatatoBase = "INSERT accs(signInCounter, userSurname, userName, userSecname, " +
                        "userPosition, userCountry, userRegion, userCity, userStreet, userBuilding, userNumber, userEmail, userPassword, userStatus, personalID, userSubject, userDate, accountCreated) VALUES (0, ";
                String[] dataarr = new String[12];
                for (int i = 0; i < arr.length; i++) {
                    String var = reg_request.getParameter(arr[i]).trim();
                    addDatatoBase += "'" + var + "', ";
                    dataarr[i] = var;
                }
                String originalPassword = reg_request.getParameter("pass").trim();
                String hash = Hasher.hash(originalPassword, 65536, false, "a5d6c3c66bfc8ba27163e34e42c5dbef");
                addDatatoBase += "'" + hash + "', ";
                if ((reg_request.getParameter("emp").trim()).equals("Ученик")) addDatatoBase += "'active', ";
                else addDatatoBase += "'inactive', ";
                StringBuilder random = new StringBuilder();
                while (true) {
                    for (int i = 0; i < 20; i++) {
                        random.append(alphabet[(int) (Math.random() * 62)]);
                    }
                    String status = reg_request.getParameter(arr[3]).trim();
                    if (status.equals("Репетитор"))random.append("#tutor");
                    else if (status.equals("Ученик"))random.append("#student");
                    else random.append("#undefined");
                    boolean bool = true;
                    for (int i = 0; i < all_users_ids.size(); i++)  {
                        if (all_users_ids.get(i).equals(random.toString())) bool = false;
                    }
                    if (bool) break;
                    else random.setLength(0);

                }
                addDatatoBase += "'" + random + "', ";
                addDatatoBase += "'" + reg_request.getParameter("subs").trim() + "', ";
                addDatatoBase += "'" + reg_request.getParameter("date").trim() + "', ";
                SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
                Date date = new Date(System.currentTimeMillis());
                addDatatoBase += "'" + formatter.format(date) + "')";
                int result = statement.executeUpdate(addDatatoBase);
                writer.print(result);
                String title = "";
                String body = "";
                if (result == 1){
                    title = "Зарегистрирован новый пользователь";
                    body = formatter.format(date) + ": Зарегистрирован новый пользователь " + reg_request.getParameter(arr[0]).trim() + " " +
                            reg_request.getParameter(arr[1]).trim() + " " + reg_request.getParameter(arr[2]).trim() + ", " + reg_request.getParameter(arr[3]).trim() +
                            ".<br><br>Контактные данные:<br>Номер телефона: " + reg_request.getParameter(arr[9]).trim() + "<br>Email-адрес: " +
                            reg_request.getParameter(arr[10]).trim();
                }else if (result == 0){
                    title = "Ошибка регистрации нового пользователя";
                    body = formatter.format(date) + ": Ошибка регистрации нового пользователя " + reg_request.getParameter(arr[0]).trim() + " " +
                            reg_request.getParameter(arr[1]).trim() + " " + reg_request.getParameter(arr[2]).trim() + ", " + reg_request.getParameter(arr[3]).trim() +
                            ".<br>Код ошибки: 0<br><br>Контактные данные:<br>Номер телефона: " + reg_request.getParameter(arr[9]).trim() + "<br>Email-адрес: " +
                            reg_request.getParameter(arr[10]).trim();
                }


                new Mailer("user@tutres.com", "RAY48MuX2ha6EUXL").send(title, body, "tutres.html",
                        "TutRes.com users", "support@tutres.com");
            } catch (Exception e) {
                writer.print("error");
                SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
                Date date = new Date(System.currentTimeMillis());
                String title = "Ошибка регистрации нового пользователя";
                String body = formatter.format(date) + ": Ошибка регистрации нового пользователя " + reg_request.getParameter(arr[0]).trim() + " " +
                        reg_request.getParameter(arr[1]).trim() + " " + reg_request.getParameter(arr[2]).trim() + ", " + reg_request.getParameter(arr[3]).trim() +
                        ".<br>Код ошибки: " + e + "<br><br>Контактные данные:<br>Номер телефона: " + reg_request.getParameter(arr[9]).trim() + "<br>Email-адрес: " +
                        reg_request.getParameter(arr[10]).trim();

                new Mailer("user@tutres.com", "RAY48MuX2ha6EUXL").send(title, body, "tutres.html",
                        "TutRes.com users", "support@tutres.com");
            } finally {
                writer.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}