

import java.io.*;
import java.sql.Statement;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import DatabaseOperations.DatabaseOperationsClass;
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		    String bookids=request.getParameter("bookid");
		    int bookid=Integer.parseInt(bookids);
		    String bookName=request.getParameter("bookname");
		    String author=request.getParameter("author");
		    String Edition=request.getParameter("edition");
		    String quantityInString=request.getParameter("quantity");
            DatabaseOperationsClass op=new DatabaseOperationsClass();
            System.out.println(op.updateBook(bookName, author, Edition, quantityInString, bookid));  
            response.sendRedirect("BookDetails.jsp?bookId="+bookid+"&update=true");
	}

}
