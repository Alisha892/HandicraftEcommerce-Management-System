<%@ page import="java.sql.*" %>
<%@ page import="com.handicraft.config.DBConfig" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Orders</title>
</head>
<body>

<h2>All Orders (Admin)</h2>

<table border="1">
<tr>
    <th>Order ID</th>
    <th>User ID</th>
    <th>Total Amount</th>
    <th>Status</th>
</tr>

<%
    Connection conn = DBConfig.getConnection();
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM orders");

    while(rs.next()) {
%>
<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getInt("user_id") %></td>
    <td><%= rs.getDouble("total_amount") %></td>
    <td><%= rs.getString("status") %></td>
</tr>
<%
    }
%>

</table>

</body>
</html>