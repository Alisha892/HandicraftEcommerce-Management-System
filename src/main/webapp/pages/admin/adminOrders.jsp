<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin - Manage Orders</title>

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            background: #f5efe7;
        }

        /* NAVBAR */
        .navbar {
            background: #3e5c76;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            color: white;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin-left: 15px;
            font-weight: bold;
        }

        /* CONTAINER */
        .container {
            width: 90%;
            margin: 30px auto;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        /* TABLE */
        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
        }

        th {
            background: #3e5c76;
            color: white;
            padding: 12px;
        }

        td {
            padding: 12px;
            text-align: center;
            background: #ffffff;
        }

        tr:nth-child(even) td {
            background: #f0f0f0;
        }

        /* STATUS BADGES */
        .status {
            padding: 6px 12px;
            border-radius: 20px;
            color: white;
            font-size: 13px;
        }

        .placed {
            background: gray;
        }

        .pending {
            background: #3b82f6;
        }

        .delivered {
            background: green;
        }

        /* FORM */
        select {
            padding: 5px;
            border-radius: 5px;
        }

        button {
            background: #c49a6c;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            background: #a67c52;
        }

    </style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="../products.jsp">Products</a>
    </div>
    <div>
        <a href="../logout">Logout</a>
    </div>
</div>

<div class="container">

<h2>Manage Orders</h2>

<table>

<tr>
    <th>Order ID</th>
    <th>User ID</th>
    <th>Total</th>
    <th>Status</th>
    <th>Action</th>
</tr>

<%
    try {
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/handicraft_db", "root", ""
        );

        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM orders");

        while(rs.next()) {

            int orderId = rs.getInt("id");
            String status = rs.getString("status");
%>

<tr>

    <td><%= orderId %></td>
    <td><%= rs.getInt("user_id") %></td>
    <td>Rs. <%= rs.getDouble("total_amount") %></td>

    <!-- STATUS DISPLAY -->
    <td>
        <span class="status <%= status.toLowerCase() %>">
            <%= status %>
        </span>
    </td>

    <!-- UPDATE FORM -->
    <td>
        <form action="/HandicraftEcommerce/updateOrderStatus" method="post">

    <input type="hidden" name="orderId" value="<%= rs.getInt("id") %>">

    <select name="status">
        <option value="Placed" <%= rs.getString("status").equals("Placed") ? "selected" : "" %>>Placed</option>
        <option value="Pending" <%= rs.getString("status").equals("Pending") ? "selected" : "" %>>Pending</option>
        <option value="Delivered" <%= rs.getString("status").equals("Delivered") ? "selected" : "" %>>Delivered</option>
    </select>

    <button type="submit">Update</button>

</form>
    </td>

</tr>

<%
        }
        conn.close();
    } catch(Exception e) {
        out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
    }
%>

</table>

</div>

</body>
</html>