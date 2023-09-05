package com.neterapp;

import com.neterlibs.Hasher;

import java.io.PrintWriter;
import java.io.IOException;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.*;
import java.math.BigInteger;
import java.net.URL;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.sql.*;

@WebServlet("/lk.ntr")
public class lk_update extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest reg_request, HttpServletResponse reg_response)
            throws ServletException, IOException {
        try {

            reg_response.setContentType("text/html");
            reg_response.setCharacterEncoding("UTF-8");
            reg_request.setCharacterEncoding("UTF-8");
            PrintWriter writer = reg_response.getWriter();
            String[] arr;
            String path = new URL(reg_request.getRequestURL().toString()).getHost();
            String scheme = (path.equals("localhost") || path.equals("debug.tutres.com")) ? "tutrestest" : "tutoreadatabase";
            String sqlDomain = (path.equals("localhost")) ? "tutres.com" : "localhost";
            Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
            String id = reg_request.getParameter("id").trim();
            String addDatatoBase = "";
            boolean psw_changed = !(reg_request.getParameter("pass")==null);
            if (psw_changed){
                arr = new String[]{"surname", "name", "sec_name", "country", "region", "city", "street",
                        "house", "phone", "pass", "subs", "date", "userId"};
            }else {
                arr = new String[]{"surname", "name", "sec_name", "country", "region", "city", "street",
                    "house", "phone", "subs", "date", "userId"};
            }
            if (id.equals("1")) {
                if (psw_changed)
                    addDatatoBase = "UPDATE accs SET userSurname=?, userName=?, userSecname=?, " +
                            "userCountry=?, userRegion=?, userCity=?, userStreet=?, userBuilding=?, userNumber=?, " +
                            "userPassword=?, userSubject=?, userDate=? WHERE personalID=?";
                else addDatatoBase = "UPDATE accs SET userSurname=?, userName=?, userSecname=?, " +
                        "userCountry=?, userRegion=?, userCity=?, userStreet=?, userBuilding=?, userNumber=?, " +
                        "userSubject=?, userDate=? WHERE personalID=?";
            }
            else if (id.equals("2"))addDatatoBase = "DELETE FROM accs WHERE personalID=? AND userEmail=?";
            else if (id.equals("3"))addDatatoBase = "UPDATE accs SET userPassword=? WHERE userEmail=?";
                          try (Connection connection = DriverManager.getConnection("jdbc:mysql://" + sqlDomain + "/" + scheme + "?serverTimezone=UTC&useSSL=true", "root", "59R2d{YPVqb@QLrE");
                 PreparedStatement preparedStatement = connection.prepareStatement(addDatatoBase)) {
                              if(id.equals("1")) {
                                  String hash = "";
                                  for (int i = 0; i < arr.length; i++) {
                                      if (arr[i].equals("pass")) {
                                          String originalPassword = reg_request.getParameter("pass").trim();
                                          hash = Hasher.hash(originalPassword, 65536, false, "a5d6c3c66bfc8ba27163e34e42c5dbef");
                                          preparedStatement.setString(i + 1, hash);
                                      } else preparedStatement.setString(i + 1, reg_request.getParameter(arr[i]).trim());
                                  }
                                  writer.print(preparedStatement.executeUpdate() + "|" + psw_changed + "|" + hash);
                              }else if (id.equals("2")){
                                  preparedStatement.setString(1, reg_request.getParameter("personalId"));
                                  preparedStatement.setString(2, reg_request.getParameter("email"));
                                  try(PreparedStatement preparedStatementMaths = connection.prepareStatement("DELETE FROM tsmaths WHERE tutorID=? OR studentID=?");
                                      PreparedStatement preparedStatementPhys = connection.prepareStatement("DELETE FROM tsphys WHERE tutorID=? OR studentID=?")){
                                      preparedStatementMaths.setString(1, reg_request.getParameter("personalId"));
                                      preparedStatementMaths.setString(2, reg_request.getParameter("personalId"));
                                      preparedStatementPhys.setString(1, reg_request.getParameter("personalId"));
                                      preparedStatementPhys.setString(2, reg_request.getParameter("personalId"));
                                      writer.print(preparedStatement.executeUpdate() + preparedStatementMaths.executeUpdate() + preparedStatementPhys.executeUpdate());
                                  }catch (Exception e){
                                      writer.print(e);
                                  }

                              }else if (id.equals("3")){
                                  String originalPassword = reg_request.getParameter("pass").trim();
                                  String hash = Hasher.hash(originalPassword, 65536, false, "a5d6c3c66bfc8ba27163e34e42c5dbef");
                                  preparedStatement.setString(1, hash);
                                  preparedStatement.setString(2, reg_request.getParameter("email").trim());
                                  writer.print(preparedStatement.executeUpdate());
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