
<html>
<head>
<link rel="stylesheet" href="ExternalCS4.css">
</head>
<body>
<%
Integer membershipNo=(Integer)session.getAttribute("membershipNo");
if(membershipNo==null)
{
	response.sendRedirect("LoginAdmin.jsp");
}
%>
<ul>
 <li> <a href="AdminHome.jsp">Home</a></li>
  <li><a href="ViewBooks.jsp">View books</a></li>
  <li><a href="UpdateBook.jsp">Update Books</a></li>
 <li> <a href="Addbook.jsp">Add books</a></li>
<li>  <a href="Deletebook.jsp">Delete books</a></li>
<li>  <a href="AdminIssuedBook.jsp">Issued books</a></li>
  <li><a href="SearchBook.jsp">Searbook</a></li>
  <li><a href="logout?from=admin">Logout</a></li>
</ul>

</body>
</html>