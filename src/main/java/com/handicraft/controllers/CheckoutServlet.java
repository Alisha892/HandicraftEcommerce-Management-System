package com.handicraft.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;
import com.handicraft.config.DBConfig;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            System.out.println("CHECKOUT STARTED");

            HttpSession session = request.getSession();

            Integer userId = (Integer) session.getAttribute("user_id");
            List<Integer> cart = (List<Integer>) session.getAttribute("cart");

            System.out.println("User ID: " + userId);
            System.out.println("Cart: " + cart);

            if (userId == null || cart == null || cart.isEmpty()) {
                System.out.println("Cart empty or user not logged in");
                response.sendRedirect("pages/cart.jsp");
                return;
            }

            Connection conn = DBConfig.getConnection();

            double total = 0;

            for (int id : cart) {
                PreparedStatement ps = conn.prepareStatement("SELECT price FROM products WHERE id=?");
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    total += rs.getDouble("price");
                }
            }

            System.out.println("Total: " + total);

            // INSERT ORDER
            PreparedStatement ps2 = conn.prepareStatement(
                "INSERT INTO orders(user_id, total_amount, status) VALUES (?, ?, ?)"
            );

            ps2.setInt(1, userId);
            ps2.setDouble(2, total);
            ps2.setString(3, "Pending");

            ps2.executeUpdate();

            System.out.println("Order inserted");

            // CLEAR CART
            session.removeAttribute("cart");

            // REDIRECT
            response.sendRedirect("pages/orderSuccess.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("ERROR: " + e.getMessage());
        }
    }
}