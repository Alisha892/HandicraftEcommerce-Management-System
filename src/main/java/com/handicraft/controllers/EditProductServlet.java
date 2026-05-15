package com.handicraft.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.handicraft.config.DBConfig;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/editProduct")
public class EditProductServlet extends HttpServlet {

protected void doPost(
HttpServletRequest request,
HttpServletResponse response)

throws ServletException, IOException {


try{

int id=
Integer.parseInt(
request.getParameter("id"));

String name=
request.getParameter("name");

double price=
Double.parseDouble(
request.getParameter("price"));

int stock=
Integer.parseInt(
request.getParameter("stock"));

int discount=
Integer.parseInt(
request.getParameter("discount"));

String offerText=
request.getParameter("offerText");

String description=
request.getParameter("description");

String category=
request.getParameter("category");


Connection conn=
DBConfig.getConnection();


String sql=
"UPDATE products SET " +
"name=?," +
"price=?," +
"stock=?," +
"discount=?," +
"offer_text=?," +
"description=?," +
"category=? " +
"WHERE id=?";


PreparedStatement ps=
conn.prepareStatement(sql);


ps.setString(1,name);

ps.setDouble(2,price);

ps.setInt(3,stock);

ps.setInt(4,discount);

ps.setString(5,offerText);

ps.setString(6,description);

ps.setString(7,category);

ps.setInt(8,id);


ps.executeUpdate();

conn.close();


response.sendRedirect(
request.getContextPath()
+"/pages/admin/manageProducts.jsp");


}catch(Exception e){

e.printStackTrace();

}

}

}