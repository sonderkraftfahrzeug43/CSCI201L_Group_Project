import java.util.Scanner;
import java.util.Vector;

public class Scheduling {
	private static Vector<Vector<Section>> all = new Vector<Vector<Section>>();
	private static Vector<Vector<Section>> possible = new Vector<Vector<Section>>();
	private static Vector<Course> courses = new Vector<Course>();
	
	
	public Scheduling() {
	}
	
	public static void main(String[] args) {
		Data d = new Data();
		Vector<Department> dep = d.getDepartments();
		
//
//		
//		
//		Course cs201 = d.findCourses("Software").get(0);
//		Course cs270 = d.findCourses("Algorithms").get(0);
//		
//		Vector<Course> desiredCourses = new Vector<Course>();
//		desiredCourses.add(cs201);
//		desiredCourses.add(cs270);
//		
//		Vector<Vector<Section>> all = schedule(desiredCourses);
		Scanner scan = new Scanner(System.in);
		while (true) {
			System.out.print("Word: ");
			String word = scan.nextLine();
			
			if (word.contentEquals("break")) break;
			
			Vector<Course> c = d.findCourses(word);
//			for (int i = 0 ; i < c.size(); i++) {
//				c.get(i).printInfo();
//			}
			
		}
		scan.close();
		System.out.println("done");

	}
	
	public static Vector<Vector<Section>> schedule(Vector<Course> _courses) {
		courses = _courses;
		
		
		Schedule schedule = new Schedule();
		scheduleHelper(0, schedule);
		
		for (int i = 0; i < possible.size(); i++) {
			System.out.println("NEW SCHEDULE: ");
			Schedule s = new Schedule();
			for (int j = 0; j < possible.get(i).size(); j++) {
				s.addSection(possible.get(i).get(j));
			}
			s.printSchedule();
		}
		
		Vector<Vector<Section>> actual = new Vector<Vector<Section>>();
//		
//		for (int i = 0; i < possible.size(); i++) {
//			boolean bad = false;
//			for (int j = 0; j < possible.get(i).size(); j++) {
//				if (possible.get(i).get(j) == null) {
//					bad = true;
//					break;
//				}
//			}
//			
//			if (!bad) {
//				actual.add(possible.get(i));
//			}
//		}
		
		return actual;
	}
	
	private static void scheduleHelper(int index, Schedule schedule) {
		// If you reach the end, do nothing
		if (index == courses.size()) {
			all.add(schedule.sections);
			return;
		}
		
		Schedule OGschedule = schedule;
		boolean allConflicts = true;
		Vector<Section> sections = courses.get(index).sections;
		for (int i = 0; i < sections.size(); i++) {
			schedule = OGschedule;
			if (!schedule.conflicts(sections.get(i))) {
				allConflicts = false;
				scheduleHelper(index+1, schedule.addSection(sections.get(i)));
			}
		}
		
		if (allConflicts) {
			all.add(null);
		}
	}
}
