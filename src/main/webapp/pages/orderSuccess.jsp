<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Success</title>

<style>
body {
    font-family: 'Segoe UI', sans-serif;
    background: #f5efe7;
    text-align: center;
    padding-top: 100px;
}

.box {
    background: white;
    padding: 40px;
    border-radius: 12px;
    width: 400px;
    margin: auto;
    box-shadow: 0 6px 20px rgba(0,0,0,0.1);
}

h2 {
    color: green;
}

.btn {
    display: inline-block;
    margin-top: 20px;
    padding: 10px 20px;
    background: #3e5c76;
    color: white;
    text-decoration: none;
    border-radius: 8px;
}
</style>
</head>

<body>

<div class="box">
    <h2>Order Placed Successfully!</h2>
    <p>Thank you for your purchase.</p>

    <a href="products.jsp" class="btn">Continue Shopping</a>
</div>

</body>
</html>