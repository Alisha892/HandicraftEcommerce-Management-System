package com.handicraft.controllers;

import com.handicraft.config.DBConfig;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/deleteProduct")
public class DeleteProductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Connection conn = DBConfig.getConnection();

            String query = "DELETE FROM products WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);

            ps.executeUpdate();

            response.sendRedirect("pages/products.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}