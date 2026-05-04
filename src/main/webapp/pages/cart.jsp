<%@ page import="java.util.*, java.sql.*" %>
<%@ page import="com.handicraft.config.DBConfig" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Cart</title>

<style>

body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: #f5efe7;
}

.navbar {
    background: #3e5c76;
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

.container {
    width: 80%;
    margin: 40px auto;
}

h2 {
    text-align: center;
}

table {
    width: 100%;
    border-collapse: collapse;
    background: white;
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
    border-bottom: 1px solid #eee;
}

img {
    width: 60px;
    height: 60px;
    object-fit: cover;
    border-radius: 8px;
}

.btn {
    padding: 6px 10px;
    border-radius: 6px;
    border: none;
    color: white;
    cursor: pointer;
}

.plus { background: #4CAF50; }
.minus { background: #e74c3c; }
.remove { background: #555; text-decoration: none; }

.total {
    text-align: right;
    margin-top: 20px;
    font-size: 20px;
    font-weight: bold;
}

.checkout {
    display: block;
    margin-left: auto;
    margin-top: 10px;
    padding: 10px 20px;
    background: #c69c6d;
    color: white;
    border-radius: 8px;
    text-decoration: none;
}

</style>
</head>

<body>

<div class="navbar">
    <div>
        <a href="products.jsp">Products</a>
    </div>
    <a href="<%= request.getContextPath() %>/logout">Logout</a>
</div>

<div class="container">

<h2>Your Cart</h2>

<table>
<tr>
    <th>Image</th>
    <th>Name</th>
    <th>Price</th>
    <th>Quantity</th>
    <th>Action</th>
</tr>

<%
Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");

double total = 0;

if (cart != null && !cart.isEmpty()) {

    Connection conn = DBConfig.getConnection();

    for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {

        int productId = entry.getKey();
        int quantity = entry.getValue();

        PreparedStatement ps = conn.prepareStatement("SELECT * FROM products WHERE id=?");
        ps.setInt(1, productId);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {

            String name = rs.getString("name");
            double price = rs.getDouble("price");
            String image = rs.getString("image");

            total += price * quantity;
%>

<tr>

<td>
    <img src="<%= request.getContextPath() %>/uploads/<%= image %>"
         onerror="this.src='https://via.placeholder.com/60'">
</td>

<td><%= name %></td>

<td>Rs. <%= price %></td>

<td>
    <form action="<%= request.getContextPath() %>/updateCart" method="post" style="display:flex; justify-content:center; gap:5px;">

        <input type="hidden" name="id" value="<%= productId %>">

        <button class="btn minus" type="submit" name="quantity" value="<%= quantity - 1 %>">-</button>

        <span><%= quantity %></span>

        <button class="btn plus" type="submit" name="quantity" value="<%= quantity + 1 %>">+</button>

    </form>
</td>

<td>
    <a class="btn remove"
       href="<%= request.getContextPath() %>/removeFromCart?id=<%= productId %>">
       Remove
    </a>
</td>

</tr>

<%
        }
    }
} else {
%>

<tr>
    <td colspan="5">Your cart is empty</td>
</tr>

<%
}
%>

</table>

<div class="total">
    Total: Rs. <%= total %>
</div>

<a href="<%= request.getContextPath() %>/checkout" class="checkout">
    Checkout
</a>

</div>

</body>
</html>