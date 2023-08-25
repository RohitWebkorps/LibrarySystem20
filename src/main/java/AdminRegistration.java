

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import DatabaseOperations.*;
/**
 * Servlet implementation class AdminRegistration
 */
@WebServlet("/AdminRegistration")
public class AdminRegistration extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String name=request.getParameter("name");
		String libraryName=request.getParameter("LibraryName");
		String address=request.getParameter("address");
		String email=request.getParameter("e-mail");
		String role=request.getParameter("role");
		String password=request.getParameter("password");
		DatabaseOperationsClass op=new DatabaseOperationsClass();
		int membershipNo=op.addAdmin(name,libraryName,address,email,role,password);
		HttpSession session=request.getSession();
		session.setAttribute("membershipNo",membershipNo);
		response.sendRedirect("AdminHome.jsp?membershipNo="+membershipNo);
	
	}

	
}
