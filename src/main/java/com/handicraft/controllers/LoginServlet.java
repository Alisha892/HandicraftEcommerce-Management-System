package com.handicraft.controllers;
import jakarta.servlet.http.HttpSession;
import com.handicraft.config.DBConfig;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;
import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Connection conn = DBConfig.getConnection();

            PreparedStatement ps = conn.prepareStatement(
                "SELECT * FROM users WHERE email=? AND password=?"
            );

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){

                HttpSession session = request.getSession();

                int userId = rs.getInt("id");
                String name = rs.getString("name");
                String role = rs.getString("role");

                session.setAttribute("userId", userId);
                session.setAttribute("name", name);
                session.setAttribute("role", role);

                if(role.equalsIgnoreCase("admin")){

                    session.setAttribute("redirectPage", "pages/admin/dashboard.jsp");

                } else {

                    session.setAttribute("redirectPage", "pages/products.jsp");
                }

                response.sendRedirect("pages/loginSuccess.jsp");

            } else {

                response.getWriter().println("Invalid Login");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("ERROR: " + e.getMessage());
        }
    }
}