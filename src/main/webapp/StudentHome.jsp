

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="ExternalCS4.css">
<meta charset="UTF-8">
<title>Student Home</title>
<%@include file="StudentNavbar.jsp" %>
</head>
<body>
<center><h1>Welcome Student</h1></center>
<div id="outerbox">
<div id="innerbox">
<h1>Issued Books</h1>

<h2>See the books that you have issued.</h2>
<button onclick='window.open("ParticularStudentIssueBook.jsp") ' id="btn-home">Click</button>
</div>
<div id="innerbox">
<h1>Issue Books</h1>

<h2>Want books click here.</h2>
<button id="btn-home" onclick='window.open("IssuebookforStudent.jsp") '>Click</button>
</div>
<div id="innerbox">
<h1>Renew Book</h1>
<h2>Click to Renew books.</h2>
<button id="btn-home" onclick='window.open("RenewBook.jsp")' >Click</button>
</div>
<div id="innerbox">
<h1>Return</h1>
<h2>Click here to return your books.</h2>
<button id="btn-home" onclick='window.open("ReturnBook.jsp")'>Click</button>
</div>
</div>
</body>
</html>