package com.handicraft.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.Map;

@WebServlet("/removeFromCart")
public class RemoveFromCartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Map<Integer, Integer> cart =
                (Map<Integer, Integer>) request.getSession().getAttribute("cart");

        int productId = Integer.parseInt(request.getParameter("id"));

        if (cart != null) {
            cart.remove(productId);
        }

        response.sendRedirect("pages/cart.jsp");
    }
}