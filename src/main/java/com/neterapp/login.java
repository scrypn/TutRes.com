package com.neterapp;

import com.neterlibs.Hasher;

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

@WebServlet("/login.ntr")
public class login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest login_request, HttpServletResponse login_response)
            throws ServletException, IOException {

             login_response.setContentType("text/html");
             login_response.setCharacterEncoding("UTF-8");
             login_request.setCharacterEncoding("UTF-8");
             PrintWriter writer = login_response.getWriter();
             try {
                 String path = new URL(login_request.getRequestURL().toString()).getHost();
                 String scheme = (path.equals("localhost") || path.equals("debug.tutres.com")) ? "tutrestest" : "tutoreadatabase";
                 String sqlDomain = (path.equals("localhost")) ? "tutres.com" : "localhost";
                 Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
             try (Connection connection = DriverManager.getConnection("jdbc:mysql://" + sqlDomain + "/" + scheme + "?serverTimezone=UTC&useSSL=true", "root", "59R2d{YPVqb@QLrE")) {
                 Statement statement = connection.createStatement();
                 ResultSet resultSet = statement.executeQuery("SELECT * FROM accs");
                 boolean sendWriterAnswer = false;
                 String originalPassword = login_request.getParameter("pass").trim();
                 String hash = Hasher.hash(originalPassword, 65536, false, "a5d6c3c66bfc8ba27163e34e42c5dbef");
                 while (resultSet.next()) {
                     String email = resultSet.getString(12);
                     String psw = resultSet.getString(13);
                     if (email.equals(login_request.getParameter("email")) && psw.equals(hash)) {
                         String sign_in_data = URLEncoder.encode(resultSet.getString(2) + "/" + resultSet.getString(3) + "/" +
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
                         Cookie cookie = new Cookie("user", sign_in_data);
                         cookie.setMaxAge(599184000);
                         cookie.setPath("/");
                         login_response.addCookie(cookie);
                         if(email.equals("admin@tutres.com")){
                             Cookie cookie_debug = new Cookie("auth", "admin");
                             cookie_debug.setMaxAge(599184000);
                             cookie_debug.setPath("/");
                             cookie_debug.setDomain("tutres.com");
                             login_response.addCookie(cookie_debug);
                         }
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