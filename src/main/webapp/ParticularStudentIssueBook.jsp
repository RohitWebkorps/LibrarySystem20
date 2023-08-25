<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="ExternalCS4.css">
<meta charset="UTF-8">
<title>Student Book List</title>
<%@ include file="StudentNavbar.jsp"%>

</head>
<body>
<%
try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/librarySystem","root","root");
		   /* String bookids=request.getParameter("bookid");
		    int bookid=Integer.parseInt(bookids);*/
		    Statement st=con.createStatement();
		    String query="select * from bookissue where issueto='"+membershipNo+"'";
		    ResultSet rs=st.executeQuery(query); 
		    String returnStatus=request.getParameter("return");
		    if(returnStatus!=null && returnStatus.equals("true"))
		    {
%>
    <h1 style="text-align:center;">Book Returned Successfully </h1>
    <%
		    }
    %>
<center><h1>List of All issued books to you</h1></center>
<center>
<table id="listofbooks">
<tr><th><h2>Book Name</h2><th><h2>Book Id</h2></th><th><h2>Author</h2></th></th><th><h2>Edition</h2></th><th><h2>Issue date</h2></th><th><h2>Return date</h2></th><th><h2>Issued to</h2></th></tr>
<% 
while(rs.next())
{%>
	<tr><th><h3><%=rs.getString(1)%></h3></th><th><h3><%=rs.getString(3)%></h3></th><th><h3><%=rs.getString(6)%></h3><th><h3><%=rs.getString(2)%></h3><th><h3><%=rs.getString(4)%></h3></th><th><h3><%=rs.getString(5) %></h3></th><th><%=rs.getString(7)%></th></tr>
<%}

		    con.close();

}
		catch(Exception e)
		{
			out.println(e);
		}
%>
</table>
</center>
</body>
</html>