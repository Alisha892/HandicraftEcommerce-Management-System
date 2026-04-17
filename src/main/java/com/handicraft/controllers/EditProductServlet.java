package com.handicraft.controllers;

import com.handicraft.config.DBConfig;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/editProduct")
public class EditProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String category = request.getParameter("category");

        try {
            Connection conn = DBConfig.getConnection();

            String query = "UPDATE products SET name=?, price=?, description=?, category=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(query);

            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setString(3, description);
            ps.setString(4, category);
            ps.setInt(5, id);

            ps.executeUpdate();

            response.sendRedirect("pages/products.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}