import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Vector;

public class Department {
	private Vector<Course> courses = new Vector<Course>();
//	private String name = "";
	private String acronym = "";
	private static final String year = "-20193";
	
	public Department(String acro) {
		String filename = acro + year + ".csv";
		acronym = acro;
		Vector<Course> courses = parseData(filename);
		
	}
	
	public static void main(String[] args) {
		// Read in from the list of acronym
		// Instantiate all departments
		
	}

	public static Vector<Course> findCourses(String courseName, Vector<Course> courses) {
		Vector<Course> validCourses = new Vector<Course>();
		
		courseName = courseName.toLowerCase();
		System.out.println(courseName);
		
		for (int i = 0; i < courses.size(); i++) {
			if (courses.get(i).name.toLowerCase().contains(courseName) || courses.get(i).title.toLowerCase().contains(courseName)) {
				validCourses.add(courses.get(i));
//				System.out.println("Found: " + courses.get(i).name);
			}
		}
		return validCourses;
	}

	
	
	
	
	
	
	// PRIVATE HELPER FUNCTIONS BELOW
	private static Vector<Course> parseData(String filename) {
		Vector<Course> courses = new Vector<Course>();
		try {
			FileReader fr = new FileReader(filename);
			BufferedReader br = new BufferedReader(fr);
			String line = br.readLine();
			line = br.readLine();
			
			while (line != null) {

				String[] parts = readCSV(line);
				
				// Create new course if the first few columns are blank
				if (parts[0].length() != 0) 
					courses.add(new Course(parts[0], parts[1], parts[3]));
					
				Course course = courses.get(courses.size()-1);
				course.addSection(new Section(parts));
				line = br.readLine();	
			}
			br.close();
			fr.close();	
		} catch (FileNotFoundException fnfe) {
			System.out.println("The file " + filename + " cannot be found. \n");
			return null;
		} catch (IOException ioe) {
			System.out.println("Input/Output Error: " + ioe.getMessage() + "\n");
			return null;
		} 
		return courses;
	}
	
	private static String[] readCSV(String line) {
		String[] entries = new String[14];
		for (int i = 0; i < 14; i++)
			entries[i] = "";
		
		int index = 0;
		
		boolean quotes = false;
		String word = "";
		
		int j = 0;
		for (int i = 0; i < line.length(); i++) {
			char c = line.charAt(i);

			if (quotes) {
				if (c == '\"') quotes = false;
				else word += c;
			}
			else {
				if (c == ',') {
//					System.out.println("inserting " + word + " " + index);
					entries[index] = word;
					index++;
					word = "";
				}
				else if (c == '\"') quotes = true;
				else word += c;	
			}
		}
		return entries;
	}
	
	private static String remove(String s, char remove) {
		String ret = "";
		for (int i = 0; i < s.length(); i++) {
			if (s.charAt(i) != remove) 
				ret += s.charAt(i);
		}
		return ret;
	}
	
	
}
