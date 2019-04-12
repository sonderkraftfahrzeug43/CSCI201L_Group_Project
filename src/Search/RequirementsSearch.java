package Search;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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


@WebServlet("/RequirementsSearch")
public class RequirementsSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RequirementsSearch() {
        super();
       
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session1 = request.getSession();
		//String user = session1.getAttribute("iduser").toString();
		//String idmajor = session1.getAttribute("idmajor").toString();
		//String idminor = session1.getAttribute("idminor").toString();
		int idmajor = 24;
		int idminor = 36;
		String nextPage = "/requirements.jsp";
		Connection conn = null;
		Statement stMaj = null;
		ResultSet rsMaj = null;
		Statement stMin = null;
		ResultSet rsMin = null;
		try {
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
			String majURL = rsMaj.getString("requirements");
			System.out.println(majURL);
			String minURL = rsMin.getString("requirements");
			System.out.println(minURL);
			session1.setAttribute("majURL", majURL);
			session1.setAttribute("minURL",minURL);
		    }
		    catch (SQLException sqle){
			    System.out.println("sqle:" + sqle.getMessage());
		  } catch(ClassNotFoundException cnfe){
			    System.out.println("cnfe:"+cnfe.getMessage());
		  } finally{
			    try{
				    if (rsMaj!=null){
					    rsMaj.close();
				    }
				    if (stMaj!=null){
					    stMaj.close();
				    }
				    if (rsMin!=null){
					    rsMin.close();
				    }
				    if (stMin!=null){
					    stMin.close();
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
