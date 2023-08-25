<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@page import="DatabaseOperations.*" %>
    <%@page import="Entities.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="ExternalCS4.css">
<meta charset="ISO-8859-1">
<title>Update book</title>
<%@ include file="Navbar.jsp"%>

</head>
<body>
<center>
<div id="addbooks">
<form>
<h3> Enter Book Id - <input type="text" name="bookId"></h3>
<center><input type="submit" id="btn-home"></center>
</form>
</div>
</center>

 <%
	int bookid=0;
String bookids=request.getParameter("bookId");
if(!(bookids==null) && (!bookids.isEmpty()))
{
	try{
		
bookid=Integer.parseInt(bookids);
	}
	catch(Exception e)
	{
		{%>
		<center><h1>Book Id should be Number</h1></center>
	    <%}
	}
    DatabaseOperationsClass op=new DatabaseOperationsClass();
    
		if(op.isbookPresent(bookid))
		{
			Book book=op.getBook(bookid);
			String bookName=book.getBookName();
			String author=book.getAuthor();
			String edition=book.getEdition();
			String quantity=book.getQuantity();
 %>
<center>
<form action="UpdateServlet">
<div id="addbooks">
<table>
<tr>
<td><h3>Book Name</h3></td><td><input type="text" value="<%=bookName %>" name="bookname"></td>
</tr>
<tr>
<td><h3>Book Author</h3></td><td><input type="text" value="<%=author %>" name="author"></td>
</tr>
<tr>
<td><h3>Book Edition</h3></td><td><input type="text" value="<%=edition %>" name="edition"></td>
</tr>
<tr>
<td><h3>Book Quantity</h3></td><td><input type="text" value="<%=quantity%>" name="quantity"></td>
</tr>
<tr>
<td><h3>Book Id</h3></td><td><h3><%=bookid %></h3>
<input type="hidden" name="bookid" value="<%=bookid%>">
</tr>
<tr><td colspan="2"><center><input type="submit" id="btn-home"></center></td></tr>
</table>
</div>
</form>
</center>
	<%}
		else{%>
			<center><h1>No record Found</h1></center>
		<%}

}
%>
</body>
</html>