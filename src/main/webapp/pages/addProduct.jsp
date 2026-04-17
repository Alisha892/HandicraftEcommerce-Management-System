<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<h2>Add Product</h2>


<form action="<%= request.getContextPath() %>/addProduct" 
      method="post" 
      enctype="multipart/form-data">

    <input type="text" name="name" placeholder="Product Name" required>
    <input type="number" name="price" placeholder="Price" required>
    <textarea name="description" placeholder="Description"></textarea>

    <input type="file" name="image" required>

    <button type="submit">Add Product</button>
</form>

</body>
</html>