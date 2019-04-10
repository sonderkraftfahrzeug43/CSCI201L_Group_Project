import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Vector;


public class Algorithms {
	// Returns a list of possible sections
	public static Vector<Vector<Section>> schedule(Vector<Course> courses) {
		Vector<Vector<Section>> all = new Vector<Vector<Section>>();
		return scheduleHelper(courses, 0, all);
	}
	
	private static Vector<Vector<Section>> scheduleHelper(Vector<Course> courses, int index, Vector<Vector<Section>> all) {
		Vector<Section> sections = courses.get(index).getSections();
		if (index == courses.size()) {
			return all;
		}
		
		for (int i = 0; i < sections.size(); i++) {
			// Try all sections
			// If sections fit, put it into last index and move on
		}
		
		return all;
	}
	
	public static void main(String[] args) {
		String filename = "csci-20193.csv";
		Vector<Course> courses = new Vector<Course>();
		try {
			FileReader fr = new FileReader(filename);
			BufferedReader br = new BufferedReader(fr);
			String line = br.readLine();
			line = br.readLine();
			
			while (line != null) {
				String[] parts = readCSV(line);
				if (parts[0].length() != 0) {
					courses.add(new Course(parts[0], parts[1], parts[3]));
				}
				else {
					Course course = courses.get(courses.size()-1);
					course.addSection(new Section(parts));
				}
			
				line = br.readLine();
				
			}
			
			for (int i = 0; i < courses.size(); i++) {
				courses.get(i).printInfo();
			}
			
			
			
			br.close();
			fr.close();	
			
		} catch (FileNotFoundException fnfe) {
			System.out.println("The file " + filename + " cannot be found. \n");
			return;
		} catch (IOException ioe) {
			System.out.println("Input/Output Error: " + ioe.getMessage() + "\n");
			return;
		} 
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
				if (c == '\"') {
					quotes = false;
					
				}
				else {
					word += c;
				}
					
			}
			
			else {
				if (c == ',') {
//					System.out.println("inserting " + word + " " + index);
					entries[index] = word;
					index++;
					word = "";
				}
				else if (c == '\"'){
					quotes = true;
				}
				else {
					word += c;
				}
			}
			
		}
		return entries;
	}
}
