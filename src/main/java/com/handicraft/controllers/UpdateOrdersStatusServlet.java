package com.handicraft.controllers;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

import com.handicraft.config.DBConfig;

@WebServlet("/updateOrderStatus")
public class UpdateOrdersStatusServlet extends HttpServlet {
	 private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");

        try {
            Connection conn = DBConfig.getConnection();

            PreparedStatement ps = conn.prepareStatement(
                "UPDATE orders SET status=? WHERE id=?"
            );

            ps.setString(1, status);
            ps.setInt(2, id);

            ps.executeUpdate();

            response.sendRedirect(request.getContextPath() + "/pages/admin/adminOrders.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}