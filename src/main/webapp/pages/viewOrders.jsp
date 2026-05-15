<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.handicraft.config.DBConfig" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>

<style>

body{
    margin:0;
    padding:0;
    font-family: Arial, sans-serif;
    background:#f5f1eb;
}

/* NAVBAR */
.navbar{
    background:#3e5c76;
    padding:15px 40px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.navbar a{
    color:white;
    text-decoration:none;
    margin-right:20px;
    font-weight:bold;
}

.logout{
    margin-right:0;
}

/* MAIN */
.container{
    width:90%;
    margin:40px auto;
}

h1{
    text-align:center;
    color:#2c3e50;
    margin-bottom:30px;
}

/* TABLE */
table{
    width:100%;
    border-collapse:collapse;
    background:white;
    border-radius:10px;
    overflow:hidden;
    box-shadow:0 4px 10px rgba(0,0,0,0.1);
}

table th{
    background:#3e5c76;
    color:white;
    padding:15px;
    text-align:center;
}

table td{
    padding:15px;
    text-align:center;
    border-bottom:1px solid #eee;
}

table tr:hover{
    background:#f9f9f9;
}

/* STATUS */
.pending{
    color:orange;
    font-weight:bold;
}

.completed{
    color:green;
    font-weight:bold;
}

.cancelled{
    color:red;
    font-weight:bold;
}

/* EMPTY */
.empty{
    text-align:center;
    background:white;
    padding:40px;
    border-radius:10px;
    box-shadow:0 4px 10px rgba(0,0,0,0.1);
    color:#666;
    font-size:18px;
}

</style>

</head>

<body>

<!-- NAVBAR -->
<div class="navbar">

    <div>
        <a href="<%= request.getContextPath() %>/pages/products.jsp">
            Home
        </a>

        <a href="<%= request.getContextPath() %>/pages/cart.jsp">
            Cart
        </a>

        <a href="<%= request.getContextPath() %>/pages/viewOrders.jsp">
            My Orders
        </a>

        <a href="<%= request.getContextPath() %>/pages/profile.jsp">
            Profile
        </a>
        <a href="<%=request.getContextPath()%>/pages/about.jsp">About</a>

<a href="<%=request.getContextPath()%>/pages/contact.jsp">Contact</a>
    </div>

    <div>
        <a class="logout"
           href="<%= request.getContextPath() %>/logout">
           Logout
        </a>
    </div>

</div>

<!-- MAIN -->
<div class="container">

<h1>My Orders</h1>

<%

HttpSession session1 = request.getSession();

Integer userID = (Integer) session1.getAttribute("userId");

if(userID == null){

%>

<div class="empty">
    User not logged in
</div>

<%

} else {

Connection conn = DBConfig.getConnection();

PreparedStatement ps = conn.prepareStatement(
    "SELECT * FROM orders WHERE user_id = ? ORDER BY id DESC"
);

ps.setInt(1, userID);

ResultSet rs = ps.executeQuery();

boolean hasOrders = false;

%>

<table>

<tr>
    <th>Order ID</th>
    <th>Total Amount</th>
    <th>Status</th>
    <th>Order Date</th>
</tr>

<%

while(rs.next()){

hasOrders = true;

String status = rs.getString("status");

String statusClass = "";

if(status.equalsIgnoreCase("Pending")){
    statusClass = "pending";
}
else if(status.equalsIgnoreCase("Completed")){
    statusClass = "completed";
}
else{
    statusClass = "cancelled";
}

%>

<tr>

    <td>
        <%= rs.getInt("id") %>
    </td>

    <td>
        Rs. <%= rs.getDouble("total_amount") %>
    </td>

    <td class="<%= statusClass %>">
        <%= status %>
    </td>

    <td>
        <%= rs.getTimestamp("order_date") %>
    </td>

</tr>

<%
}

if(!hasOrders){
%>

</table>

<div class="empty" style="margin-top:20px;">
    No orders found
</div>

<%
}

conn.close();
}
%>

</div>

</body>
</html>