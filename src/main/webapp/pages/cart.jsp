<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.handicraft.config.DBConfig" %>

<!DOCTYPE html>
<html>
<head>
    <title>Your Cart</title>

    <!-- CSS LINK -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>

<body>
<div class="navbar">

<a href="<%= request.getContextPath() %>/pages/products.jsp">Home</a>

<a href="<%= request.getContextPath() %>/pages/products.jsp">Products</a>

<a href="<%= request.getContextPath() %>/pages/cart.jsp">Cart</a>

<a href="<%= request.getContextPath() %>/pages/viewOrders.jsp">My Orders</a>

<a href="<%= request.getContextPath() %>/logout">Logout</a>

</div>

<div class="container">

<h2>Your Cart</h2>

<table>
<tr>
    <th>Name</th>
    <th>Price</th>
    <th>Action</th>
</tr>

<%
List<Integer> cart = (List<Integer>) session.getAttribute("cart");

double total = 0;

if (cart != null && !cart.isEmpty()) {

    Connection conn = DBConfig.getConnection();

    for (int id : cart) {
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM products WHERE id=?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            double price = rs.getDouble("price");
            total += price;
%>

<tr>
    <td><%= rs.getString("name") %></td>
    <td>Rs. <%= price %></td>
    <td>
        <a href="<%= request.getContextPath() %>/removeFromCart?id=<%= id %>">
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
    <td colspan="3">Your cart is empty</td>
</tr>

<%
}
%>

</table>

<br>

<h3>Total: Rs. <%= total %></h3>

<br>

<a href="<%= request.getContextPath() %>/checkout">
    <%
boolean isEmpty = (cart == null || cart.isEmpty());
%>

<button 
    onclick="location.href='<%= request.getContextPath() %>/checkout'" 
    <%= isEmpty ? "disabled" : "" %>>
    Checkout
</button>
</a>

</div>

</body>
</html>