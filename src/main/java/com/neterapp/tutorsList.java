package com.neterapp;

import java.io.PrintWriter;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Array;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet("/ttrlist.ntr")
public class tutorsList extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest login_request, HttpServletResponse login_response)
            throws ServletException, IOException {
        try {
            login_response.setContentType("text/html");
            login_response.setCharacterEncoding("UTF-8");
            login_request.setCharacterEncoding("UTF-8");
            PrintWriter writer = login_response.getWriter();
            String path = new URL(login_request.getRequestURL().toString()).getHost();
            String scheme = (path.equals("localhost") || path.equals("debug.tutres.com")) ? "tutrestest" : "tutoreadatabase";
            String sqlDomain = (path.equals("localhost")) ? "tutres.com" : "localhost";
            Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
            try (Connection connection = DriverManager.getConnection("jdbc:mysql://" + sqlDomain + "/" + scheme + "?serverTimezone=UTC&useSSL=true", "root", "59R2d{YPVqb@QLrE")) {
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM accs");
                List<String> response_list = new ArrayList<>();
                while (resultSet.next()) {
                    String name = resultSet.getString(3);
                    String surname = resultSet.getString(2);
                    String country = resultSet.getString(6);
                    String region = resultSet.getString(7);
                    String city = resultSet.getString(8);
                    String street = resultSet.getString(9);
                    String building = resultSet.getString(10);
                    String email = resultSet.getString(12);
                    String number = resultSet.getString(11);
                    String position = resultSet.getString(5);
                    String status = resultSet.getString(14);
                    String id = resultSet.getString(15);
                    String subject = resultSet.getString(16);
                    String date = resultSet.getString(17);
                    int requestId = Integer.parseInt(login_request.getParameter("id"));
                    String full_address =  String.join(", ", country, region, city, street, building);
                    String response_data = String.join("_", name, surname, full_address, email, number, id, subject, date);
                            /*name + "_" + surname + "_" + country + ", " + region + ", " + city + ", " + street + ", "
                            + building + "_" + email + "_" + number + "_" + id + "_" + subject + "_" + date + "//";*/
                    List<String>subs_array = new ArrayList<>(Arrays.asList(subject.split(", ")));
                    if (position.equals("Репетитор") && status.equals("active")){
                        switch (requestId){
                            case 1:
                                if (subs_array.contains("Математика"))response_list.add(response_data);
                                break;
                            case 2:
                                if (subs_array.contains("Физика"))response_list.add(response_data);
                                break;
                            case 3:
                                subs_array.remove("Математика");
                                subs_array.remove("Физика");
                                subs_array.remove("Информатика");
                                subs_array.remove("Программирование");
                                if (subs_array.size() > 0) {
                                    String local_response_data = String.join("_", name, surname, full_address, email, number, id, String.join(", ", subs_array), date);
                                        response_list.add(local_response_data);
                                }

                                break;
                            case 4:
                                if (subs_array.contains("Информатика"))response_list.add(response_data);
                                break;
                            case 5:
                                if (subs_array.contains("Программирование"))response_list.add(response_data);
                                break;
                        }
                    }
                }
                writer.print(String.join("//", response_list));

            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("error");
            } finally {
                writer.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}