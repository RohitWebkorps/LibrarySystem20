<html>
<head>
<link rel="stylesheet" href="ExternalCS4.css">
</head>
<body>
<%
Integer membershipNo=(Integer)session.getAttribute("membershipno");
if(membershipNo==null)
{
	response.sendRedirect("StudentLogin.jsp");
}
%>
<ul>
  <li><a href="StudentHome.jsp">Home</a></li>
  <li><a href="ViewBooksStudent.jsp">View books</a></li>
  <li><a href="IssuebookforStudent.jsp">Issue Book</a></li>
  <li><a href="ParticularStudentIssueBook.jsp">Issued books</a></li>
  <li><a href="RenewBook.jsp">Renew Book</a></li>
  <li><a href="ReturnBook.jsp">Return book</a></li>
  <li><a href="SearchBookforStudent.jsp">Search Book</a></li>
  <li><a href="logout?from=student">Logout</a></li>
</ul>

</body>
</html>