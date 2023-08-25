<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="ExternalCS4.css">
<meta charset="ISO-8859-1">
<%@ include file="Navbar.jsp"%>
<title>Add Books</title>
</head>
<body>

<center>
<div id="addbooks">
	<table>
    <form action="AddBookInDatabase" >
		<tr><td colspan="2"><center><h1>Add Books</h1></center></td></tr>
	<tr><td><h4>Enter Book Name</h4></td><td><input type="text" name="bookname"></td></tr>
	<tr><td><h4>Enter Book Auhtor</h4></td><td><input type="text" name="author"></td></tr>
	<tr><td><h4>Enter Edition </h4></td><td><input type="text" name="edition"></td></tr>
	<tr><td><h4>Enter Quantity</h4></td><td><input type="text" name="quantity"></td></tr>
	<tr><td><input type="submit" value="Submit" id="btn-home"></td></tr>
	</form>
	</table>
</div>
</center>
</body>
</html>