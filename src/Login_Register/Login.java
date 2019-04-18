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

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String nextPage = "/login.jsp";
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://us-cdbr-iron-east-02.cleardb.net:3306/heroku_f034524e641ba65?serverTimezone=" + TimeZone.getDefault().getID();
			conn = DriverManager.getConnection(url , "b8c39ba9e35da7" , "ebcfebb1");
			st = conn.createStatement();
			//st.executeUpdate("UPDATE `pageVisited` SET `count` = `count`+1 WHERE userID=4 and pageid=1)
			rs = st.executeQuery("SELECT * FROM user WHERE userName='" + userName + "'");
			boolean username_exists = false; 
			boolean username_and_password = false; 
			HttpSession session1 = request.getSession(true);
			if(rs.next())
			{
				// wrong password
				username_exists = true; 
				request.setAttribute("wpError", "Wrong password");
			}	
			st = conn.createStatement();
			//st.executeUpdate("UPDATE `pageVisited` SET `count` = `count`+1 WHERE userID=4 and pageid=1)
			rs = st.executeQuery("SELECT * FROM User WHERE userName='" + userName + "' and pass= '"+password+"'");
			if(rs.next()) 
			{
				// login
				String iduser = rs.getString("UserID");
				String idmajor = rs.getString("majorID");
				String idminor = rs.getString("minorID");
				String idgradyear = rs.getString("gradYID");
				username_and_password = true;
				nextPage = "/main.jsp";
				session1.setAttribute("userName", userName);
				session1.setAttribute("UserID", iduser);
				session1.setAttribute("majorID", idmajor);
				session1.setAttribute("minorID", idminor);
				session1.setAttribute("gradYID", idgradyear);
				
			}
			
			if(!username_exists) {
				// user does not exist
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
