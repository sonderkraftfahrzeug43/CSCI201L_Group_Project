package PageData;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.Collections;
import java.util.TimeZone;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ProfileSearch")
public class ProfileData extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProfileData() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String nextPage = "/profile.jsp";
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		Statement stMaj = null;
		ResultSet rsMaj = null;
		Statement stMin = null;
		ResultSet rsMin = null;
		Statement whileST = null;
		ResultSet whileRS = null;
		try {
			HttpSession session1 = request.getSession();
			String idmajor = "0";
			String idminor = "0";
			String user = "0";
			if (!session1.isNew()){
				user = session1.getAttribute("UserID").toString();
				idmajor = session1.getAttribute("majorID").toString();
				idminor = session1.getAttribute("minorID").toString();
			}
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/schedulebuilder?serverTimezone=" + TimeZone.getDefault().getID();
			conn = DriverManager.getConnection(url,"root","s62UcrEx");
			stMaj = conn.createStatement();
			stMin = conn.createStatement();
			rsMaj = stMaj.executeQuery("SELECT * FROM Major WHERE MajorID='" + idmajor + "'");
			    if (!rsMaj.next()){
		            System.out.println("ERRORMajor");
			    }
			rsMin = stMin.executeQuery("SELECT * FROM Minor WHERE MinorID='" + idminor + "'");
			    if (!rsMin.next()){
		            System.out.println("ERRORMinor");
			    }
			String majorName = rsMaj.getString("name");
			String majURL = rsMaj.getString("requirements");
			String minorName = rsMin.getString("name");
			String minURL = rsMin.getString("requirements");
			System.out.println(minURL);
			session1.setAttribute("majURL", majURL);
			session1.setAttribute("minURL",minURL);
			session1.setAttribute("minorName", minorName);
			session1.setAttribute("majorName", majorName);
			st = conn.createStatement();
			rs = st.executeQuery("SELECT * FROM Friend WHERE user1ID='" + user + "' OR user2ID='" + user + "'");
			Vector<String> friends = new Vector<String>();
			while (rs.next()){
				String friendOne = rs.getString("user1ID");
				if (friendOne.equals(user)){
					friendOne = rs.getString("user2ID");
				}
				whileST = conn.createStatement();
				whileRS = whileST.executeQuery("SELECT * FROM User WHERE UserID='" + friendOne + "'");
				whileRS.next();
				String userName = whileRS.getString("userName");
				friends.add(userName);        
			}
			Collections.sort(friends);
			for (int index = friends.size()-1;index > 0;index--){
				if (friends.get(index).equals(friends.get(index-1))){
					friends.remove(index);
				}
			}
			String nameAttribute = "";
			for(int index = 0; index< friends.size();index++){
				nameAttribute += (friends.get(index) + "|");
			}
			session1.setAttribute("friends", nameAttribute);
			System.out.println(nameAttribute);
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
}
