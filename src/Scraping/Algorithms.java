package Scraping;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Vector;


public class Algorithms {
	// Returns a list of possible sections
	public static Vector<Vector<Section>> schedule(Vector<Course> courses) {
		return Scheduling.schedule(courses);
	}

	
	public static void main(String[] args) {
		
	}
	
	
	
	// PRIVATE HELPER FUNCTIONS BELOW
	private static Vector<Course> parseCourses(String filename) {
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
	
	public static String[] readCSV(String line) {
		
		// Initialize array 
		String[] entries = new String[14];
		for (int i = 0; i < 14; i++)
			entries[i] = "";
		
		int index = 0;
		
		boolean quotes = false;
		String word = "";
		
		for (int i = 0; i < line.length(); i++) {
			char c = line.charAt(i);

			// Kill rest of entry data if there is a carrot
			if (c == '<') {
				for (int k = index; k < 14; k++) {
					entries[k] = null;
				}
				return entries;
			}
				
			else {
				if (quotes) {
					if (c == '\"') {
						quotes = false;
						entries[index] = word;
						index++;
						word = "";
						if ((i+1) < line.length() && line.charAt(i+1) == ',') {
							i++;
						}
					}
					else word += c;
				}
				else {
					if (c == ',') {
	//						System.out.println("inserting " + word + " " + index);
						entries[index] = word;
						index++;
						word = "";

					}
					else if (c == '\"') quotes = true;
					else word += c;	
				}
			}
		}
		
		return entries;
	}
	
	public static String remove(String s, char remove) {
		String ret = "";
		for (int i = 0; i < s.length(); i++) {
			if (s.charAt(i) != remove) 
				ret += s.charAt(i);
		}
		return ret;
	}
	

	
	
	
		
	
	
	
}
