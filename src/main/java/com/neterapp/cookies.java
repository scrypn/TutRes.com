package com.neterapp;

import java.io.PrintWriter;
import java.io.IOException;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigInteger;
import java.net.URL;
import java.net.URLEncoder;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.sql.*;

@WebServlet("/cookies.ntr")
public class cookies extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest cookie_request, HttpServletResponse cookie_response)
            throws ServletException, IOException {

        cookie_response.setContentType("text/html");
        cookie_response.setCharacterEncoding("UTF-8");
        cookie_request.setCharacterEncoding("UTF-8");
        PrintWriter writer = cookie_response.getWriter();
        try {
            String path = new URL(cookie_request.getRequestURL().toString()).getHost();
            String scheme = (path.equals("localhost") || path.equals("debug.tutres.com")) ? "tutrestest" : "tutoreadatabase";
            String sqlDomain = (path.equals("localhost")) ? "tutres.com" : "localhost";
            Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
            try (Connection connection = DriverManager.getConnection("jdbc:mysql://" + sqlDomain + "/" + scheme + "?serverTimezone=UTC&useSSL=true", "root", "59R2d{YPVqb@QLrE")) {
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM accs");
                boolean sendWriterAnswer = false;
                while (resultSet.next()) {
                    String email = resultSet.getString(12);
                    String psw = resultSet.getString(13);
                    if (email.equals(cookie_request.getParameter("email")) && psw.equals(cookie_request.getParameter("pass").trim())) {
                    String cookie_data = URLEncoder.encode(resultSet.getString(2) + "/" + resultSet.getString(3) + "/" +
                            resultSet.getString(14) + "/" + resultSet.getString(5) + "/" +
                            resultSet.getString(12) + "/" + resultSet.getString(15) + "/" + resultSet.getString(4) + "/" +
                            resultSet.getString(11) + "/" + resultSet.getString(6) + ", " + resultSet.getString(7) + ", " +
                            resultSet.getString(8) + ", " + resultSet.getString(9) + ", " + resultSet.getString(10) + "/" + resultSet.getString(13)
                            + "/" + resultSet.getString(15) + "/" + resultSet.getString(16) + "/" + resultSet.getString(17), "UTF-8").replaceAll("\\+", "%20")
                            .replaceAll("\\%21", "!")
                            .replaceAll("\\%27", "'")
                            .replaceAll("\\%28", "(")
                            .replaceAll("\\%29", ")")
                            .replaceAll("\\%7E", "~");
                    Cookie cookie = new Cookie("user", cookie_data);
                    cookie.setMaxAge(599184000);
                    cookie.setPath("/");
                    cookie_response.addCookie(cookie);
                        try(PreparedStatement preparedStatement = connection.prepareStatement("UPDATE accs SET signInCounter=? WHERE personalID=?")){
                            preparedStatement.setString(1, String.valueOf(Integer.parseInt(resultSet.getString(1))+1));
                            preparedStatement.setString(2, resultSet.getString(15));
                            preparedStatement.executeUpdate();
                        }
                    sendWriterAnswer = true;
                    writer.print("1");
                     break;
                    }
                }
                if (!sendWriterAnswer) {
                    writer.print("0");
                }
            } catch (Exception e) {
                writer.print(e);
            }
        }catch (Exception e){
            writer.print(e);
        }finally {
            writer.close();
        }
    }
}