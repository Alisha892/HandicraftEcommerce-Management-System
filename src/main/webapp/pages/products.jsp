<%@ page import="java.sql.*" %>
<%@ page import="com.handicraft.config.DBConfig" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Products</title>

    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

    <style>
        .products {
            display: flex;
            flex-wrap: wrap;
            gap: 25px;
            justify-content: center;
            margin-top: 30px;
        }

        .card {
            width: 250px;
            background: white;
            border-radius: 12px;
            padding: 15px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            transition: 0.3s;
            text-align: center;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card img {
            width: 100%;
            height: 150px;
            border-radius: 8px;
            object-fit: cover;
        }

        .price {
            color: #2a6fb0;
            font-weight: bold;
            margin: 10px 0;
        }

        .btn {
            display: inline-block;
            padding: 8px 12px;
            background: #2a6fb0;
            color: white;
            border-radius: 6px;
            text-decoration: none;
            margin-top: 10px;
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

<!-- NAVBAR -->
<div class="navbar">
    <a href="#">Home</a>
    <a href="cart.jsp">Cart</a>
    <a href="viewOrders.jsp">My Orders</a>
    <a href="<%= request.getContextPath() %>/logout">Logout</a>
</div>
<%
String role = (String) session.getAttribute("role");
%>
<h2>Explore Products</h2>

<div class="products">

<%
Connection conn = DBConfig.getConnection();
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM products");

while(rs.next()) {
%>

<div class="card">

   
   <img src="<%= request.getContextPath() %>/uploads/<%= rs.getString("image") %>" alt="product">

    <h3><%= rs.getString("name") %></h3>

    <p class="price">Rs. <%= rs.getDouble("price") %></p>

    <p><%= rs.getString("description") %></p>

<%
if ("admin".equals(role)) {
%>

    <a class="btn" href="editProduct.jsp?id=<%= rs.getInt("id") %>">Edit</a>

    <a class="btn" href="<%= request.getContextPath() %>/deleteProduct?id=<%= rs.getInt("id") %>">Delete</a>

<%
} else {
%>

    <a class="btn" href="<%= request.getContextPath() %>/addToCart?id=<%= rs.getInt("id") %>">
        Add to Cart
    </a>

<%
}
%>

</div>

<%
}
%>

</div>

</body>
</html>