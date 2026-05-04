package com.handicraft.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;

@WebServlet("/updateOrderStatus")
public class UpdateOrderStatusServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String status = request.getParameter("status");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/handicraft_db", "root", "");

            PreparedStatement ps = conn.prepareStatement(
                    "UPDATE orders SET status=? WHERE id=?");

            ps.setString(1, status);
            ps.setInt(2, orderId);

            ps.executeUpdate();

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        // IMPORTANT FIX (context path safe redirect)
        response.sendRedirect(request.getContextPath() + "/pages/admin/adminOrders.jsp");
    }
}