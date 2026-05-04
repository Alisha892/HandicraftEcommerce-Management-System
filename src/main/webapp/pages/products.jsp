<%@ page import="java.sql.*" %>
<%@ page import="com.handicraft.config.DBConfig" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>

<style>

/* BODY */
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #f4efe9;
}

/* NAVBAR */
.navbar {
    background-color: #3e5c76;
    padding: 15px 40px;
    display: flex;
    justify-content: space-between;
}

.navbar a {
    color: white;
    text-decoration: none;
    margin-right: 20px;
    font-weight: bold;
}

/* CONTAINER */
.container {
    padding: 20px 40px;
}

/* TITLE */
h2 {
    text-align: center;
    margin-bottom: 30px;
}

/* GRID */
.products {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 25px;
}

/* CARD */
.card {
    background: white;
    padding: 15px;
    border-radius: 10px;
    text-align: center;
    box-shadow: 0 4px 10px rgba(0,0,0,0.08);
    transition: 0.3s;
}

.card:hover {
    transform: translateY(-5px);
}

/* IMAGE */
.card img {
    width: 100%;
    height: 180px;
    object-fit: cover;
    border-radius: 8px;
}

/* TEXT */
.card h3 {
    margin: 10px 0;
}

.price {
    color: #3e5c76;
    font-weight: bold;
}

.card p {
    font-size: 14px;
    color: #555;
}

/* BUTTONS */
.btn {
    display: inline-block;
    margin-top: 10px;
    padding: 8px 12px;
    border-radius: 5px;
    text-decoration: none;
    color: white;
    background-color: #c19a6b;
}

.btn:hover {
    background-color: #a67c52;
}

.card-actions {
    margin-top: 10px;
}

.edit {
    background-color: #4CAF50;
}

.delete {
    background-color: #e74c3c;
}

</style>
</head>

<body>

<%
String role = (String) session.getAttribute("role");
%>

<!-- NAVBAR -->
<div class="navbar">

<% if ("admin".equalsIgnoreCase(role)) { %>

    <!-- ADMIN NAVBAR -->
    <div>
        <a href="<%= request.getContextPath() %>/pages/admin/dashboard.jsp">Dashboard</a>
        <a href="<%= request.getContextPath() %>/pages/products.jsp">Products</a>
    </div>
    <a href="<%= request.getContextPath() %>/logout">Logout</a>

<% } else { %>

    <!-- USER NAVBAR -->
    <div>
        <a href="<%= request.getContextPath() %>/pages/products.jsp">Home</a>
        <a href="<%= request.getContextPath() %>/pages/cart.jsp">Cart</a>
        <a href="<%= request.getContextPath() %>/pages/viewOrders.jsp">My Orders</a>
    </div>
    <a href="<%= request.getContextPath() %>/logout">Logout</a>

<% } %>

</div>

<!-- MAIN -->
<div class="container">

<h2>Explore Handmade Products</h2>

<div class="products">

<%
Connection conn = DBConfig.getConnection();
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM products");

while(rs.next()) {
%>

<div class="card">

    <!-- IMAGE -->
    <img 
        src="<%= request.getContextPath() %>/uploads/<%= rs.getString("image") %>" 
        onerror="this.src='https://via.placeholder.com/250x180'">

    <!-- INFO -->
    <h3><%= rs.getString("name") %></h3>

    <p class="price">Rs. <%= rs.getDouble("price") %></p>

    <p><%= rs.getString("description") %></p>

<% if ("admin".equalsIgnoreCase(role)) { %>

    <!-- ADMIN BUTTONS -->
    <div class="card-actions">
        <a class="btn edit" href="editProduct.jsp?id=<%= rs.getInt("id") %>">Edit</a>

        <a class="btn delete" 
           href="<%= request.getContextPath() %>/deleteProduct?id=<%= rs.getInt("id") %>"
           onclick="return confirm('Delete this product?');">
           Delete
        </a>
    </div>

<% } else { %>

    <!-- USER BUTTON -->
    <a class="btn" 
       href="<%= request.getContextPath() %>/addToCart?id=<%= rs.getInt("id") %>">
        Add to Cart
    </a>

<% } %>

</div>

<%
}
%>

</div>

</div>

</body>
</html>