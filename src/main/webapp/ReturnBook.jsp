<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="DatabaseOperations.*" %>
    <%@ page import="Entities.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="ExternalCS4.css">
<meta charset="ISO-8859-1">
<title>Return Book</title>
<%@include file="StudentNavbar.jsp" %>
</head>
<body>
<center>
<h1>Return Book</h1>
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
        if(op.alreadyIssued(bookname,bookedition,membershipNo))
        {
        	Book book=op.getIssuedBook(bookname,bookedition,membershipNo);
			String bookName=book.getBookName();
			String author=book.getAuthor();
			String edition=book.getEdition();
			int bookid=book.getBookId();
			String returnDate=book.getReturnDate();
			String issueDate=book.getIssueDate();
		
         %>
<center>
<form action="ReturnToLibrary">
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
<input type="hidden" name="bookId" value="<%=bookid%>">
<input type="hidden" name="membershipno" value="<%=membershipNo%>">
</tr>
<tr>
<td><h3>Issue Date</h3></td><td><h3><%=issueDate %></h3></td>
</tr>
<tr>
<td><h3>Return Date</h3></td><td><h3><%=returnDate %></h3></td>
</tr>

<tr>
<tr><td colspan="2"><center><input type="submit" id="btn-home" ></center></td></tr>
</tr>

</tr>



</table>
</div>
</form>
</center>
	<% 
        }
		else{
		%>
			<center><h1>No such book is issued to you</h1></center>
		<% 
		}
}

%>
</body>
</html>