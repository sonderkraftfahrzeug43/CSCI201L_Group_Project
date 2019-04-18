package Scraping;
import java.util.Vector;

public class Course implements Comparator<Course> {
	public Vector<Section> sections = new Vector<Section>();
	public String name = ""; // CSCI-201
	public String department = ""; // CSCI
	public String courseNum = ""; // 201
	public String title = ""; // Principles of Software Development
	public String units; // 4
	
	public Course(String _name, String _title, String _units) {
		name = _name;
		try {
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
			units = parts[0];
		} catch (Exception e) {
			System.out.println("e here");
		}
	}

	public Vector<Section> getSections() {
		return sections;
	}
	
	public void addSection(Section s) {
		sections.add(s);
	}
	
	public void printInfo() {
		System.out.println(name + ": " + title + " (" + units + ")");
		for (int i = 0; i < sections.size(); i++) {
			System.out.print("\t");
			sections.get(i).printInfo();
		}
	}
	
	public static int stringCompare(String str1, String str2) {
		for (int i = 0; i < str1.length() && i < str2.length(); i++) {
			if ((int)str1.charAt(i) == (int)str2.charAt(i))
				continue;
			else 
				return (int)str1.charAt(i) - (int)str2.charAt(i);
		}
		
		if (str1.length() < str2.length()) 
			return (str1.length() - str2.length());
		
		else if (str1.length() > str2.length()) 
			return (str1.length() - str2.length());
		
		else 
			return 0;
		
	}
	
	public String getInfo(){
		String complete = "";
		complete += (name + ": " + title + " (" + units + ")");
		for (int i = 0; i < sections.size(); i++) {
			complete+=("\n");
			complete+=(sections.get(i).getInfo());
		}
		return complete;
	}
	public String getHeader(){
		String header = name + ": " + title + " (" + units + ")";
		return header;
	}

	// Comparator to sort Courses
	public static Comparator<Course> courseComparator = new Comparator<Course>() {
		public int compare(Course c1, Course c2) {
		
			if (Course.stringCompare(c1.name, c2.name) > 0) 
				return 1;
			else if (Course.stringCompare(c1.name,c2.name) < 0)
				return -1;
			else
				return 0;
		}
	};

	@Override
	public int compare(Course o1, Course o2) {
		return courseComparator.compare(o1, o2);
	}

}
