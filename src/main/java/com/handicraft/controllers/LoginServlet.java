package com.handicraft.controllers;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

import com.handicraft.config.DBConfig;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Connection conn = DBConfig.getConnection();

            if (conn == null) {
                response.getWriter().println("ERROR: DB Connection is NULL");
                return;
            }

            String query = "SELECT * FROM users WHERE email=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(query);

            ps.setString(1, email.trim());
            ps.setString(2, password.trim());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                System.out.println("LOGIN SUCCESS");

                HttpSession session = request.getSession();

                // ✅ STORE USER DATA IN SESSION
                session.setAttribute("user_id", rs.getInt("id"));
                session.setAttribute("user_name", rs.getString("name"));
                session.setAttribute("role", rs.getString("role"));

                String role = rs.getString("role");

                // ✅ REDIRECT BASED ON ROLE
                if ("admin".equalsIgnoreCase(role)) {
                    response.sendRedirect(request.getContextPath() + "/pages/admin/dashboard.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/pages/products.jsp");
                }

            } else {
                System.out.println("LOGIN FAILED");
                response.getWriter().println("<h3>Invalid Credentials</h3>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("ERROR: " + e.getMessage());
        }
    }

    // optional: prevent direct GET access
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("pages/login.jsp");
    }
}