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
    align-items: center;
}

.navbar a {
    color: white;
    text-decoration: none;
    margin-right: 20px;
    font-weight: bold;
}

.navbar a:hover {
    color: #f4d6b0;
}

/* CONTAINER */
.container {
    padding: 20px 40px;
}

/* TITLE */
h2 {
    text-align: center;
    margin-bottom: 30px;
    color: #3e5c76;
    font-size: 32px;
}
/* SEARCH */
.search-container {
    text-align: center;
    margin-bottom: 30px;
}

.search-container input {
    width: 300px;
    padding: 10px;
    border-radius: 6px;
    border: 1px solid #ccc;
    font-size: 15px;
}

.search-container button {
    padding: 10px 16px;
    border: none;
    background: #3e5c76;
    color: white;
    border-radius: 6px;
    cursor: pointer;
    margin-left: 10px;
}

.search-container button:hover {
    background: #2f4858;
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
    border-radius: 12px;
    text-align: center;
    box-shadow: 0 4px 10px rgba(0,0,0,0.08);
    transition: 0.3s;
    position: relative;
}

.card:hover {
    transform: translateY(-5px);
}

/* SORT BAR */

.sort-bar {
    display: flex;
    justify-content: flex-end;
    margin-bottom: 25px;
}

.sort-bar select {
    padding: 10px 15px;
    border-radius: 8px;
    border: 1px solid #ccc;
    font-size: 14px;
    outline: none;
    background: white;
}

/* SALE BADGE */
.sale-badge {
    position: absolute;
    top: 12px;
    left: 12px;
    background: #e74c3c;
    color: white;
    padding: 5px 10px;
    border-radius: 5px;
    font-size: 12px;
    font-weight: bold;
}

/* OFFER TEXT */
.offer-text {
    color: #e67e22;
    font-weight: bold;
    margin: 6px 0;
    font-size: 14px;
}

/* IMAGE */
.card img {
    width: 100%;
    height: 220px;
    object-fit: cover;
    border-radius: 10px;
}

/* TEXT */
.card h3 {
    margin: 12px 0 8px;
    color: #333;
    font-size: 22px;
}

.card p {
    font-size: 14px;
    color: #555;
}

/* PRICE */
.price {
    color: #3e5c76;
    font-weight: bold;
    font-size: 22px;
}

.old-price {
    text-decoration: line-through;
    color: gray;
    font-size: 15px;
}

