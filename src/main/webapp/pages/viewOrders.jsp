<%@ page import="java.sql.*" %>
<%@ page import="com.handicraft.config.DBConfig" %>

<!DOCTYPE html>
<html>
<head>
    <title>My Orders</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<h2>My Orders</h2>

<table border="1">
<tr>
    <th>Order ID</th>
    <th>User ID</th>
    <th>Total Amount</th>
    <th>Status</th>
</tr>

<%
    // Get logged-in user ID from session
    HttpSession session1 = request.getSession();
    Integer userId = (Integer) session1.getAttribute("user_id");

    if(userId != null) {

        Connection conn = DBConfig.getConnection();
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM orders WHERE user_id=?");
        ps.setInt(1, userId);

        ResultSet rs = ps.executeQuery();

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

    } else {
%>

<tr>
    <td colspan="4">User not logged in</td>
</tr>
<%
    }
%>

</table>

</body>
</html>