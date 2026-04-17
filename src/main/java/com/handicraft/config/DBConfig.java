package com.handicraft.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {

    private static final String URL = "jdbc:mysql://localhost:3306/handicraft_db";
    private static final String USER = "root";
    private static final String PASSWORD = ""; // or your MySQL password

    public static Connection getConnection() {
        Connection conn = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("DB Connected");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return conn;
    }
}