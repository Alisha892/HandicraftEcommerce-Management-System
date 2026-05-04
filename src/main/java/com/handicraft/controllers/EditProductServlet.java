package com.handicraft.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

import com.handicraft.config.DBConfig;

@WebServlet("/EditProductServlet")
public class EditProductServlet extends HttpServlet {

    @Override
    public void init() {
        System.out.println("EditProductServlet LOADED");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");

        try {
            Connection conn = DBConfig.getConnection();

            PreparedStatement ps = conn.prepareStatement(
                "UPDATE products SET name=?, price=?, description=? WHERE id=?"
            );

            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setString(3, description);
            ps.setInt(4, id);

            ps.executeUpdate();

            conn.close();

            response.sendRedirect(request.getContextPath() + "/pages/admin/manageProducts.jsp");

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}