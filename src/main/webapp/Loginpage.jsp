<%@page import="java.sql.*" %>
<%@page import="DatabaseOperations.*" %>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*" %>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="ExternalCS4.css">
<title>Insert title here</title>
</head>
<body>
<center>
<table id="login">
<form action="StudentLogin.jsp?loginStatus=true">
<tr><th colspan=2><h2>Login</h2></th></tr>
<tr>
<td><h3>Enter Membership Number</h3></td><td><input type="text" name="membershipno" required></td>
</tr>
<tr>
<td><h3>Enter Password</h3></td><td><input type="password" name="password" required></td>
</tr>
<tr>
<td><input type="submit" id="loginbutton"></td><td><input type="submit"  id="loginbutton" value="Goto Registration" onclick='window.open("StudentRegistration.jsp")'  ></td>
</tr>
</form>
</table>
</center>
<%
String membershipno=request.getParameter("membershipno");
if(membershipno!=null)
{
	int no=0;
try{
 no=Integer.parseInt(membershipno);
}catch(Exception e)
{%>
<center>
<h4>Input membership number  should be number only</h4>
</center>
	<%
}
String password=request.getParameter("password");

DatabaseOperationsClass op=new DatabaseOperationsClass();

String status=op.checkPassword(no,password);
if(status.equals("student"))
{
HttpSession session1=request.getSession();

session1.setAttribute("membershipno",no);

response.sendRedirect("StudentHome.jsp");
}
else if(status.equals("admin"))
{
HttpSession session1=request.getSession();

session1.setAttribute("membershipNo",no);

response.sendRedirect("AdminHome.jsp");
}
{
%>
<center>Invalid Password/MemberShip No.</center>
<%
}
}
%>
</body>
</html>