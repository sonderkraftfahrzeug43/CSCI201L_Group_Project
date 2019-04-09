package Login_Register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.TimeZone;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Search
 */
@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchArea = request.getParameter("searchArea");
		String searchKeyword = request.getParameter("searchKeyword");
		if(searchArea.equals("Professor")) {
			
		} else if(searchArea.equals("Professor")) {
			
		} else {
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			boolean friendFound = false;
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/schedulebuilder?serverTimezone=" + TimeZone.getDefault().getID();
				conn = DriverManager.getConnection(url , "root" , "roottest");
				ps = conn.prepareStatement("SELECT * FROM User WHERE userName=?");
				ps.setString(1, searchKeyword);
				rs = ps.executeQuery();
				if(rs.next()) {
					HttpSession session = request.getSession();
					friendFound = true;
					int friendID = rs.getInt("iduser");
					int userID = (int)session.getAttribute("userName");
					Statement st = conn.createStatement();
					ResultSet friendCourses = st.executeQuery("SELECT * FROM CourseTaken WHERE iduser=" + friendID);
					st.close();
					st = conn.createStatement();
					ResultSet userCourses = st.executeQuery("SELECT * FROM CourseTaken WHERE iduser=" + userID);
					st.close();
					Vector<String> sharedCourses = new Vector<String>();
					while(friendCourses.next()) {
						int fcid = friendCourses.getInt("idcourse");
						while(userCourses.next()) {
							int ucid = userCourses.getInt("idcourse");
							if(fcid == ucid) {
								String courseName;
								st = conn.createStatement();
								ResultSet course = st.executeQuery("SELECT * FROM Course WHERE idcourse=" + fcid);
								courseName = course.getString("courseName");
								sharedCourses.add(courseName);
								course.close();
								st.close();
							}
						}
					}
					friendCourses.close();
					userCourses.close();
					int majorId = rs.getInt("idmajor");
					int minorId = rs.getInt("idminor");
					if(majorId != 0) {
						String friendMajor;
						st = conn.createStatement();
						ResultSet major = st.executeQuery("SELECT * FROM Major WHERE idmajor=" + majorId);
						friendMajor = major.getString("majorName");
						st.close();
						major.close();
						request.setAttribute("friendMajor", friendMajor);
						
					} else {
						request.setAttribute("friendMajor", null);
					}
					if(minorId != 0) {
						String friendMinor;
						st = conn.createStatement();
						ResultSet minor = st.executeQuery("SELECT * FROM Minor WHERE idmajor=" + majorId);
						friendMinor = minor.getString("minorName");
						st.close();
						minor.close();
						request.setAttribute("friendMajor", friendMinor);
					} else {
						request.setAttribute("friendMinor", null);
					}
					
					request.setAttribute("friendId", friendID);
					request.setAttribute("sharedCourses", sharedCourses);
				}
				if(!friendFound) {
					request.setAttribute("friendId", null);
				}
			} catch(ClassNotFoundException cnfe) {
				System.out.println("cnfe:" + cnfe.getMessage());
			} catch (SQLException sqle) {
				System.out.println("sqle: " + sqle.getMessage());
			} finally {
				try {
					if(rs != null) {
						rs.close();
					}
					if(ps != null) {
						ps.close();
					}
					if(conn != null) {
						conn.close();
					}
				} catch(SQLException sqle) {
					System.out.println("sqle: " + sqle.getMessage());
				}
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
