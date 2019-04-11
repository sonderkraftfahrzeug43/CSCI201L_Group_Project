package Search;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.Collections;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ProfileSearch
 */
@WebServlet("/ProfileSearch")
public class ProfileSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileSearch() {
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session1 = request.getSession();
		//String user = session1.getAttribute("iduser").toString();
		int user = 1;
		String nextPage = "/profile.jsp";
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		Statement whileST = null;
		ResultSet whileRS = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/schedulebuilder?user=root&password=s62UcrEx");
			st = conn.createStatement();
			rs = st.executeQuery("SELECT * FROM Friend WHERE user1ID='" + user + "' OR user2ID='" + user + "'");
			Vector<String> friends = new Vector<String>();
			while (rs.next()){
				int friendOne = rs.getInt("user1ID");
				if (friendOne == user){
					friendOne = rs.getInt("user2ID");
				}
				whileST = conn.createStatement();
				whileRS = whileST.executeQuery("SELECT * FROM User WHERE UserID='" + friendOne + "'");
				whileRS.next();
				String userName = whileRS.getString("userName");
				friends.add(userName);
				//System.out.println(userName);        
			}
			Collections.sort(friends);
			for (int index = friends.size()-1;index > 0;index--){
				if (friends.get(index).equals(friends.get(index-1))){
					friends.remove(index);
				}
			}
			for(int index = 0; index< friends.size();index++){
				System.out.println(friends.get(index));
			}
//			session1.setAttribute("majURL", majURL);    
		    }
		    catch (SQLException sqle){
			    System.out.println("sqle:" + sqle.getMessage());
		  } catch(ClassNotFoundException cnfe){
			    System.out.println("cnfe:"+cnfe.getMessage());
		  } finally{
			    try{
				    if (rs!=null){
					    rs.close();
				    }
				    if (st!=null){
					    st.close();
				    }
				    if (conn!=null){
					    conn.close();
				    }
			    } 	catch(SQLException sqle){
				    System.out.println("sqle closing stuff: " + sqle.getMessage());
			    }
		    }
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}
}
