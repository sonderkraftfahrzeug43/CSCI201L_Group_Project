package Login_Register;
import Scraping.*;
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

@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Register() {
        super();
    }
    /* SESSION ATTRIBUTES
     * userName = user's username
     * UserID = user's id
     * majorID = major's id
     * minorID = minor's id
     * gradYID = grad year's id
     * gradYear = grad year's name
     * majURL = major url
     * minURL = minor url
     * minorName = minor's name
     * majorName = major's name
     * currClasses = array of user's current Sections
     * prevClasses = array of user's previous Sections
     * */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String major = request.getParameter("major");
		String minor = request.getParameter("minor");
		ResultSet rs = null;
		ResultSet rsMaj = null;
		ResultSet rsMin = null;
		ResultSet rsGrad = null;
		String nextPage = null;
		Statement st = null;
		Statement stMaj = null;
		Statement stMin = null;
		Statement stGrad = null;
		Connection conn = null;
		try {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String grad = request.getParameter("grad");
			String sql = "insert into user(userName,pass, majorID, minorID, gradYID) values(?,?,?,?,?)";
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://us-cdbr-iron-east-02.cleardb.net:3306/heroku_f034524e641ba65?serverTimezone=" + TimeZone.getDefault().getID();
			conn = DriverManager.getConnection(url , "b8c39ba9e35da7" , "ebcfebb1");
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
			else if(grad.equals("0")){
				request.setAttribute("utError", "You must select a graduation year");
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
				ps.setString(5, grad);
				ps.executeUpdate();
				nextPage = "/main.jsp";					
				HttpSession session = request.getSession();
				Statement st2 = null;
				ResultSet rs2 = null;
				st2= conn.createStatement();
				rs2 = st2.executeQuery("SELECT * FROM user WHERE userName ='" + username + "'");
				while(rs2.next()){
					String iduser = rs2.getString("UserID");
					if (!session.isNew()){
						session.setAttribute("userName", username);
						session.setAttribute("UserID", iduser);
						session.setAttribute("majorID", major);
						session.setAttribute("minorID", minor);
						session.setAttribute("gradYID", grad);
					}
				}
				stGrad = conn.createStatement();
				stMaj = conn.createStatement();
				stMin = conn.createStatement();
				rsMaj = stMaj.executeQuery("SELECT * FROM Major WHERE MajorID='" + major + "'");
				rsMin = stMin.executeQuery("SELECT * FROM Minor WHERE MinorID='" + minor + "'");				
				rsMaj.next();
				rsMin.next();
				System.out.println("1");
				String majorName = rsMaj.getString("name");
				System.out.println("2");
				String majURL = rsMaj.getString("requirements");
				System.out.println(majURL);
				String minorName = rsMin.getString("name");
				String minURL = rsMin.getString("requirements");
				System.out.println(minURL);
				String gradYearName = rsGrad.getString("year");
				Vector<Section> currClasses = new Vector<Section>();
				Vector<Section> prevClasses = new Vector<Section>();
				session.setAttribute("prevClasses", prevClasses);
				session.setAttribute("currClasses", currClasses);
				session.setAttribute("majURL", majURL);
				session.setAttribute("minURL",minURL);
				session.setAttribute("gradYear", gradYearName);
				session.setAttribute("minorName", minorName);
				session.setAttribute("majorName", majorName);
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
