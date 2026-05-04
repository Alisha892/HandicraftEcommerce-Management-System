package com.handicraft.controllers;

import com.handicraft.config.DBConfig;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;
import java.sql.*;
import java.util.Map;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Integer userId = (Integer) session.getAttribute("userId");

        // ✅ SAFETY CHECK
        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.getWriter().println("Cart is empty!");
            return;
        }

        try {
            Connection conn = DBConfig.getConnection();

            double total = 0;

            // 🔹 Calculate total
            for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {

                PreparedStatement ps = conn.prepareStatement(
                        "SELECT price FROM products WHERE id=?"
                );
                ps.setInt(1, entry.getKey());

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    total += rs.getDouble("price") * entry.getValue();
                }
            }

            // 🔹 Insert order
            PreparedStatement insertOrder = conn.prepareStatement(
                    "INSERT INTO orders (user_id, total_amount, status) VALUES (?, ?, ?)",
                    Statement.RETURN_GENERATED_KEYS
            );

            insertOrder.setInt(1, userId);
            insertOrder.setDouble(2, total);
            insertOrder.setString(3, "Placed");

            insertOrder.executeUpdate();

            ResultSet keys = insertOrder.getGeneratedKeys();
            int orderId = 0;

            if (keys.next()) {
                orderId = keys.getInt(1);
            }

            // 🔹 Insert order items
            PreparedStatement insertItem = conn.prepareStatement(
                    "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)"
            );

            for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {

                PreparedStatement ps = conn.prepareStatement(
                        "SELECT price FROM products WHERE id=?"
                );
                ps.setInt(1, entry.getKey());

                ResultSet rs = ps.executeQuery();

                double price = 0;
                if (rs.next()) {
                    price = rs.getDouble("price");
                }

                insertItem.setInt(1, orderId);
                insertItem.setInt(2, entry.getKey());
                insertItem.setInt(3, entry.getValue());
                insertItem.setDouble(4, price);

                insertItem.executeUpdate();
            }

            // 🔹 Clear cart
            session.removeAttribute("cart");

            response.sendRedirect("pages/orderSuccess.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("ERROR: " + e.getMessage());
        }
    }
}