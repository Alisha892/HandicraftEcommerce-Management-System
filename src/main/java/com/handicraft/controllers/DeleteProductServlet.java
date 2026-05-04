package com.handicraft.controllers;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

import com.handicraft.config.DBConfig;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {

    @Override
    public void init() {
        System.out.println("DeleteProductServlet LOADED");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Connection conn = DBConfig.getConnection();

            PreparedStatement ps = conn.prepareStatement(
                "DELETE FROM products WHERE id=?"
            );

            ps.setInt(1, id);
            ps.executeUpdate();

            conn.close();

            response.sendRedirect(request.getContextPath() + "/pages/admin/manageProducts.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}