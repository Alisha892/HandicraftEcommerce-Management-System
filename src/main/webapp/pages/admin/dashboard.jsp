<%@ page import="java.sql.*" %>
<%@ page import="com.handicraft.config.DBConfig" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>

    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

    <style>
        .dashboard {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-top: 30px;
            flex-wrap: wrap;
        }

        .card {
            background: white;
            padding: 25px;
            width: 220px;
            text-align: center;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .card h2 {
            margin: 10px 0;
            color: #2a6fb0;
        }

        .card p {
            font-weight: bold;
        }

        .actions {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-top: 40px;
        }

        .btn {
            padding: 12px 20px;
            background: #2a6fb0;
            color: white;
            border-radius: 6px;
            text-decoration: none;
        }

        .btn:hover {
            background: #1d4f85;
        }

        h2 {
            text-align: center;
        }
    </style>
</head>

<body>

<div class="navbar">
    <span>Admin Panel</span>
    <a href="<%= request.getContextPath() %>/logout" style="float:right;">Logout</a>
</div>

<h2>Welcome Admin!!</h2>

<%
int totalProducts = 0;
int totalOrders = 0;
double totalRevenue = 0;

try {
    Connection conn = DBConfig.getConnection();

    // Total Products
    Statement st1 = conn.createStatement();
    ResultSet rs1 = st1.executeQuery("SELECT COUNT(*) FROM products");
    if (rs1.next()) {
        totalProducts = rs1.getInt(1);
    }

    // Total Orders
    Statement st2 = conn.createStatement();
    ResultSet rs2 = st2.executeQuery("SELECT COUNT(*) FROM orders");
    if (rs2.next()) {
        totalOrders = rs2.getInt(1);
    }

    // Total Revenue
    Statement st3 = conn.createStatement();
    ResultSet rs3 = st3.executeQuery("SELECT SUM(total_amount) FROM orders");
    if (rs3.next()) {
        totalRevenue = rs3.getDouble(1);
    }

} catch(Exception e) {
    e.printStackTrace();
}
%>

<!-- STATS -->
<div class="dashboard">

    <div class="card">
        <p>Total Products</p>
        <h2><%= totalProducts %></h2>
    </div>

    <div class="card">
        <p> Total Orders</p>
        <h2><%= totalOrders %></h2>
    </div>

    <div class="card">
        <p>Total Revenue</p>
        <h2>Rs. <%= totalRevenue %></h2>
    </div>

</div>

<!-- ACTION BUTTONS -->
<div class="actions">

    <a class="btn" href="../products.jsp">Manage Products</a>

    <a class="btn" href="adminOrders.jsp">Manage Orders</a>

    <a class="btn" href="../addProduct.jsp">Add Product</a>

</div>

</body>
</html>