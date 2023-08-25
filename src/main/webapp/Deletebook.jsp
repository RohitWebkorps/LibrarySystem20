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
<title>Delete book</title>
<%@ include file="Navbar.jsp"%>

</head>
<body>
<center>
<div id="addbooks">
<form>
<h3> Enter Book Id - <input type="text" name="bookid"></h3>
<center><input type="submit" id="btn-home"></center>
</form>
</div>
</center>
<%
String bookids=request.getParameter("bookid");
if(!(bookids==null) && (!bookids.isEmpty()))
{
	int bookid=Integer.parseInt(bookids);

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
<form action="DeleteServlet">
<div id="addbooks">
<table>
<tr>
<td><h3>Book Name</h3></td><td><h3><%=bookName %></h3></td>
</tr>
<tr>
<td><h3>Book Author</h3></td><td><h3><%=author %></h3></td>
</tr>
<tr>
<td><h3>Book Edition</h3></td><td><h3><%=edition %></h3></td>
</tr>
<tr>
<td><h3>Book Quantity</h3></td><td><h3><%=quantity%></h3></td>
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
	<%
	
		}
		else{%>
			<center><h1>No record Found</h1></center>
		<% 
		}
}


%>
</body>
</html>