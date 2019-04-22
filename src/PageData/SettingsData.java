package PageData;

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
public class SettingsData extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SettingsData() {
        super();
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("IN SETTING SERVLET");
		String major = request.getParameter("major");
		String minor = request.getParameter("minor");
		String password = request.getParameter("password");
		String gradYear = request.getParameter("class");
		ResultSet rs = null;
		Statement stMaj = null;
		Statement stMin = null;
		Statement stGrad = null;
		ResultSet rsMaj = null;
		ResultSet rsMin = null;
		ResultSet rsGrad = null;
		String nextPage = "/main.jsp";
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
			String query = "UPDATE User SET pass = ?, majorID = ? , minorID = ? , gradYID = ? WHERE userName = ?";
			PreparedStatement ps = conn.prepareStatement(query);
			if(password != null){
				password = session.getAttribute("password").toString();
			}
			else{
				session.setAttribute("password",password);
			}
			ps.setString(1, password);
			if (major.equals("0")){
				major = session.getAttribute("majorID").toString();
			}
			else{
				session.setAttribute("majorID", major);
				rsMaj = stMaj.executeQuery("SELECT * FROM Major WHERE MajorID='" + major + "'");
				rsMaj.next();
				String majorName = rsMaj.getString("name");
				String majURL = rsMaj.getString("requirements");
				session.setAttribute("majURL", majURL);
				session.setAttribute("majorName", majorName);
			}
			ps.setString(2, major);
			if (minor.equals("0")){
				minor = session.getAttribute("minorID").toString();
			}
			else{
				session.setAttribute("minorID", minor);
				rsMin = stMin.executeQuery("SELECT * FROM Minor WHERE MinorID='" + minor + "'");
				rsMin.next();
				String minorName = rsMin.getString("name");
				String minURL = rsMin.getString("requirements");
				session.setAttribute("minURL", minURL);
				session.setAttribute("minorName", minorName);
			}
			ps.setString(3, minor);
			if (gradYear.equals("0")){
				gradYear = session.getAttribute("gradyear").toString();
			}
			else{
				session.setAttribute("gradYID", gradYear);
				rsGrad = stGrad.executeQuery("SELECT * FROM gradyear WHERE GradYID='" + gradYear + "'");
				rsGrad.next();
				String gradYearName = rsGrad.getString("year");
				session.setAttribute("gradYear", gradYearName);
			}
			ps.setString(4, gradYear);
			ps.setString(5, username);
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
