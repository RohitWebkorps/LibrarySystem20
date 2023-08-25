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
<title>Renew Book</title>
<%@include file="StudentNavbar.jsp" %>
<script>
   document.addEventListener('DOMContentLoaded', function() {
       const today = new Date().toISOString().split('T')[0];
       document.getElementById('renewDate').setAttribute('min', today);
   });

    </script>
</head>
<body>
<center>
<h1>Renew Book</h1>
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
			int bookId=book.getBookId();
			String returnDate=book.getReturnDate();
			String issueDate=book.getIssueDate();
		
         %>
           
         
<center>

<form action="RenewBook">
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
<td><h3>Book Id</h3></td><td><h3><%=bookId %></h3></td>
</tr>
<tr>
<input type="hidden" name="bookId" value="<%=bookId%>">
<input type="hidden" name="issueTo" value="<%=membershipNo%>">
</tr>
<tr>
<td><h3>Issue Date</h3></td><td><h3 id="issueDate"><%=issueDate %></h3></td>
</tr>
<tr>
<td><h3>Return Date</h3></td><td><h3><%=returnDate %></h3></td>
</tr>
<tr>
<td><h3>Renew Date</h3></td><td><input type="date" name="renewDate" id="renewDate">
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
			<center><h1>No record Found</h1></center>
		<% 
		}
}

%>
</body>
 
</html>