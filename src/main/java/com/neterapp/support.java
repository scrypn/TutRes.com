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


@WebServlet("/support.ntr")
public class support extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest reg_request, HttpServletResponse reg_response)
            throws ServletException, IOException {
        reg_response.setContentType("text/html");
        reg_response.setCharacterEncoding("UTF-8");
        PrintWriter writer = reg_response.getWriter();

        try {
            reg_request.setCharacterEncoding("UTF-8");
            String title = new String(" - автоматическое уведомление TutRes.com".getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
            String body = new String(reg_request.getParameter("notify").trim().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
            new Mailer("user@tutres.com", "RAY48MuX2ha6EUXL").send(title, body, "tutres.html","TutRes.com", "support@tutres.com");
        } catch (Exception e) {
            writer.print(e);
        } finally {
            writer.close();
        }
    }
}