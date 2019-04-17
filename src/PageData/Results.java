 package PageData;

import java.io.IOException;
import java.util.Vector;

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
		Vector<String> results = new Vector<String>();
		HttpSession session = request.getSession();
		String search = "";
		String nextPage = "/results.jsp";
		System.out.println("NEW REQUEST");
		if(choice.equals("Class")){
			System.out.println("CODE FOR CLASS");
			search = request.getParameter("classText");
			if (search != null){
				System.out.println(search);
				Data data = (Data)session.getAttribute("data");
				Vector<Course> courses = Data.findCourses(search);
				if (courses.size()==0){
					results.add("No results available");
				}
				else{
						results.add(courses.get(0).getHeader());
						for (int index = 0; index < courses.get(0).getSections().size();index++){
							results.addElement(courses.get(0).getSections().get(index).getInfo());
					}
				}
			session.setAttribute("resultsArray", results);	
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

