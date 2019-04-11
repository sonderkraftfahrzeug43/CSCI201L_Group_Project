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
		ResultSet rs = null;
		String nextPage = null;
		Statement st = null;
		Connection conn = null;
		try {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String sql = "insert into user(userName,pass, majorID, minorID, gradYID) values(?,?,0,0,0)";
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/schedulebuilder?serverTimezone=" + TimeZone.getDefault().getID();
			conn = DriverManager.getConnection(url,"root","yourpassword");
			st = conn.createStatement();
			rs = st.executeQuery("SELECT * FROM user WHERE userName='" + username + "'");
			if(rs.next())
			{
				request.setAttribute("utError", "User is taken");
				nextPage ="/registration.jsp";
			}
			else
			{
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, username);
				ps.setString(2, password);
				ps.executeUpdate();
				nextPage ="/main.jsp";					
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