/* BUTTONS */
.btn {
    display: inline-block;
    margin-top: 12px;
    padding: 10px 16px;
    border-radius: 6px;
    text-decoration: none;
    color: white;
    background-color: #c19a6b;
    transition: 0.3s;
    font-weight: bold;
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

.edit:hover {
    background-color: #388e3c;
}

.delete {
    background-color: #e74c3c;
}

.delete:hover {
    background-color: #c0392b;
}

/* RESPONSIVE */
@media(max-width: 1000px) {
    .products {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media(max-width: 600px) {

    .products {
        grid-template-columns: 1fr;
    }

    .container {
        padding: 20px;
    }

    .navbar {
        flex-direction: column;
        gap: 10px;
    }
}
.details-btn {
    background-color: #3e5c76;
}

.details-btn:hover {
    background-color: #2f4858;
}

/* PAGINATION */

.pagination {
    margin-top: 40px;
    text-align: center;
}

.pagination a {
    display: inline-block;
    margin: 0 5px;
    padding: 10px 15px;
    background: white;
    color: #3e5c76;
    border-radius: 6px;
    text-decoration: none;
    font-weight: bold;
    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
}

.pagination a:hover {
    background: #3e5c76;
    color: white;
}

.active-page {
    background: #3e5c76 !important;
    color: white !important;
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
        <a href="<%= request.getContextPath() %>/pages/profile.jsp">
    Profile
</a>
    </div>

    <a href="<%= request.getContextPath() %>/logout">Logout</a>

<% } %>

</div>

<!-- MAIN -->
<div class="container">

<h2>Explore Handmade Products</h2>

<!-- SORT BAR -->

<div class="sort-bar">

    <form method="get">

        <select name="sort" onchange="this.form.submit()">

            <option value="">Sort Products</option>

            <option value="lowToHigh">
                Price: Low to High
            </option>

            <option value="highToLow">
                Price: High to Low
            </option>

            <option value="discount">
                Highest Discount
            </option>

            <option value="newest">
                Newest Products
            </option>

        </select>

    </form>

</div>

<!-- SEARCH BAR -->
<div class="search-container">

    <form method="get" action="products.jsp">

        <input type="text"
               name="search"
               placeholder="Search products..."
               value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">

        <button type="submit">Search</button>

    </form>

</div>

<div class="products">

<%
Connection conn = DBConfig.getConnection();

String search = request.getParameter("search");

String sort = request.getParameter("sort");

PreparedStatement ps;

ResultSet rs;

/* PAGINATION */

int productsPerPage = 8;

int currentPage = 1;

if(request.getParameter("page") != null) {

    currentPage = Integer.parseInt(
        request.getParameter("page")
    );
}

int start = (currentPage - 1) * productsPerPage;

String query = "SELECT * FROM products";

/* SEARCH */

if(search != null && !search.trim().isEmpty()) {

    query += " WHERE name LIKE ?";

}

/* SORTING */

if(sort != null) {

    switch(sort) {

        case "lowToHigh":
            query += " ORDER BY price ASC";
            break;

        case "highToLow":
            query += " ORDER BY price DESC";
            break;

        case "discount":
            query += " ORDER BY discount DESC";
            break;

        case "newest":
            query += " ORDER BY id DESC";
            break;
    }
}

query += " LIMIT ?, ?";

ps = conn.prepareStatement(query);

int paramIndex = 1;

/* SEARCH */

if(search != null && !search.trim().isEmpty()) {

    ps.setString(paramIndex++, "%" + search + "%");

}

/* PAGINATION */

ps.setInt(paramIndex++, start);

ps.setInt(paramIndex, productsPerPage);

rs = ps.executeQuery();

/* TOTAL PRODUCTS */

PreparedStatement countPs = conn.prepareStatement(
    "SELECT COUNT(*) FROM products"
);

ResultSet countRs = countPs.executeQuery();

int totalProducts = 0;

if(countRs.next()) {

    totalProducts = countRs.getInt(1);

}

int totalPages = (int)Math.ceil(
    (double) totalProducts / productsPerPage
);




while(rs.next()) {

    double price = rs.getDouble("price");

    int discount = rs.getInt("discount");

    String offerText = rs.getString("offer_text");

    double finalPrice = price - (price * discount / 100);
%>

<div class="card">

    <!-- SALE BADGE -->
    <% if(discount > 0) { %>

        <div class="sale-badge">
            <%= discount %>% OFF
        </div>

    <% } %>

    <!-- IMAGE -->
    <img 
        src="<%= request.getContextPath() %>/uploads/<%= rs.getString("image") %>"
        onerror="this.src='https://via.placeholder.com/250x220'">

    <!-- PRODUCT NAME -->
    <h3><%= rs.getString("name") %></h3>

    <!-- OFFER TEXT -->
    <% if(offerText != null && !offerText.isEmpty()) { %>

        <p class="offer-text">
            <%= offerText %>
        </p>

    <% } %>

    <!-- PRICE -->
    <p>

    <% if(discount > 0) { %>

        <span class="old-price">
            Rs. <%= price %>
        </span>

        <br>

        <span class="price" style="color: green;">
            Rs. <%= finalPrice %>
        </span>

    <% } else { %>

        <span class="price">
            Rs. <%= price %>
        </span>

    <% } %>

    </p>

    <!-- DESCRIPTION -->
    <p><%= rs.getString("description") %></p>

<% if ("admin".equalsIgnoreCase(role)) { %>

    <!-- ADMIN ACTIONS -->
    <div class="card-actions">

        <a class="btn edit"
           href="editProduct.jsp?id=<%= rs.getInt("id") %>">
           Edit
        </a>

        <a class="btn delete"
           href="<%= request.getContextPath() %>/deleteProduct?id=<%= rs.getInt("id") %>"
           onclick="return confirm('Delete this product?');">
           Delete
        </a>

    </div>
    


<% } else { %>

    <!-- USER ACTION -->
    <a class="btn"
       href="<%= request.getContextPath() %>/addToCart?id=<%= rs.getInt("id") %>">
       Add to Cart
    </a>

<br><br>

<a class="btn details-btn"
   href="productDetails.jsp?id=<%= rs.getInt("id") %>">
    View Details
</a>

<% } %>

</div>

<%
}

conn.close();
%>

</div>

   <!-- PAGINATION -->

<div class="pagination">

<%
for(int i = 1; i <= totalPages; i++) {
%>

    <a class="<%= (i == currentPage) ? "active-page" : "" %>"
       href="products.jsp?page=<%= i %>">

        <%= i %>

    </a>

<%
}
%>

</div>

</div>

</body>
</html>