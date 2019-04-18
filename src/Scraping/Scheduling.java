import java.util.Vector;

public class Scheduling {
	private static Vector<Vector<Section>> all = new Vector<Vector<Section>>();
	private static Vector<Course> courses = new Vector<Course>();
	
	public static void testSearch() {
		Data d = new Data();
		while (true) {
			String search = "math";
			Vector<Course> c = d.findCourses(search);
			for (int i = 0; i < c.size(); i++) {
				c.get(i).printInfo();
			}
			return;
		}
	}
	
	public static void testSchedule() {
		Data d = new Data();
		
		// ITP 303
		Course c1 = d.findCourses("ACCT-473").get(0);
		
		// ITP 435
		Course c2 = d.findCourses("ACCT-372").get(0);
		
		// ITP 380
		Course c3 = d.findCourses("CSCI-310").get(0);
		
		// CSCI 360
		Course c4 = d.findCourses("PSYC-165").get(0);
				
		
		Vector<Course> desiredCourses = new Vector<Course>();
		desiredCourses.add(c1);
		desiredCourses.add(c2);
		desiredCourses.add(c3);
		desiredCourses.add(c4);
		
		for (int i = 0; i < desiredCourses.size(); i++) {
			desiredCourses.get(i).printInfo();
		}
		
		Vector<Vector<Section>> all = schedule(desiredCourses);
		
		
	}
	
	
	public Scheduling() {
	}
	
	public static void main(String[] args) {
		testSchedule();
		

	}
	
	public static Vector<Vector<Section>> schedule(Vector<Course> _courses) {
		courses = _courses;
		
		Schedule schedule = new Schedule();
		scheduleHelper(0, schedule);
		
		System.out.println("Final Possible Schedules:");
		System.out.println("Count: " + all.size());
		Vector<Vector<Section>> possible = new Vector<Vector<Section>>();
		
		for (int i = 0; i < all.size(); i++) {
			System.out.println("NEW SCHEDULE: ");
			for (int j = 0; j < all.get(i).size(); j++) {
				System.out.println("	" + all.get(i).get(j).sectionID);
			}
		}
		
		Vector<Vector<Section>> actual = new Vector<Vector<Section>>();
		return actual;
	}
	
	public static void copy(Schedule s, Schedule s2) {
		for (int i = 0; i < 241; i++) {
			for (int j = 0; j < 7; j++) 
				s2.times[i][j] = s.times[i][j];
		}
		
		s2.sections.clear();
		for (int i = 0; i < s.sections.size(); i++) {
			s2.sections.add(s.sections.get(i));
		}
	}
	
	private static void scheduleHelper(int index, Schedule _schedule) {		
		// If you reach the end, do nothing
		if (index == courses.size()) {
			Schedule schedule = new Schedule();
			copy(_schedule, schedule);
			
//			System.out.println("Index: " + index);
			all.add(schedule.sections);
			Vector<Section> s = _schedule.sections;
			System.out.println("Schedule " + all.size());
//			System.out.println("Number of sections: " + s.size());
			for (int i = 0; i < s.size(); i++) {
				System.out.println(s.get(i).sectionID);
			}
//			_schedule.printSchedule();
			System.out.println("\n\n");
			return;
		}
		
		Schedule schedule = new Schedule();
		
		boolean allConflicts = true;
		Vector<Section> sections = courses.get(index).sections;
		for (int i = 0; i < sections.size(); i++) {
			
			copy(_schedule, schedule);
//			System.out.println("\nCopy of schedule");
//			_schedule.printSchedule();
			
			if (!schedule.conflicts(sections.get(i))) {
				System.out.println("\nTrying " + sections.get(i).sectionID + ", size: " + schedule.sections.size());
				allConflicts = false;
				schedule.addSection(sections.get(i));
//				System.out.println("Size after: " + schedule.sections.size());
//				schedule.printSchedule();
				scheduleHelper(index+1, schedule);
				
//				System.out.println("after rec call");
//				for (int j = 0; j < schedule.sections.size(); j++)
//					System.out.println(schedule.sections.get(j).sectionID);
//				_schedule.printSchedule();
				
			}
			else {
				System.out.println(sections.get(i).sectionID + " conflicts.");
			}
		}
		System.out.println("End of checking  " + courses.get(index).name);
	}
}
