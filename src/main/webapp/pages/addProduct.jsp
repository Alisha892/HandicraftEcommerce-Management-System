<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>

<style>
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: #f5f1eb;
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

/* CONTAINER */
.container {
    display: flex;
    justify-content: center;
    margin-top: 60px;
}

/* CARD */
.card {
    background: white;
    padding: 40px;
    border-radius: 12px;
    width: 500px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.08);
}

/* TITLE */
.card h2 {
    text-align: center;
    margin-bottom: 30px;
}

/* INPUTS */
input, textarea {
    width: 100%;
    padding: 12px;
    margin: 10px 0;
    border-radius: 6px;
    border: 1px solid #ccc;
    font-size: 14px;
}

/* FILE INPUT */
input[type="file"] {
    padding: 8px;
    background: #fafafa;
}

/* BUTTON */
button {
    width: 100%;
    padding: 12px;
    background: #a67c52;
    color: white;
    border: none;
    border-radius: 6px;
    margin-top: 15px;
    cursor: pointer;
    font-size: 15px;
}

button:hover {
    background: #8c6239;
}
</style>

</head>

<body>

<div class="navbar">
    <div class="logo">Admin Panel</div>
    <a href="<%= request.getContextPath() %>/logout">
    Logout
</a>
</div>

<div class="container">
    <div class="card">

        <h2>Add New Product</h2>

        <form action="<%= request.getContextPath() %>/AddProductServlet" 
      method="post" 
      enctype="multipart/form-data">

            <input type="text" name="name" placeholder="Product Name" required>

            <input type="number" name="price" placeholder="Price" required>
            
            <input type="number" name="discount" placeholder="Discount %" value="0">

			<input type="text" name="offerText" placeholder="Offer Text (Example: Festival Offer)">

            <textarea name="description" placeholder="Description" rows="4" required></textarea>

            <input type="file" name="image" required>

            <button type="submit">Add Product</button>

        </form>

    </div>
</div>

</body>
</html>