import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DatabaseOperations.DatabaseOperationsClass;


@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		PrintWriter out=response.getWriter();
		String bookids=request.getParameter("bookid");
		int bookid=Integer.parseInt(bookids); 
		DatabaseOperationsClass op=new DatabaseOperationsClass();
		System.out.println(op.delete(bookid));
		response.sendRedirect("ViewBooks.jsp?delete=true");
        }



}
