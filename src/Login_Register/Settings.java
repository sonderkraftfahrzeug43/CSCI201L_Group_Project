package Login_Register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.TimeZone;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Settings")
public class Settings extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Settings() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String major = request.getParameter("major");
		String minor = request.getParameter("minor");
		String password = request.getParameter("password");
		String gradYear = request.getParameter("class");
		ResultSet rs = null;
		String nextPage = null;
		Statement st = null;
		Connection conn = null;
		try {
			String username = "";
			HttpSession session = request.getSession();
			if(!session.isNew()){
				username = session.getAttribute("userName").toString();
			}
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/schedulebuilder?serverTimezone=" + TimeZone.getDefault().getID();
			conn = DriverManager.getConnection(url,"root","s62UcrEx");
			String query = "UPDATE User SET majorID = ? , minorID = ? , gradYID = ?, WHERE userName = ?";
			PreparedStatement ps = conn.prepareStatement(query);
			if (major.equals("0")){
				major = session.getAttribute("idmajor").toString();
			}
			else{
				session.setAttribute("majorID", major);
			}
			ps.setString(1, major);
			if (minor.equals("0")){
				minor = session.getAttribute("idminor").toString();
			}
			else{
				session.setAttribute("minorID", minor);
			}
			ps.setString(2, minor);
			if (gradYear.equals("0")){
				gradYear = session.getAttribute("gradyear").toString();
			}
			else{
				session.setAttribute("gradYID", gradYear);
			}
			ps.setString(3, gradYear);
			ps.setString(4, username);
			ps.executeUpdate();
			nextPage ="/main.jsp";	
		} catch (ClassNotFoundException e) {
			System.out.println("cnf: " + e.getMessage());
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("sqle: " + e.getMessage());
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}
}
