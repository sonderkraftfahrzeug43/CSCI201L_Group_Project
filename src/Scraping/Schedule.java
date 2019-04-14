
public class Schedule {
	// Example: times[120][4] represents 12:00PM on Thursday
	// Row 0 is 12:00AM
	// Col 0 is Monday
	private boolean[][] times = new boolean[240][7];
	
	Schedule() {
		for (int i = 0; i < 126; i++) {
			for (int j = 0; j < 7; j++) {
				times[i][j] = false;
			}
		}
	}
	
	public boolean addCourse(Section s) {
		if (this.conflicts(s)) return false;
		
		String start = s.time.startTime;
		String end = s.time.endTime;
		
		
		
		return false;
		
			
	}
	
	
	public boolean conflicts(Section s) {
		return true;
	}
}
