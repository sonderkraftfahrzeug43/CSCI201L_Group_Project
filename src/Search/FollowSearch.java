package Search;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.TimeZone;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Search
 */
@WebServlet("/FollowSearch")
public class FollowSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchKeyword = request.getParameter("friend");
		System.out.println("followsearch recevied:" + searchKeyword);
		request.setAttribute("friendName", searchKeyword);
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
				int userID = Integer.parseInt((String)session.getAttribute("UserID"));
				Statement st = conn.createStatement();
				
				int majorId = rs.getInt("majorID");
				System.out.println(majorId);
				int minorId = rs.getInt("minorID");
				if(majorId != 0) {
					String friendMajor;
					st = conn.createStatement();
					ResultSet major = st.executeQuery("SELECT * FROM Major WHERE MajorID=" + majorId);
					major.next();//this is not okay
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
					ResultSet minor = st.executeQuery("SELECT * FROM Minor WHERE MinorID=" + minorId);
					minor.next();//this is not okay
					friendMinor = minor.getString("name");
					st.close();
					minor.close();
					request.setAttribute("friendMinor", friendMinor);
				} else {
					request.setAttribute("friendMinor", null);
				}
				
				request.setAttribute("friendId", friendID);
				
				
				
				ArrayList<String> friendCoursesAL = new ArrayList<String>();
				ResultSet friendCourses = st.executeQuery("SELECT * FROM CurrentClass WHERE userID=" + friendID);
				String fcid = friendCourses.getString("name");
				friendCoursesAL.add(fcid);
				while(friendCourses.next()) {
					fcid = friendCourses.getString("name");
					friendCoursesAL.add(fcid);
				}
				
				st.close();
				
				st = conn.createStatement();
				ArrayList<String> userCoursesAL = new ArrayList<String>();
				ResultSet userCourses = st.executeQuery("SELECT * FROM CurrentClass WHERE userID=" + userID);
				String ucid = userCourses.getString("name");
				userCoursesAL.add(ucid);
				while(userCourses.next()) {
					ucid = userCourses.getString("name");
					userCoursesAL.add(ucid);
				}
				
				st.close();
				
				friendCourses.close();
				userCourses.close();
				
				ArrayList<String> sharedCourses = new ArrayList<String>();
				
				
				
				
				
				
				for(int i = 0; i < friendCoursesAL.size(); ++i) {
					for(int j = 0; j < userCoursesAL.size(); ++j) {
						if(userCoursesAL.get(j).equals(friendCoursesAL.get(i))) {
							sharedCourses.add(userCoursesAL.get(j));
						}
					}
				}
				
				
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
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/results.jsp");
		dispatcher.forward(request, response);


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
