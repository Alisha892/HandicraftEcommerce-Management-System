package com.handicraft.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.handicraft.config.DBConfig;

@WebServlet("/addProduct")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class AddProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // 1️⃣ GET FORM DATA
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            String description = request.getParameter("description");

            // 2️⃣ GET IMAGE FILE
            Part filePart = request.getPart("image");
            String fileName = filePart.getSubmittedFileName();

            // 3️⃣ CREATE UPLOAD FOLDER
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            // 4️⃣ SAVE FILE
            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);

            // 5️⃣ SAVE DATA IN DATABASE
            Connection conn = DBConfig.getConnection();

            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO products(name, price, description, image) VALUES (?, ?, ?, ?)"
            );

            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setString(3, description);
            ps.setString(4, fileName); // store only filename

            ps.executeUpdate();

            // 6️⃣ REDIRECT
            response.sendRedirect("pages/products.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}