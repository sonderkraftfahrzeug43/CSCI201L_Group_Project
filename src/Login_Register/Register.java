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
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String major = request.getParameter("major");
		String minor = request.getParameter("minor");
		System.out.println(major);
		System.out.println(minor);
		ResultSet rs = null;
		String nextPage = null;
		Statement st = null;
		Connection conn = null;
		try {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			System.out.println(username + " " + password);
			String sql = "insert into user(userName,pass, majorID, minorID, gradYID) values(?,?,?,?,1)";
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/schedulebuilder?serverTimezone=" + TimeZone.getDefault().getID();
			conn = DriverManager.getConnection(url,"root","s62UcrEx");
			st = conn.createStatement();
			rs = st.executeQuery("SELECT * FROM user WHERE userName='" + username + "'");
			if(rs.next())
			{
				request.setAttribute("utError", "User is taken");
				nextPage ="/registration.jsp";
			}
			else if(major.equals("0")){
				request.setAttribute("utError", "You must select a major");
				nextPage ="/registration.jsp";
			}
			else
			{
				if (minor.equals("0")){
					minor = null;
				}
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, username);
				ps.setString(2, password);
				ps.setString(3, major);
				ps.setString(4, minor);
				ps.executeUpdate();
				nextPage ="/main.jsp";					
			}
			HttpSession session = request.getSession(true);
			Statement st2 = null;
			ResultSet rs2 = null;
			st2= conn.createStatement();
			rs2 = st2.executeQuery("SELECT * FROM user WHERE userName ='" + username + "'");
			while(rs2.next()){
				int iduser = rs.getInt("UserID");
				int idmajor = rs.getInt("majorID");
				int idminor = rs.getInt("minorID");
				int idgradyear = rs.getInt("gradYID");
				session.setAttribute("userName", username);
				session.setAttribute("UserID", iduser);
				session.setAttribute("majorID", idmajor);
				session.setAttribute("minorID", idminor);
				session.setAttribute("gradYID", idgradyear);
			}
			
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
