

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DatabaseOperations.DatabaseOperationsClass;
@WebServlet("/StudentRegistration")
public class StudentRegistration extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		String name=request.getParameter("name");
		String email=request.getParameter("e-mail");
		String role=request.getParameter("role");
		String password=request.getParameter("password");
		
		DatabaseOperationsClass op=new DatabaseOperationsClass();
		
		int membershipno=op.addStudent(name,email,role,password);
		
		HttpSession session=request.getSession();
		session.setAttribute("membershipno",membershipno);
		response.sendRedirect("StudentHome.jsp?membershipNo="+membershipno);
		}

}
