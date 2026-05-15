<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>

<style>

body{
    margin:0;
    font-family:Arial,sans-serif;
    background:#f5f1eb;
}

.navbar{
    background:#3e5c76;
    padding:15px 40px;
}

.navbar a{
    color:white;
    text-decoration:none;
    margin-right:25px;
    font-weight:bold;
}

.container{

    width:60%;
    margin:40px auto;
    background:white;
    padding:40px;
    border-radius:15px;
    box-shadow:0 4px 10px rgba(0,0,0,0.1);

}

input,
textarea{

width:100%;
padding:12px;
margin:10px 0;
border:1px solid #ccc;
border-radius:8px;

}

button{

padding:12px 25px;
background:#c19a6b;
border:none;
color:white;
border-radius:8px;
cursor:pointer;

}

button:hover{

background:#a67c52;

}

</style>

</head>

<body>

<div class="navbar">

<a href="<%=request.getContextPath()%>/pages/products.jsp">Home</a>

<a href="<%=request.getContextPath()%>/pages/about.jsp">About</a>

<a href="<%=request.getContextPath()%>/pages/contact.jsp">Contact</a>

<a href="<%=request.getContextPath()%>/logout">Logout</a>

</div>

<div class="container">

<h1>Contact Us</h1>

<p>Email: support@handicraft.com</p>

<p>Phone: +977-9800000000</p>

<p>Address: Kathmandu, Nepal</p>

<form id="contactForm">

<input
type="text"
placeholder="Enter your name"
required>

<input
type="email"
placeholder="Enter your email"
required>

<textarea
rows="5"
placeholder="Write your message"
required></textarea>

<button type="submit">

Send Message

</button>

</form>


<script>

document.getElementById(
"contactForm"
).addEventListener(
"submit",
function(e){

e.preventDefault();

alert(
"Message sent successfully!"
);

this.reset();

}
);

</script>

</div>

</body>
</html>