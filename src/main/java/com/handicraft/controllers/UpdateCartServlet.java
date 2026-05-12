package com.handicraft.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.Map;

@WebServlet("/updateCart")
public class UpdateCartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        String qtyStr = request.getParameter("quantity");

        // ✅ SAFETY CHECK
        if (idStr == null || qtyStr == null || idStr.isEmpty() || qtyStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/pages/cart.jsp");
            return;
        }

        int id = Integer.parseInt(idStr);
        int quantity = Integer.parseInt(qtyStr);

        System.out.println("Updating product ID: " + id);
        System.out.println("New quantity: " + quantity);

        Map<Integer, Integer> cart =
                (Map<Integer, Integer>) request.getSession().getAttribute("cart");

        if (cart != null) {
            if (quantity <= 0) {
                cart.remove(id);
            } else {
                cart.put(id, quantity);
            }
        }

        response.sendRedirect(request.getContextPath() + "/pages/cart.jsp");
    }
}