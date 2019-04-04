package Login_Register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/schedulebuilder?user=root&password=Abeler.123");
			st = conn.createStatement();
			//st.executeUpdate("UPDATE `pageVisited` SET `count` = `count`+1 WHERE userID=4 and pageid=1)
			rs = st.executeQuery("SELECT * FROM user WHERE userName='" + userName + "'");
			boolean username_exists = false; 
			boolean username_and_password = false; 
			HttpSession session1 = request.getSession();
			if(rs.next())
			{
				// wrong password
				username_exists = true; 
				request.setAttribute("wpError", "Wrong password");
			}	
			st = conn.createStatement();
			//st.executeUpdate("UPDATE `pageVisited` SET `count` = `count`+1 WHERE userID=4 and pageid=1)
			rs = st.executeQuery("SELECT * FROM User WHERE username='" + userName + "' and pass= '"+password+"'");
			if(rs.next()) 
			{
				// login
				username_and_password = true;
				nextPage = "/main.jsp";
				session1.setAttribute(userName, "iduser ");
				
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
