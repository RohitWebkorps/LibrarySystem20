

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="ExternalCS4.css">
<meta charset="UTF-8">
<title>Admin Home</title>

</head>
<body>
<%


%>
<center><h1>Welcome Admin</h1></center>
<%@ include file="Navbar.jsp"%>
<div id="outerbox">
<div id="innerbox">
<h1>Add a Book</h1>
<h2>You can add Books to your database.</h2>
<button onclick='window.open("Addbook.jsp") ' id="btn-home">Click</button>
</div>
<div id="innerbox">
<h1>View Books</h1>
<h2>You can View Books from here.</h2>
<button onclick='window.open("ViewBooks.jsp") ' id="btn-home">Click</button>
</div>
<div id="innerbox">
<h1>Issued Books</h1>
<h2>Click to see All the issued Books.</h2>
<button onclick='window.open("IssuedBookStudent.jsp") ' id="btn-home">Click</button>
</div>
<div id="innerbox">
<h1>Update Books</h1>
<h2>To Update any book click here.</h2>
<button onclick='window.open("UpdateBook.jsp") ' id="btn-home">Click</button>
</div>
<div id="innerbox">
<h1>Delete Books</h1>
<h2>Click here to Delete books from the database.</h2>
<button onclick='window.open("Deletebook.jsp") ' id="btn-home">Click</button>
</div>
</div>
</body>
</html>