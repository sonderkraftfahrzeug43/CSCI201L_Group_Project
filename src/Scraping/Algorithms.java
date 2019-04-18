import java.util.Vector;


public class Algorithms {
	// Returns a list of possible sections
	public static Vector<Vector<Section>> schedule(Vector<Course> courses) {
		return Scheduling.schedule(courses);
	}

	
	public static void main(String[] args) {
	}
	
	
	
	// PRIVATE HELPER FUNCTIONS BELOW
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
				for (int k = index; k < 14; k++) 
					entries[k] = null;
				return entries;
			}
				
			else {
				if (quotes) {
					if (c == '\"') {
						quotes = false;
						entries[index] = word;
						index++;
						word = "";
						if ((i+1) < line.length() && line.charAt(i+1) == ',') 
							i++;
					}
					else word += c;
				}
				else {
					if (c == ',') {
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
		for (int i = 0; i < s.length(); i++) 
			if (s.charAt(i) != remove) 
				ret += s.charAt(i);
		return ret;
	}
}
