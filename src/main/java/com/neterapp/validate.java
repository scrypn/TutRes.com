package com.neterapp;

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


@WebServlet("/val.ntr")
public class validate extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest reg_request, HttpServletResponse reg_response)
            throws ServletException, IOException {

        reg_response.setContentType("text/html");
        reg_response.setCharacterEncoding("UTF-8");
        reg_request.setCharacterEncoding("UTF-8");
        PrintWriter writer = reg_response.getWriter();
        try {
            String path = new URL(reg_request.getRequestURL().toString()).getHost();
            String scheme = (path.equals("localhost") || path.equals("debug.tutres.com")) ? "tutrestest" : "tutoreadatabase";
            String sqlDomain = (path.equals("localhost")) ? "tutres.com" : "localhost";
            Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
            try (Connection connection = DriverManager.getConnection("jdbc:mysql://" + sqlDomain + "/" + scheme + "?serverTimezone=UTC&useSSL=true", "root", "59R2d{YPVqb@QLrE")) {
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM accs");
                if (reg_request.getParameter("id").equals("1")){
                    boolean findingEmailStatus = false;
                    while (resultSet.next()) {
                        String email = resultSet.getString(12);
                        if (reg_request.getParameter("valid").equals(email)) {
                            writer.print("yes");
                            findingEmailStatus = true;
                        }
                    }
                    if (!findingEmailStatus) writer.print("no");
                }else if (reg_request.getParameter("id").equals("2")){

                }

            } catch (Exception e) {
                writer.print(e);
            } finally {
                writer.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}