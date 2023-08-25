

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DatabaseOperations.DatabaseOperationsClass;
@WebServlet("/LoginStudent")
public class LoginStudent extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
        String membershipno=request.getParameter("membershipno");
        int no=Integer.parseInt(membershipno);
		String password=request.getParameter("password");
		DatabaseOperationsClass op=new DatabaseOperationsClass();
		String status=op.checkPassword(no,password);
		HttpSession session=request.getSession();
		if(status.equals("student"))
		{
		session.setAttribute("membershipno",no);
		response.sendRedirect("StudentHome.jsp");
		}else {
			session.setAttribute("membershipNo",no);
			response.sendRedirect("AdminHome.jsp");	
		}
	}
}
