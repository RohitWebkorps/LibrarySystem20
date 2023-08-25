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
<title>Book Details</title>
<%@ include file="Navbar.jsp"%>

</head>
<body>
<%
String bookidS=request.getParameter("bookId");
int bookid=Integer.parseInt(bookidS);
String newbook=request.getParameter("new");
String update=request.getParameter("update");
 DatabaseOperationsClass op=new DatabaseOperationsClass();
Book book= op.getBook(bookid);
		String bookName=book.getBookName();
		String author=book.getAuthor();
		String edition=book.getEdition();
		String quantity=book.getQuantity();
		int bookId=book.getBookId();
      if(newbook!=null)
      {
%>
        <center><h1>New Book is added successfully</h1></center>
        <% } 
              if(update!=null)
      {
%>
        <center><h1>Updated Book successfully</h1></center>
        <% } %>
<center>
<div id="addbooks">
<table>
<tr>
<td><h2>Book Name</h2></td><td><h2> <%=bookName %></h2></td>
</tr>
<tr>
<td><h2>Book Author</h2></td><td><h2><%=author %></h2></td>
</tr>
<tr>
<td><h2>Book Edition</h2></td><td><h2><%=edition %></h2></td>
</tr>
<tr>
<td><h2>Book Quantity</h2></td><td><h2><%=quantity %></h2></td>
</tr>
<tr>
<td><h2>Book Id</h2></td><td><h2><%=bookId %></h2></td>
</table>
</div>
</center>
</div>
</body>
</html>