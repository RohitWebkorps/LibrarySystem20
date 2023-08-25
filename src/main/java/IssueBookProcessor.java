

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/IssueBookProcessor")
public class IssueBookProcessor extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		   PrintWriter out = response.getWriter();
	       	try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/librarySystem","root","root");
			    String bookid=request.getParameter("bookid");
			    String issuedate=request.getParameter("issuedate");
			    String returndate=request.getParameter("returndate");
			    String membershipNo=request.getParameter("membershipNo");
			    String issueTo=membershipNo;
			    Statement st=con.createStatement();
			    String check="select * from bookdetails where bookid="+bookid;
			    ResultSet rs=st.executeQuery(check);
			    rs.next();
			    String bookName=rs.getString(1);
			    String author=rs.getString(2);
			    String edition=rs.getString(3);	    
			    String quantitys=rs.getString(4);
			    int quantity=Integer.parseInt(quantitys);
			    --quantity;
			    check="insert into bookissue values('"+bookName+"','"+edition+"','"+bookid+"','"+issuedate+"','"+returndate+"','"+author+"','"+issueTo+"')";
			    st.executeUpdate(check);
			    check="update bookdetails set quantity='"+quantity+"'where bookid="+bookid;
			    st.executeUpdate(check);
			    
			    con.close();
			    response.sendRedirect("ParticularStudentIssueBook.jsp?issue=true");
			}
			catch(Exception  e)
			{
				out.println(e);
			}

	}
}
