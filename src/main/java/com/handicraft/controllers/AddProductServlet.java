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

@WebServlet("/AddProductServlet")   // 🔴 IMPORTANT: match JSP action
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
public class AddProductServlet extends HttpServlet {
	@Override
	public void init() {
	    System.out.println("AddProductServlet LOADED");
	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // ✅ 1. Get form data
            String name = request.getParameter("name");
            String priceStr = request.getParameter("price");

            double price = 0;

            if(priceStr != null && !priceStr.trim().isEmpty()){
                price = Double.parseDouble(priceStr);
            }
            String discountStr = request.getParameter("discount");

            int discount = 0;

            if(discountStr != null && !discountStr.trim().isEmpty()){
                discount = Integer.parseInt(discountStr);
            }
            
            int stock = Integer.parseInt(request.getParameter("stock"));

            String offerText = request.getParameter("offerText");
            String description = request.getParameter("description");

            // ✅ 2. Get image file
            Part filePart = request.getPart("image");
            String fileName = filePart.getSubmittedFileName();

            // 🔴 FIX: safer upload path (not inside build temp)
            String uploadPath = getServletContext().getRealPath("/uploads");

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs(); // ✅ better than mkdir()
            }

            // ✅ 3. Save file
            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);

            // ✅ 4. Save to DB
            Connection conn = DBConfig.getConnection();

            String sql = "INSERT INTO products(name,price,stock,discount,offer_text,description,image) VALUES(?,?,?,?,?,?,?)";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setInt(3, stock);
            ps.setInt(4, discount);
            ps.setString(5, offerText);
            ps.setString(6, description);
            ps.setString(7, fileName);

            ps.executeUpdate();

            conn.close();

            // 🔴 FIX: correct redirect with context path
            response.sendRedirect(request.getContextPath() + "/pages/admin/dashboard.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}