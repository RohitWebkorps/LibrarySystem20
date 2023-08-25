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
<%@ include file="StudentNavbar.jsp"%>

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
	
		String edition=book.getEdition();
 
	Book book1=op.getIssuedBook(bookName,edition,membershipNo);
	
	String author=book.getAuthor();

	int bookId=book1.getBookId();
	String returnDate=book1.getReturnDate();
	String issueDate=book1.getIssueDate();

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
<td><h2>Book Id</h2></td><td><h2><%=bookId %></h2></td>
</tr>
<tr>
<td><h3>Issue Date</h3></td><td><h3><%=issueDate %></h3></td>
</tr>
<tr>
<td><h3>Return Date</h3></td><td><h3><%=returnDate %></h3></td>
</tr>
</table>
</div>
</center>
</div>
</body>
</html>