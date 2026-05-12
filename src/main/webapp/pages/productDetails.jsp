<%@ page import="java.sql.*" %>
<%@ page import="com.handicraft.config.DBConfig" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Details</title>

<style>

body{
    font-family: Arial;
    background:#f4efe9;
    margin:0;
}

.container{
    width:80%;
    margin:50px auto;
}

.card{
    background:white;
    padding:30px;
    border-radius:12px;
    display:flex;
    gap:40px;
    box-shadow:0 4px 10px rgba(0,0,0,0.1);
}

.card img{
    width:400px;
    height:400px;
    object-fit:cover;
    border-radius:10px;
}

.info{
    flex:1;
}

.price{
    font-size:28px;
    color:#3e5c76;
    font-weight:bold;
}

.old-price{
    text-decoration:line-through;
    color:red;
}

.offer{
    background:#ffefc2;
    padding:10px;
    border-radius:6px;
    margin:15px 0;
}

.btn{
    display:inline-block;
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

<div class="container">

<%

int id = Integer.parseInt(request.getParameter("id"));

Connection conn = DBConfig.getConnection();

PreparedStatement ps = conn.prepareStatement(
    "SELECT * FROM products WHERE id=?"
);

ps.setInt(1,id);

ResultSet rs = ps.executeQuery();

if(rs.next()) {

double price = rs.getDouble("price");

int discount = rs.getInt("discount");

double finalPrice = price - (price * discount / 100);

%>

<div class="card">

<img src="<%= request.getContextPath() %>/uploads/<%= rs.getString("image") %>">

<div class="info">

<h1><%= rs.getString("name") %></h1>

<% if(discount > 0){ %>

<p class="old-price">
Rs. <%= price %>
</p>

<p class="price">
Rs. <%= finalPrice %>
</p>

<% } else { %>

<p class="price">
Rs. <%= price %>
</p>

<% } %>

<p>
<%= rs.getString("description") %>
</p>

<% if(rs.getString("offer_text") != null){ %>

<div class="offer">
🎉 <%= rs.getString("offer_text") %>
</div>

<% } %>

<br>

<a class="btn"
href="<%= request.getContextPath() %>/addToCart?id=<%= rs.getInt("id") %>">

Add To Cart

</a>

</div>

</div>

<%
}
%>

</div>

</body>
</html>