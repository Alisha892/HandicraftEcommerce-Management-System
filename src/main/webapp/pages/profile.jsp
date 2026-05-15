<%@ page import="java.sql.*" %>
<%@ page import="com.handicraft.config.DBConfig" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>

<style>

body{
    margin:0;
    font-family:Arial;
    background:#f4efe9;
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

/* MAIN */
.container{
    width:80%;
    margin:50px auto;
}

/* PROFILE CARD */
.profile-card{
    background:white;
    padding:40px;
    border-radius:12px;
    box-shadow:0 4px 10px rgba(0,0,0,0.1);
    max-width:500px;
    margin:auto;
    text-align:center;
}

/* PROFILE ICON */
.profile-icon{
    width:100px;
    height:100px;
    background:#c19a6b;
    border-radius:50%;
    margin:auto;
    margin-bottom:20px;
}

/* TEXT */
.profile-card h2{
    margin-bottom:10px;
}

.info{
    margin:15px 0;
    font-size:18px;
}

/* ORDER BOX */
.orders-box{
    background:#f7f7f7;
    padding:15px;
    border-radius:8px;
    margin-top:20px;
}

/* BUTTON */
.btn{
    display:inline-block;
    margin-top:25px;
    padding:12px 20px;
    background:#c19a6b;
    color:white;
    text-decoration:none;
    border-radius:6px;
}

.btn:hover{
    background:#a67c52;
}

</style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">

<div>

    <a href="<%= request.getContextPath() %>/pages/products.jsp">
        Products
    </a>

    <a href="<%= request.getContextPath() %>/pages/cart.jsp">
        Cart
    </a>

    <a href="<%= request.getContextPath() %>/pages/viewOrders.jsp">
        My Orders
    </a>
<a href="<%=request.getContextPath()%>/pages/about.jsp">About</a>

<a href="<%=request.getContextPath()%>/pages/contact.jsp">Contact</a>
</div>

<div>

    <a href="<%= request.getContextPath() %>/logout">
        Logout
    </a>

</div>

</div>

<div class="container">

<%

Integer userId = (Integer) session.getAttribute("userId");

if(userId == null){

    response.sendRedirect("login.jsp");
    return;
}

Connection conn = DBConfig.getConnection();

/* GET USER INFO */
PreparedStatement ps = conn.prepareStatement(
    "SELECT * FROM users WHERE id=?"
);

ps.setInt(1,userId);

ResultSet rs = ps.executeQuery();

/* GET TOTAL ORDERS */
PreparedStatement orderPs = conn.prepareStatement(
    "SELECT COUNT(*) FROM orders WHERE user_id=?"
);

orderPs.setInt(1,userId);

ResultSet orderRs = orderPs.executeQuery();

int totalOrders = 0;

if(orderRs.next()){

    totalOrders = orderRs.getInt(1);
}

if(rs.next()){

%>

<div class="profile-card">

<div class="profile-icon"></div>

<h2>
    <%= rs.getString("name") %>
</h2>

<div class="info">
     <%= rs.getString("email") %>
</div>

<div class="orders-box">

<h3>Total Orders</h3>

<p>
    <%= totalOrders %>
</p>

</div>

<a class="btn"
href="<%= request.getContextPath() %>/pages/products.jsp">

Continue Shopping

</a>

</div>

<%
}
conn.close();
%>

</div>

</body>
</html>