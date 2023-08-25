import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/logout")
public class logout extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session=request.getSession();
		String from=request.getParameter("from");
		session.invalidate();
		if(from.equals("admin"))
		{
		response.sendRedirect("LoginAdmin.jsp");
		}
		else {
			response.sendRedirect("StudentLogin.jsp");
		}
	}

}
