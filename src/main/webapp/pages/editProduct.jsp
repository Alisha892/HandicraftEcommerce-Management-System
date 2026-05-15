<%@ page import="java.sql.*" %>
<%@ page import="com.handicraft.config.DBConfig" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
int id = Integer.parseInt(request.getParameter("id"));

Connection conn = DBConfig.getConnection();

PreparedStatement ps =
conn.prepareStatement(
"SELECT * FROM products WHERE id=?");

ps.setInt(1,id);

ResultSet rs=ps.executeQuery();

rs.next();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product</title>

<style>

body{
margin:0;
font-family:Arial,sans-serif;
background:#f4efe9;
}

.navbar{
background:#3e5c76;
padding:15px 40px;
display:flex;
justify-content:space-between;
color:white;
}

.navbar a{
color:white;
text-decoration:none;
}

.container{
display:flex;
justify-content:center;
align-items:center;
padding:40px;
}

.form-box{

background:white;
width:450px;
padding:30px;
border-radius:10px;
box-shadow:0 0 15px rgba(0,0,0,.1);

}

h2{
text-align:center;
margin-bottom:20px;
}

input,textarea{

width:100%;
padding:12px;
margin-bottom:15px;
border:1px solid #ccc;
border-radius:5px;

}

textarea{
height:80px;
resize:none;
}

.btn{

width:100%;
padding:12px;
background:#c19a6b;
color:white;
border:none;
border-radius:5px;
cursor:pointer;

}

.btn:hover{

background:#a67c52;

}

</style>
</head>

<body>

<div class="navbar">
<div>Edit Product</div>
<a href="manageProducts.jsp">Back</a>
</div>

<div class="container">

<div class="form-box">

<h2>Update Product</h2>

<form action="<%=request.getContextPath()%>/editProduct"
method="post">

<input type="hidden"
name="id"
value="<%=id%>">


<input
type="text"
name="name"
value="<%=rs.getString("name")%>"
required>


<input
type="number"
name="price"
value="<%=rs.getDouble("price")%>"
required>


<input
type="number"
name="stock"
value="<%=rs.getInt("stock")%>"
placeholder="Stock Quantity"
required>


<input
type="number"
name="discount"
value="<%=rs.getInt("discount")%>"
placeholder="Discount"
required>


<input
type="text"
name="offerText"
value="<%=rs.getString("offer_text")%>"
placeholder="Offer Text">


<input
type="text"
name="category"
value="<%=rs.getString("category")%>"
placeholder="Category">


<textarea
name="description"
required><%=rs.getString("description")%></textarea>


<button
type="submit"
class="btn">

Update Product

</button>

</form>

</div>

</div>

</body>
</html>