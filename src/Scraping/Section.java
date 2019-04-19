package Scraping;

public class Section {
	public String sectionID;
	public String sectionType;
	public String professor;
	public Course motherCourse;
	
	
	public boolean[] days; 
	// Array to keep track of which days the section occurs on
	// 0 is Monday, 1 is Tuesday, etc.
	
	public Time time;
	public String location;
	public int units;
	
	Section(String[] parts, Course _c) {
		sectionType = parts[4];
		sectionID = parts[5];
		time = new Time(parts[7]);
		days = getDays(parts[8]);
		professor = parts[12];
		location = parts[13];		
	}
	
	void printInfo() {
		System.out.println(sectionType + ", " + sectionID + ", " 
				+ time.getFormattedTime() + ", " + professor + ", " + location);
	}
	
	private boolean[] getDays(String line) {
		boolean[] days = new boolean[8];
		String[] parts = line.split(",");
		
		for (int i = 0; i < parts.length; i++) {
			parts[i] = parts[i].toLowerCase();
			
			if (parts[i].contains("mon")) 
				days[0] = true;
			
			else if (parts[i].contains("tue"))
				days[1] = true;
			
			else if (parts[i].contains("wed"))
				days[2] = true;
			
			else if (parts[i].contains("thu"))
				days[3] = true;
			
			else if (parts[i].contains("fri")) 
				days[4] = true;
			
			else if (parts[i].contains("tba"))
				days[7] = true;
			
			else {
				if (parts[0].toLowerCase().contains("mwf")) {
					days[0] = true;
					days[2] = true;
					days[4] = true;
				}
				else if (parts[0].toLowerCase().contains("tth")) {
					days[1] = true;
					days[3] = true;
				}
				else if (parts[0].toLowerCase().contains("mtuwth")) {
					days[0] = true;
					days[1] = true;
					days[2] = true;
					days[3] = true;
				}
				else if (parts[0].toLowerCase().contains("tuwthf")) {
					days[4] = true;
					days[1] = true;
					days[2] = true;
					days[3] = true;
				}
				else if (parts[0].toLowerCase().contains("mtuthf")) {
					days[0] = true;
					days[1] = true;
					days[3] = true;
					days[4] = true;
				}
				else if (parts[0].toLowerCase().contains("mwthf")) {
					days[0] = true;
					days[2] = true;
					days[3] = true;
					days[4] = true;
				}
				else if (parts[0].toLowerCase().contains("tuthf")) {
					days[1] = true;
					days[3] = true;
					days[4] = true;
				}
				else if (parts[0].toLowerCase().contains("mtuwf")) {
					days[0] = true;
					days[1] = true;
					days[2] = true;
					days[4] = true;
				}
				else if (parts[0].toLowerCase().contains("sat")) {
					days[5] = true;
				}
				
				else {
					System.out.println("\t\t\t\t\t" + i + " - Breaking out because unexpected input: " + parts[i] + " from sectionID " + sectionID);
					break;
				}
			}
		}
		
		return days;
	}
	
	public String getInfo() {
		String returnable = sectionType + ", " + sectionID + ", " 
				+ time.getFormattedTime() + ", " + professor + ", " + location;
		return returnable;
	}
}
