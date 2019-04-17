package Search;

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
public class FollowSesrch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowSesrch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchKeyword = request.getParameter("friend");
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
				int friendID = rs.getInt("userID");
				int userID = (int)session.getAttribute("userID");
				Statement st = conn.createStatement();
				ResultSet friendCourses = st.executeQuery("SELECT * FROM CurrentClass WHERE userID=" + friendID);
				st.close();
				st = conn.createStatement();
				ResultSet userCourses = st.executeQuery("SELECT * FROM CurrentClass WHERE userID=" + userID);
				st.close();
				Vector<String> sharedCourses = new Vector<String>();
				while(friendCourses.next()) {
					String fcid = friendCourses.getString("name");
					while(userCourses.next()) {
						String ucid = userCourses.getString("name");
						if(fcid == ucid) {
							String courseName = fcid;
							sharedCourses.add(courseName);
						}
					}
				}
				friendCourses.close();
				userCourses.close();
				int majorId = rs.getInt("majorID");
				int minorId = rs.getInt("minorID");
				if(majorId != 0) {
					String friendMajor;
					st = conn.createStatement();
					ResultSet major = st.executeQuery("SELECT * FROM Major WHERE majorID=" + majorId);
					friendMajor = major.getString("name");
					st.close();
					major.close();
					request.setAttribute("friendMajor", friendMajor);
				} else {
					request.setAttribute("friendMajor", null);
				}
				if(minorId != 0) {
					String friendMinor;
					st = conn.createStatement();
					ResultSet minor = st.executeQuery("SELECT * FROM Minor WHERE minorID=" + minorId);
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
