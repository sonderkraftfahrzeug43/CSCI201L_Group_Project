package PageData;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.TimeZone;
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
	public int getNumFriends(String className,HttpSession session){
		int sharedClasses = 0;
		String username = session.getAttribute("UserID").toString();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		PreparedStatement ps1 = null;
		ResultSet rs1 = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://us-cdbr-iron-east-02.cleardb.net:3306/heroku_f034524e641ba65?serverTimezone=" + TimeZone.getDefault().getID();
			conn = DriverManager.getConnection(url , "b8c39ba9e35da7" , "ebcfebb1");
			ps = conn.prepareStatement("SELECT * FROM follow WHERE user1ID=?");
			ps.setString(1, username);
			rs = ps.executeQuery();
			Vector<String> friends = new Vector<String>();
			while(rs.next()) {
				String friendID = rs.getString("user2ID");
				friends.add(friendID);
			}
			for (int index = 0; index < friends.size(); index++){
				ps1 = null;
				rs1 = null;
				ps1 = conn.prepareStatement("SELECT * FROM currentclass WHERE userID=?");
				ps1.setString(1, friends.get(index));
				rs1 = ps1.executeQuery();
				while(rs1.next()){
					if (className.equals(rs1.getString("name"))){
						sharedClasses++;
					}
				}
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
				if(rs1 != null) {
					rs.close();
				}
				if(ps1 != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(SQLException sqle) {
				System.out.println("sqle: " + sqle.getMessage());
			}
		}
		return sharedClasses;
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
				Vector<Course> courses = data.findCourses(search);
				if (courses.size()==0){
					results.add("No results available");
				}
				else{
					System.out.println("courses size" + courses.size());
					for (int outer = 0; outer < courses.size();outer++){
						for (int inner = 0; inner < courses.get(outer).getSections().size();inner++){
							String name = courses.get(outer).name;
							String title = courses.get(outer).title;
							String completeName = name + " " + title;
							results.add(courses.get(outer).getHeader() + " " + courses.get(outer).getSections().get(inner).getInfo());
							System.out.println(getNumFriends(completeName,session));
							System.out.println(courses.get(outer).getHeader() + " " +courses.get(outer).getSections().get(inner).getInfo());
						}
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
				String searchKeyword = search;
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
						String fID = Integer.toString(friendID);
						request.setAttribute("friendId", fID);
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
			else{
				nextPage = ("/profile.jsp");
			}
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}
}

