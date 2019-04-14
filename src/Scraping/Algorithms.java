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
	

	
	
	
		
	
	
	
}
