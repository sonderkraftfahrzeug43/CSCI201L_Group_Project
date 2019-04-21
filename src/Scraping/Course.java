package Scraping;
import java.util.Vector;

public class Course implements Comparator<Course> {
	public Vector<Vector<Section>> sections = new Vector<Vector<Section>>();
	public Vector<Section> allSections = new Vector<Section>();
	public String name = ""; // CSCI-201
	public String department = ""; // CSCI
	public String courseNum = ""; // 201
	public String title = ""; // Principles of Software Development
	public String units; // 4
	
	public Course(Course c, Vector<Section> s) {
		for (int i = 0; i < s.size(); i++) {
			allSections.add(s.get(i));
		}
		
		this.name = c.name;
		this.department = c.department;
		this.courseNum = c.courseNum;
		this.title = c.title;
		this.units = c.units;
	}
	
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


	
	public void addSection(Section s) {
		allSections.add(s);
		
		for (int i = 0; i < sections.size(); i++) {
			if (sections.get(i).get(0).sectionType.contains(s.sectionType)) {
				sections.get(i).add(s);
				return;
			}
				
		}
		
		Vector<Section> newVector = new Vector<Section>();
		newVector.add(s);
		sections.add(newVector);
	}
	
	public void printInfo() {
		System.out.println(name + ": " + title + " (" + units + ")");
		for (int i = 0; i < sections.size(); i++) {
			System.out.println("\tSection Type: " + sections.get(i).get(0).sectionType);
			for (int j = 0; j< sections.get(i).size(); j++)
				sections.get(i).get(j).printInfo();
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
	
//	public String getInfo(){
//		String complete = "";
//		complete += (name + ": " + title + " (" + units + ")");
//		for (int i = 0; i < sections.size(); i++) {
//			complete+=("\n");
//			complete+=(sections.get(i).getInfo());
//		}
//		return complete;
//	}
	
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
	
	public static void main(String[] args) {
		Data d = new Data();
		Course c = d.findCourses("CSCI-201").get(0);
		c.printInfo();
	}

}

