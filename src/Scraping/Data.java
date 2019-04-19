package Scraping;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Vector;

// Class that encapsulates all the data scraped
public class Data {
	public final static String filename = "./acronymList.txt";
	private static Vector<Department> departments = new Vector<Department>();
	
	public Data() {
		// Read in all the departments and instantiate them
		try {
			FileReader fr = new FileReader(filename);
			BufferedReader br = new BufferedReader(fr);
			String line = br.readLine();
			
			while (line != null) {		
				Department d = new Department(line);
				departments.add(d);
				line = br.readLine();
			}
			br.close();
			fr.close();	
	
		} catch (FileNotFoundException fnfe) {
			System.out.println("The file " + filename + " cannot be found. \n"); 
			return;

		} catch (IOException ioe) {
			System.out.println("Input/Output Error: " + ioe.getMessage() + "\n");
			return;

		} catch (Exception ex) {
			System.out.println("There was an error parsing.");
			return;
		}
	}
	
	public Vector<Department> getDepartments() {
		return departments;
	}
	
	// Search by department acronym
	public Vector<Department> findDepartmentAcro(String name) {
		Vector<Department> validDep = new Vector<Department>();
		for (int i = 0; i < departments.size(); i++) {
			if (departments.get(i).acronym.toLowerCase().contentEquals(name)) {
				validDep.add(departments.get(i));
			}
		}
		return validDep;
	}
	
	
	
	public static Vector<Course> findCourses(String searchString) {
		// Use a map to so we don't add redundant courses
		Map<String, Course> validCourses = new HashMap();
		
		searchString = searchString.toLowerCase();
		for (int j = 0; j < departments.size(); j++) {
			Vector<Course> courses = departments.get(j).courses;
			for (int i = 0; i < courses.size(); i++) {
				if (validCourses.get(courses.get(i).name) == null && 
						(courses.get(i).name.toLowerCase().contains(searchString) || courses.get(i).title.toLowerCase().contains(searchString))) {
					validCourses.put(courses.get(i).name, courses.get(i));
				}
			}
			
			if (departments.get(j).acronym.contentEquals(searchString.toLowerCase())) {
				Vector<Course> c = departments.get(j).courses;
				for (int i = 0; i < c.size(); i++) {
					if (validCourses.get(c.get(i).name) == null)
						validCourses.put(c.get(i).name, c.get(i));
				}
			}
		}
		
		Vector<Course> ret = new Vector<Course>();
		
		for (Object key : validCourses.keySet()) {
			Course c = validCourses.get(key);
			ret.add(c);
		}

		
		Collections.sort(ret, Course.courseComparator);

		
		return ret;
	}
	
	
	public static void main(String[] args) {
		testSort();
	}
	
	public static void testSort() {
		Data d = new Data();
		Vector<Course> ret = new Vector<Course>();
		
		Course c = d.findCourses("Software Development").get(0);
		ret.add(c);
		
		c = d.findCourses("Linear Algebra and").get(0);
		ret.add(c);
		
		c = d.findCourses("Fundamentals of Physics").get(0);
		ret.add(c);
		
		c = d.findCourses("Data Structures").get(0);
		ret.add(c);
		
		c = d.findCourses("Python").get(0);
		ret.add(c);
		
		c = d.findCourses("Microbiology").get(0);
		ret.add(c);
		
		System.out.println("BEFORE:");
		for(int i = 0; i < ret.size(); i++) 
			System.out.println("	" + ret.get(i).name + ": " + ret.get(i).title);
		
		Collections.sort(ret, Course.courseComparator);
		System.out.println("AFTER:");
		for(int i = 0; i < ret.size(); i++) 
			System.out.println("	" + ret.get(i).name + ": " + ret.get(i).title);
		
	}	
}
