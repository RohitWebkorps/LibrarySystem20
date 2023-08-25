
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="DatabaseOperations.*" %>
    <%@ page import="Entities.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="ExternalCS4.css">
<%@ include file="StudentNavbar.jsp" %>
<meta charset="ISO-8859-1">
<title>Issue book</title>
</head>
<body>

<center>
<h1>Search Books</h1>
<div id="addbooks">
<form>
<h3> Enter Book Name - <input type="text" name="bookname"></h3>
<h3> Enter Edition - <input type="text" name="bookedition"></h3>
<center><input type="submit" id="btn-home"></center>
</form>
</div>
</center>
<%
String bookname=request.getParameter("bookname");
String bookedition=request.getParameter("bookedition");
if((!(bookname==null) && (!bookname.isEmpty())) && (!(bookedition==null) &&(!bookedition.isEmpty())))
{
      DatabaseOperationsClass op=new DatabaseOperationsClass();
        if(op.isbookpresent(bookname,bookedition))
        {
        	Book book=op.getBook(bookname,bookedition);
			String bookName=book.getBookName();
			String author=book.getAuthor();
			String edition=book.getEdition();
			String quantity=book.getQuantity();
			int quantitycheck=Integer.parseInt(quantity);
			int bookid=book.getBookId();
            
%>
<center>

<div id="addbooks">
<table>
<tr>
<td><h3>Book Name</h3></td><td><h3><%=bookName %></h3></td>
</tr>
<tr>
<td><h3>Book Author</h3></td><td><%=author %></td>
</tr>
<tr>
<td><h3>Book Edition</h3></td><td><%=edition %></td>
</tr>
<tr>
<td><h3>Book Id</h3></td><td><h3><%=bookid %></h3></td>
</tr>
<tr>

</tr>
<tr>
<td><h3>Book Avaibility</h3></td>
<%if(quantitycheck!=0)
{%>
<td>Available</td>
</tr>

<%
}
else
{
%>
<td>No available</td>
</tr>

<%
}
%>
</tr>



</table>
</div>

</center>
	<% 
        }
		else{
		%>
			<center><h1>No record Found</h1></center>
		<% 
		}
}



%>
</body>
</html>