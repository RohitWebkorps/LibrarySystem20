

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import DatabaseOperations.DatabaseOperationsClass;
@WebServlet("/RenewBook")
public class RenewBook extends HttpServlet {
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String bookids=request.getParameter("bookId");
		int bookId =Integer.parseInt(bookids);
		String returnDate=request.getParameter("renewDate");
		String issueTo=request.getParameter("issueTo");
        DatabaseOperationsClass op=new DatabaseOperationsClass();
        System.out.println(op.renewBook(bookId,returnDate,issueTo));  
        response.sendRedirect("BookDetailsStudent.jsp?bookId="+bookId);
	}

}
