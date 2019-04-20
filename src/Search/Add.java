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

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Scraping.Section;

/**
 * Servlet implementation class Add
 */
@WebServlet("/Add")
public class Add extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Add() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String nextPage = null;
		String searchType = session.getAttribute("searchType").toString();
		String userID = session.getAttribute("UserID").toString();
		ResultSet rs = null;
		ResultSet rs2 = null;
		Statement st = null;
		Statement st2 = null;
		Connection conn = null;
		if (searchType.equals("Friend")){
			String f2User = request.getParameter("addValue");
			System.out.println(f2User);
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				String url = "jdbc:mysql://us-cdbr-iron-east-02.cleardb.net:3306/heroku_f034524e641ba65?serverTimezone=" + TimeZone.getDefault().getID();
				conn = DriverManager.getConnection(url , "b8c39ba9e35da7" , "ebcfebb1");
				st = conn.createStatement();
				rs = st.executeQuery("SELECT * FROM user WHERE userName='" + f2User + "'");
				rs.next();
				String f2ID = rs.getString("UserId");
				st2 = conn.createStatement();
				rs2 = st2.executeQuery("SELECT * FROM follow WHERE user1ID='" + userID + "' AND user2ID='" + f2ID + "'");
				if(rs2.next())
				{
					System.out.println("ALREADY FOLLOWING");
					nextPage ="/results.jsp";
				}
				else{
					String sql = "INSERT INTO follow(user1ID,user2ID) values(?,?)";
					PreparedStatement ps = conn.prepareStatement(sql);
					ps.setString(1, userID);
					ps.setString(2, f2ID);
					ps.executeUpdate();
					System.out.println("EXECUTED SUCCESSFULLY");
					nextPage = "/results.jsp";					
				}
			} catch (ClassNotFoundException e) {
				System.out.println("cnf: " + e.getMessage());
				e.printStackTrace();
			} catch (SQLException e) {
				System.out.println("sqle: " + e.getMessage());
				e.printStackTrace();
			}
		}
		else{
			String classToAdd = request.getParameter("addValue").toString();
			String id = null;
			nextPage ="/results.jsp";
			for (int index = 0; index < classToAdd.length()-3; index++){
				if (classToAdd.substring(index,index+3).equals("ID:")){
					id = classToAdd.substring(index+3,index+9);
				}	
			}
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				String url = "jdbc:mysql://us-cdbr-iron-east-02.cleardb.net:3306/heroku_f034524e641ba65?serverTimezone=" + TimeZone.getDefault().getID();
				conn = DriverManager.getConnection(url , "b8c39ba9e35da7" , "ebcfebb1");
				st = conn.createStatement();
				rs = st.executeQuery("SELECT * FROM currentclass WHERE section='" + id + "' AND UserID='" + userID + "'");
				if (rs.next()){
					System.out.println("Already have this class");
				}
			} catch (ClassNotFoundException e) {
				System.out.println("cnf: " + e.getMessage());
				e.printStackTrace();
			} catch (SQLException e) {
				System.out.println("sqle: " + e.getMessage());
				e.printStackTrace();
			}
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}
}
