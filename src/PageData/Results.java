 package PageData;

import java.io.IOException;
import Scraping.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Results")
public class Results extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Results() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String choice = request.getParameter("option");
		HttpSession session = request.getSession();
		String search = "";
		String nextPage = "/results.jsp";
		System.out.println("NEW REQUEST");
		if(choice.equals("Class")){
			System.out.println("CODE FOR CLASS");
			search = request.getParameter("friendText");
			if (search != null){
				Data data = (Data)session.getAttribute("data");
				
			}
			else{
				nextPage = ("/profile.jsp");
			}
		}
		if(choice.equals("Friend")){
			System.out.println("CODE FOR FRIEND");
			search = request.getParameter("friendText");
			if (search != null){
				
			}
			else{
				nextPage = ("/profile.jsp");
			}
		}
		if(choice.equals("Professor")){
			System.out.println("CODE FOR PROFESSOR");
			search = request.getParameter("professorText");
			if (search != null){
				
			}
			else{
				nextPage = ("/profile.jsp");
			}
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}

}
