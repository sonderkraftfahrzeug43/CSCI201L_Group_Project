package Scraping;
import java.util.Vector;

public class Schedule {
	// Example: times[120][4] represents 12:00PM on Thursday
	// Row 0 is 12:00AM
	// Col 0 is Monday
	private boolean[][] times = new boolean[240][7];
	Vector<Section> sections = new Vector<Section>();
	
	Schedule() {
		for (int i = 0; i < 240; i++) {
			for (int j = 0; j < 7; j++) {
				times[i][j] = false;
			}
		}
	}
	
	public Schedule addSection(Section s)  {
		if (this.conflicts(s)) return null;
		
		Time t = s.time;
		boolean[] days = s.days;
		for (int i = t.militaryStart/10; i < t.militaryEnd/10; i++) {
			for (int j = 0; j < days.length; j++) {
				// If the class meets on that day and 
				if (days[j] == true) {
					times[i][j] = true;
				}
			}
		}
		
		sections.add(s);
		return this;
	}
	
	public void printSchedule() {
		System.out.println("Times| M | T | W |Th | F | S |Su |");
		for (int i = 0; i < 240; i++) {
			if (i % 10 < 6) {
				if (i/100 == 0)
					System.out.print(0);
				System.out.print(i/10 + ":" + i%10 + "0|");
				for (int j = 0; j < 7; j++) {
					if (times[i][j]) 
						System.out.print(" x |");
					else 
						System.out.print("   |");
				}
				System.out.println();
			}
		}
	}
	
	public boolean conflicts(Section s) {
		Time t = s.time;
		boolean[] days = s.days;
		
		
		
		for (int i = t.militaryStart/10; i < 240; i++) {
			for (int j = 0; j < days.length; j++) {
				// If the class meets on that day and 
				if (days[j] == true && times[i][j] == true) {
					System.out.println("False at " + i + " " + j);
					return true;
				}
					
			}
		}
	
		
		return false;
		
	}
}
