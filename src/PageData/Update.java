package PageData;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.LinkedList;
import java.util.TimeZone;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Update
 */
@WebServlet("/Update")
public class Update extends HttpServlet {
private static final long serialVersionUID = 1L;
    
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		//content type must be set to text/event-stream
		response.setContentType("text/event-stream");	
	
		//encoding must be set to UTF-8
		response.setCharacterEncoding("UTF-8");
		
	
		PrintWriter writer = response.getWriter();
		HttpSession session1 = request.getSession(true);
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		String userID = (String)session1.getAttribute("UserID");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://us-cdbr-iron-east-02.cleardb.net:3306/heroku_f034524e641ba65?serverTimezone=" + TimeZone.getDefault().getID();
			conn = DriverManager.getConnection(url , "b8c39ba9e35da7" , "ebcfebb1");
			st = conn.createStatement();
			rs = st.executeQuery("SELECT * FROM Updates WHERE userID=" + userID);
			rs.last();
			while(rs.previous()) {
				String updateMessage = rs.getString("content");
				if(session1.getAttribute("prevMessage") == null || !(session1.getAttribute("prevMessage").equals(updateMessage))){
					writer.print("retry: 1000\n");
					session1.setAttribute("prevMessage", updateMessage);
					writer.print("data: " + updateMessage + "\n\n");
					writer.flush();
				}
			}
		} catch(ClassNotFoundException cnfe) {
			
		} catch(SQLException sqle) {
			
		} finally {
			try {
				if(rs != null) {rs.close();}
				if(st != null) {st.close();}
				if(conn != null) {conn.close();}
			} catch (SQLException sqle) {
				System.out.println("sqle: " + sqle.getMessage());
			}
		}
		writer.close();
	}
}
