

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;
import DatabaseOperations.*;
@WebServlet("/AddBookInDatabase")
public class AddBookInDatabase extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    
	    String bookName=request.getParameter("bookname");
	    String author=request.getParameter("author");
	    String Edition=request.getParameter("edition");
	    String quantityInString=request.getParameter("quantity");
	   
	    DatabaseOperationsClass op=new DatabaseOperationsClass();
	    int bookId=op.InsertBook(bookName, author, Edition, quantityInString);
	    response.sendRedirect("BookDetails.jsp?bookId="+bookId+"&new=true");
		   
		}
}

