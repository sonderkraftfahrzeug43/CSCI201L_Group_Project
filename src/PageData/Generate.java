package PageData;
import Scraping.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import java.util.TimeZone;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Generate")
public class Generate extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Generate() {
        super();
    }
    public int getNumFriends(String sessionName,HttpSession session,Connection conn,String url){
		int sharedClasses = 0;
		String username = session.getAttribute("UserID").toString();
		PreparedStatement ps = null;
		ResultSet rs = null;
		PreparedStatement ps1 = null;
		ResultSet rs1 = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			ps = conn.prepareStatement("SELECT * FROM Follow WHERE user1ID=?");
			ps.setString(1, username);
			rs = ps.executeQuery();
			Vector<String> friends = new Vector<String>();
			while(rs.next()) {
				String friendID = rs.getString("user2ID");
				friends.add(friendID);
			}
			for (int index = 0; index < friends.size(); index++){
				ps1 = null;
				rs1 = null;
				ps1 = conn.prepareStatement("SELECT * FROM CurrentClass WHERE userID=?");
				ps1.setString(1, friends.get(index));
				rs1 = ps1.executeQuery();
				while(rs1.next()){
					if (sessionName.equals(rs1.getString("session"))){
						sharedClasses++;
					}
				}
			}
		} catch(ClassNotFoundException cnfe) {
			System.out.println("cnfe:" + cnfe.getMessage());
		} catch (SQLException sqle) {
			System.out.println("sqle: " + sqle.getMessage());
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(ps != null) {
					ps.close();
				}
				if(rs1 != null) {
					rs.close();
				}
				if(ps1 != null) {
					ps.close();
				}
			} catch(SQLException sqle) {
				System.out.println("sqle: " + sqle.getMessage());
			}
		}
		return sharedClasses;
	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String nextPage = "/main.jsp";
		Vector<Course> courses = new Vector<Course>();
		Data data = (Data)session.getAttribute("data");
		if (session.getAttribute("rerout").toString().equals("false")){
			String arr[] = request.getParameterValues("txtbox[]");
			for (int index = 0; index < arr.length; index++){
				System.out.println(arr[index]);
			}
			for (int index = 0; index < arr.length; index++){
				Vector<Course> inner = Data.findCourses(arr[index]);
				if (inner.size()==0){
					System.out.println("INVALID COURSE");
					nextPage = "/generate.jsp";
					break;
				}
				else{
					courses.add(inner.get(0));
				}
			}
		}
		else{
			try{
				Vector<String> sCourses = new Vector<String>();
				ResultSet rs = null;
				Statement st = null;
				Connection conn = null;
				Class.forName("com.mysql.cj.jdbc.Driver");
				String url = "jdbc:mysql://ev5gu2qwztrbud6e:lq8tf7wmlnvp1an4@iwqrvsv8e5fz4uni.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/zljr4eqwwsxhhvay?serverTimezone=" + TimeZone.getDefault().getID();
				conn = DriverManager.getConnection(url , "ev5gu2qwztrbud6e" , "lq8tf7wmlnvp1an4");
				st = conn.createStatement();
				rs = st.executeQuery("SELECT * FROM CurrentClass WHERE userID='" + session.getAttribute("UserID") + "'");
				while (rs.next()){
					sCourses.add(rs.getString("name"));
				}
				if (!session.getAttribute("classToAdd").toString().equals("-")){
					sCourses.add(session.getAttribute("classToAdd").toString());
				}
				for (int index = 0; index < sCourses.size(); index++){
					Vector<Course> inner = Data.findCourses(sCourses.get(index));
					if (inner.size()==0){
						System.out.println("INVALID COURSE");
						nextPage = "/generate.jsp";
						break;
					}
					else{
						courses.add(inner.get(0));
					}
				}
				session.setAttribute("classToAdd", "-");
				session.setAttribute("rerout", "false");
			} catch (ClassNotFoundException e) {
				System.out.println("cnf: " + e.getMessage());
				e.printStackTrace();
			} catch (SQLException e) {
				System.out.println("sqle: " + e.getMessage());
				e.printStackTrace();
			}
		}
		Vector<String> classes = new Vector<String>();
		for (int index = 0; index < courses.size();index++){
			classes.add(courses.get(index).getHeader());
			System.out.println("*" + courses.get(index).getHeader());
		}
		session.setAttribute("currClasses", classes);
		Vector<Vector<Section>> helpus = new Vector<Vector<Section>>();
		Scheduling scheduling = (Scheduling)session.getAttribute("schedule");
		
		for (int index = courses.size()-2;index >= 0; index--){
			if (courses.get(index).name.equals(courses.get(index+1).name)){
				courses.remove(index+1);
			}
		}
		for (int index = 0; index< courses.size();index++){
			System.out.println(courses.get(index).name);
		}
		helpus = scheduling.schedule(courses);
		HashMap<Section, Integer> validCourses = new HashMap<Section,Integer>();
		try{
			ResultSet rs = null;
			Statement st = null;
			Statement stDel = null;
			Connection conn = null;
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://ev5gu2qwztrbud6e:lq8tf7wmlnvp1an4@iwqrvsv8e5fz4uni.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/zljr4eqwwsxhhvay?serverTimezone=" + TimeZone.getDefault().getID();
			conn = DriverManager.getConnection(url , "ev5gu2qwztrbud6e" , "lq8tf7wmlnvp1an4");
			for (int index = 0; index < helpus.size();index++){
				for (int inner = 0; inner < helpus.get(index).size();inner++){
					if(!validCourses.containsKey(helpus.get(index).get(inner))){					
						helpus.get(index).get(inner).printInfo();
						int sharedFriends = getNumFriends(helpus.get(index).get(inner).getInfo(),session,conn,url);
						validCourses.put(helpus.get(index).get(inner),sharedFriends);
					}
				}
			}
			Vector<Integer> classNumbers = new Vector<Integer>();
			for (int index = 0; index < helpus.size();index++){
				int numPerSchedule = 0;
				for (int inner = 0; inner < helpus.get(index).size();inner++){
					numPerSchedule += validCourses.get(helpus.get(index).get(inner));
				}
				classNumbers.add(numPerSchedule);
			}
			int max = 0;
			int maxIndex = 0;
			for (int index = 0; index < classNumbers.size();index++){
				if (classNumbers.get(index) > max){
					maxIndex = index;
					max = classNumbers.get(index);
				}
			}
			conn = DriverManager.getConnection(url , "ev5gu2qwztrbud6e" , "lq8tf7wmlnvp1an4");
			st = conn.createStatement();
			int rows = st.executeUpdate("DELETE FROM CurrentClass WHERE userID='" + session.getAttribute("UserID") + "'");
			for (int index = 0; index < helpus.get(maxIndex).size();index++){
				String sql = "insert into CurrentClass(name,section,location,days,startTime,endTime,professor,userID) values(?,?,?,?,?,?,?,?)";
				boolean[] days = helpus.get(maxIndex).get(index).days;
				String daysAsString = "";
				for (int daysI = 0; daysI < days.length; daysI++){
					if (days[daysI]==false){
						daysAsString += "0";
					}
					else{
						daysAsString +="1";
					}
				}
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, helpus.get(maxIndex).get(index).motherCourse.getHeader());
				System.out.println(helpus.get(maxIndex).get(index).motherCourse.getHeader());
				ps.setString(2, helpus.get(maxIndex).get(index).sectionID.toString());
				ps.setString(3, helpus.get(maxIndex).get(index).location.toString());
				ps.setString(4, daysAsString);
				ps.setString(5, (Integer.toString(helpus.get(maxIndex).get(index).time.militaryStart)));
				ps.setString(6, (Integer.toString(helpus.get(maxIndex).get(index).time.militaryEnd)));
				ps.setString(7, helpus.get(maxIndex).get(index).professor.toString());
				ps.setString(8, session.getAttribute("UserID").toString());
				ps.executeUpdate();
			}
		    st = conn.createStatement();
		    rs = st.executeQuery("SELECT * FROM CurrentClass WHERE userID ='" + session.getAttribute("UserID") + "'");
		    Vector<String> week = new Vector<String>();
		    week.add("Monday");
		    week.add("Tuesday");
		    week.add("Wednesday");
		    week.add("Thursday");
		    week.add("Friday");
		    stDel = conn.createStatement();
		    int rows2 = stDel.executeUpdate("DELETE FROM ScheduleSlot WHERE userID='" + session.getAttribute("UserID") + "'");
		    String sql = "insert into ScheduleSlot(startTime,endTime,Monday,Tuesday,Wednesday,Thursday,Friday,userID) values(?,?,?,?,?,?,?,?)";
		    while (rs.next()){
		    	String startTime = rs.getString("startTime");
		    	String endTime = rs.getString("endTime");
		    	if(startTime == null){
		    		startTime = "0";
		    	}
		    	if(endTime == null){
		    		endTime = "0";
		    	}
		    	String days = rs.getString("days");
		    	String name = rs.getString("name");
		    	System.out.println(1);
		    	String nameUpdate = name.substring(0,8);
		    	System.out.println(2);
		    	PreparedStatement ps = conn.prepareStatement(sql);
		    	ps.setString(1,startTime);
		    	ps.setString(2,endTime);
		    	for (int index = 1; index < 6; index++){
		    		if (days.substring(index,index+1).equals("1")){
		    			ps.setString(index+2,nameUpdate);
		    		}
		    		else{
		    			ps.setString(index+2,"");
		    		}
		    	} 
		    	ps.setString(8,session.getAttribute("UserID").toString());
		    	ps.execute();
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
