<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
<title>Checkout</title>

<style>
body { font-family:Segoe UI; background:#f5efe7; }

.box {
    background:white;
    width:400px;
    margin:100px auto;
    padding:30px;
    border-radius:10px;
    text-align:center;
}

.btn {
    padding:10px 20px;
    background:#3e5c76;
    color:white;
    border:none;
    margin-top:15px;
}
</style>
</head>

<body>

<div class="box">
<h2>Select Payment Method</h2>

<form action="<%= request.getContextPath() %>/payment" method="post">

<select name="method">
<option>Cash on Delivery</option>
<option>UPI</option>
<option>Credit Card</option>
</select>

<br>
<button class="btn">Place Order</button>

</form>
</div>

</body>
</html>