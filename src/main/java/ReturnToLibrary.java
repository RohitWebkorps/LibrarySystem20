

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import DatabaseOperations.*;


@WebServlet("/ReturnToLibrary")
public class ReturnToLibrary extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		PrintWriter out=response.getWriter();
	    String bookIdS=request.getParameter("bookId");
	    int bookId=Integer.parseInt(bookIdS);
	    String issueTo=request.getParameter("issueTo");
	    Integer membershipNo=Integer.parseInt(request.getParameter("membershipno"));
	    DatabaseOperationsClass op=new DatabaseOperationsClass();
	   if( op.returnBook(bookId,membershipNo))
	   {	   
	    response.sendRedirect("ParticularStudentIssueBook.jsp?return=true");
	   }
	  
	}


	

}
