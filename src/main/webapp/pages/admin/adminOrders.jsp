<%@ page import="java.sql.*" %>
<%@ page import="com.handicraft.config.DBConfig" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Orders</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>

<body>

<div class="navbar">
    <a href="dashboard.jsp">Dashboard</a>
    <a href="<%= request.getContextPath() %>/logout">Logout</a>
</div>

<div class="container">

<h2>All Orders</h2>

<table>
<tr>
    <th>Order ID</th>
    <th>User ID</th>
    <th>Total</th>
    <th>Status</th>
    <th>Update</th>
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
    <td>Rs. <%= rs.getDouble("total_amount") %></td>
    <td><%= rs.getString("status") %></td>

    <td>
        <form action="<%= request.getContextPath() %>/updateOrderStatus" method="post">
            <input type="hidden" name="id" value="<%= rs.getInt("id") %>">

            <select name="status">
                <option>Pending</option>
                <option>Shipped</option>
                <option>Delivered</option>
            </select>

            <button type="submit">Update</button>
        </form>
    </td>
</tr>

<%
}
%>

</table>

</div>

</body>
</html>