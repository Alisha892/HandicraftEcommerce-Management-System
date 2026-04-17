package com.handicraft.controllers;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/removeFromCart")
public class RemoveFromCartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("id"));

        HttpSession session = request.getSession();
        List<Integer> cart = (List<Integer>) session.getAttribute("cart");

        if (cart != null) {
            cart.remove(Integer.valueOf(productId));
        }

        response.sendRedirect(request.getContextPath() + "/pages/cart.jsp");
    }
}