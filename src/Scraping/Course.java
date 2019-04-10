import java.util.Vector;

public class Course {
	Vector<Section> sections = new Vector<Section>();
	String name = ""; // CSCI-201
	String department = ""; // CSCI
	String courseNum = ""; // 201
	String title = ""; // Principles of Software Development
	int units; // 4
	Course(String _name, String _title, String _units) {
		name = _name;
		
		boolean first = true;
		for (int i = 0; i < _name.length(); i++) {
			if (_name.charAt(i) != '-') {
				if(first)
					department += _name.charAt(i);
				else {
					if (Character.isDigit(_name.charAt(i)))
						courseNum += _name.charAt(i);
				}
			}
			else 
				first = false;
		}
		
		title = _title;
		
		String[] parts = _units.split(".0");
		units = Integer.parseInt(parts[0]);
	}

	
	Vector<Section> getSections() {
		return sections;
	}
	
	void addSection(Section s) {
		sections.add(s);
	}
	
	void printInfo() {
		System.out.println(name + ": " + title + " (" + units + ")");
		for (int i = 0; i < sections.size(); i++) {
			System.out.print("\t");
			sections.get(i).printInfo();
		}
	}
	
	public static void main(String[] args) {
		/* 
		 Pseudocode:
		 
		 File file(filename);
		 Vector<Course> courses;
		 while (not at last line) {
		 	if (new Course)
		 		courses.add(new Course(line));
		 	else
		 		courses.get(courses.size-1).addSection(line);
		 	
		 }
		 
		 */
		
		
	}
}
