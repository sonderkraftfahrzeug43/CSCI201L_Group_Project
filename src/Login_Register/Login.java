 package Login_Register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.TimeZone;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Scraping.Section;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String nextPage = "/login.jsp";
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		Statement stMaj = null;
		Statement stMin = null;
		Statement stGrad = null;
		ResultSet rsMaj = null;
		ResultSet rsMin = null;
		ResultSet rsGrad = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://us-cdbr-iron-east-02.cleardb.net:3306/heroku_f034524e641ba65?serverTimezone=" + TimeZone.getDefault().getID();
			conn = DriverManager.getConnection(url , "b8c39ba9e35da7" , "ebcfebb1");
			st = conn.createStatement();	
			HttpSession session1 = request.getSession(true);
			rs = st.executeQuery("SELECT * FROM User WHERE userName='" + userName + "' and pass= '"+password+"'");
			if(rs.next()) 
				{
				String iduser = rs.getString("UserID");
				String idmajor = rs.getString("majorID");
				String idminor = rs.getString("minorID");
				String idgradyear = rs.getString("gradYID");
				nextPage = "/main.jsp";
				session1.setAttribute("userName", userName);
				session1.setAttribute("UserID", iduser);
				session1.setAttribute("majorID", idmajor);
				session1.setAttribute("minorID", idminor);
				session1.setAttribute("gradYID", idgradyear);
				stGrad = conn.createStatement();
				stMaj = conn.createStatement();
				stMin = conn.createStatement();
				rsMaj = stMaj.executeQuery("SELECT * FROM Major WHERE MajorID='" + idmajor + "'");
				rsMin = stMin.executeQuery("SELECT * FROM Minor WHERE MinorID='" + idminor + "'");
				rsGrad = stGrad.executeQuery("SELECT * FROM gradyear WHERE GradYID='" + idgradyear + "'");
				rsMaj.next();
				rsMin.next();
				rsGrad.next();
				String majorName = rsMaj.getString("name");
				String majURL = rsMaj.getString("requirements");
				String minorName = rsMin.getString("name");
				String minURL = rsMin.getString("requirements");
				String gradYearName = rsGrad.getString("year");
				Vector<Section> currClasses = new Vector<Section>();
				Vector<Section> prevClasses = new Vector<Section>();
				Vector<String> friends = new Vector<String>();
				session1.setAttribute("friends", friends);
				session1.setAttribute("majURL", majURL);
				session1.setAttribute("minURL",minURL);
				System.out.println("Curr classes" + currClasses);
				session1.setAttribute("currClasses", currClasses);
				session1.setAttribute("prevClasses", prevClasses);
				session1.setAttribute("gradYear", gradYearName);
				session1.setAttribute("minorName", minorName);
				session1.setAttribute("majorName", majorName);	
			}
			else {
				request.setAttribute("nuError", "User does not exist");
				nextPage = "/login.jsp";
			}
			
		} catch (SQLException sqle) {
			System.out.println("sqle: " + sqle.getMessage());
		} catch (ClassNotFoundException cnfe) {
			System.out.println("cnfe: " + cnfe.getMessage());
		} finally {
			try {
				if(rs != null) {rs.close();}
				if(st != null) {st.close();}
				if(conn != null) {conn.close();}
			} catch (SQLException sqle) {
				System.out.println("sqle: " + sqle.getMessage());
			}
		}
	
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}
}
