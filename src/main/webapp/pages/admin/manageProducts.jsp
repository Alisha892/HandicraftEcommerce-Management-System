<%@ page import="java.sql.*" %>
<%@ page import="com.handicraft.config.DBConfig" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Products</title>

<style>
body {
    font-family: 'Segoe UI', sans-serif;
    background: #f5f1eb;
    margin: 0;
}

/* NAVBAR */
.navbar {
    display: flex;
    justify-content: space-between;
    padding: 20px 60px;
    background: #ffffff;
    border-bottom: 1px solid #eee;
}

.logo {
    font-size: 22px;
    font-weight: bold;
    color: #a67c52;
}

.logout {
    text-decoration: none;
    color: #333;
}

/* TITLE */
h2 {
    text-align: center;
    margin: 30px 0;
}

/* TABLE CONTAINER */
.table-container {
    width: 90%;
    margin: auto;
    background: white;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
}

/* TABLE */
table {
    width: 100%;
    border-collapse: collapse;
}

/* HEADER */
th {
    background: #a67c52;
    color: white;
    padding: 12px;
    text-align: center;
}

/* ROWS */
td {
    padding: 12px;
    text-align: center;
    border-bottom: 1px solid #eee;
}

/* IMAGE */
td img {
    width: 80px;
    height: 80px;
    object-fit: cover;
    border-radius: 8px;
}

/* BUTTONS */
/* FIX BUTTON SIZE ISSUE */
.edit, .delete {
    display: inline-block;
    padding: 6px 14px;
    font-size: 14px;
    border-radius: 5px;
    text-decoration: none;
    border: none;
    cursor: pointer;
}

/* EDIT BUTTON */
.edit {
    background: #2e7d32;
    color: white;
    margin-right: 6px;
}

/* DELETE BUTTON */
.delete {
    background: #d32f2f;
    color: white;
}

/* HOVER EFFECT */
.edit:hover {
    background: #1b5e20;
}

.delete:hover {
    background: #b71c1c;
}
button.edit {
    line-height: normal;
}
/* HOVER */
.edit:hover {
    background: #1b5e20;
}

.delete:hover {
    background: #b71c1c;
}
</style>

</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="logo">Admin Panel</div>
    <a href="../login.jsp" class="logout">Logout</a>
</div>

<h2>Manage Products</h2>

<div class="table-container">
<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Description</th>
        <th>Image</th>
        <th>Actions</th>
    </tr>

<%
    try {
        Connection conn = DBConfig.getConnection();
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM products");

        while(rs.next()) {
%>

<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("name") %></td>
    <td>Rs. <%= rs.getDouble("price") %></td>
    <td><%= rs.getString("description") %></td>

    <td>
        <img src="<%= request.getContextPath() %>/uploads/<%= rs.getString("image") %>" />
    </td>

    <td>

        <!-- EDIT -->
        <form action="editProduct.jsp" method="get" style="display:inline;">
            <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
            <button class="edit">Edit</button>
        </form>

        <!-- DELETE -->
        <a href="<%= request.getContextPath() %>/DeleteProductServlet?id=<%= rs.getInt("id") %>"
           onclick="return confirm('Are you sure you want to delete this product?')"
           class="delete">
           Delete
        </a>

    </td>
</tr>

<%
        }

        conn.close();
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

</table>
</div>

</body>
</html>