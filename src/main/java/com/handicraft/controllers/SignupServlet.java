package com.handicraft.controllers;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

import com.handicraft.config.DBConfig;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    String confirmPassword = request.getParameter("confirmPassword");
	    String phone = request.getParameter("phone");

	    // ✅ CHECK PASSWORD MATCH
	    if (!password.equals(confirmPassword)) {
	        response.sendRedirect("pages/signup.jsp?error=Passwords do not match");
	        return;
	    }

	    try {
	        Connection conn = DBConfig.getConnection();

	        // ✅ CHECK EMAIL EXISTS
	        PreparedStatement check = conn.prepareStatement(
	                "SELECT * FROM users WHERE email=?");
	        check.setString(1, email);

	        ResultSet rs = check.executeQuery();

	        if (rs.next()) {
	            response.sendRedirect("pages/signup.jsp?error=Email already exists");
	            return;
	        }

	        // ✅ INSERT USER
	        PreparedStatement ps = conn.prepareStatement(
	                "INSERT INTO users(name, email, password, role, phone) VALUES (?, ?, ?, ?, ?)");

	        ps.setString(1, name);
	        ps.setString(2, email);
	        ps.setString(3, password);
	        ps.setString(4, "user");
	        ps.setString(5, phone);

	        ps.executeUpdate();

	        response.sendRedirect(
	        	    request.getContextPath() +
	        	    "/pages/login.jsp?success=Account Created Successfully"
	        	);

	    } catch (Exception e) {
	        e.printStackTrace(); // 🔥 CHECK CONSOLE HERE
	        response.getWriter().println("Signup Failed: " + e.getMessage());
	    }
	}
}