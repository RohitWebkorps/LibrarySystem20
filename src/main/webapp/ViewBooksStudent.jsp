<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="ExternalCS4.css">
<meta charset="ISO-8859-1">
<title>All books view</title>
<%@ include file="StudentNavbar.jsp"%>

</head>
<body>
<%
try{
	String delete=request.getParameter("delete");
		
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/librarySystem","root","root");
		    Statement st=con.createStatement();
		    String query="select * from bookdetails";
		    ResultSet rs=st.executeQuery(query);

  %>
		   
		    <center><h1>List of All Books</h1></center>
		    	   
<center>
<table id="listofbooks">
<tr><th><h2>Book Id</h2></th><th><h2>Book Name</h2></th><th><h2>Author</h2></th><th><h2>Edition</h2></th><th><h2>Quantity</h2></th></tr>

		   <%
		    while(rs.next())
		    {%>
 <tr><th><h2><%=rs.getString(5)%></h2></th><th><h2><%=rs.getString(1)%></h2></th><th><h2><%=rs.getString(2)%></h2></th><th><h2><%=rs.getString(3)%></h2></th><th><h2><%=rs.getString(4)%></h2></th></tr>
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