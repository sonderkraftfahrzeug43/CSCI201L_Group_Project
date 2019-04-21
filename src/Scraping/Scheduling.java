package Scraping;
import java.util.Scanner;
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

		Course c1 = d.findCourses("CTIN-488").get(0);
		Course c2 = d.findCourses("CSCI-353").get(0);
		Course c3 = d.findCourses("CSCI-420").get(0);
		Course c4 = d.findCourses("ITP-250").get(0);
		Course c5 = d.findCourses("CSCI-350").get(0);

		Vector<Course> desiredCourses = new Vector<Course>();
		desiredCourses.add(c1);
		desiredCourses.add(c2);
		desiredCourses.add(c3);
		desiredCourses.add(c4);
		desiredCourses.add(c5);
		
		
		Vector<Vector<Section>> maybe = schedule(desiredCourses);
//		for (int i = 0; i < maybe.size(); i++) {
//			System.out.println("NEW SCHEDULE: ");
//			for (int j = 0; j < maybe.get(i).size(); j++) {
//				System.out.println("	" + maybe.get(i).get(j).sectionID);
//			}
//		}
		
		System.out.println(maybe.size());
	}
	
	
	public Scheduling() {
	}
	
	public static void main(String[] args) {
		testSchedule();
	}
	
	public static Vector<Vector<Section>> schedule(Vector<Course> _courses) {
		courses.clear();
		 
		for (int i = 0; i < _courses.size(); i++) {
			Vector<Vector<Section>> sectionType = _courses.get(i).sections;
			for (int j = 0; j < sectionType.size(); j++) {
				Course c = new Course(_courses.get(i), sectionType.get(j));
				courses.add(c);
			}
		}


//		for (int i = 0; i < courses.size(); i++) {
//			System.out.println("Course: " + courses.get(i).name);
//			for (int j = 0; j < courses.get(i).sections.size(); j++) {
//				Vector<Section> differentSections = courses.get(i).allSections;
//				System.out.println("Section Type: " + differentSections.get(0).sectionType);
//				for (int k = 0; k < differentSections.size(); k++) {
//					System.out.print("\t");
//					differentSections.get(k).printInfo();	
//				}
//			}
//		}

		
		Schedule schedule = new Schedule();
		scheduleHelper(0, schedule);
		
		System.out.println("Final Possible Schedules:");
		System.out.println("Count: " + all.size());


		return all;
		
		
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
			System.out.println("Number of sections: " + s.size());
			for (int i = 0; i < s.size(); i++) {
				s.get(i).printInfo();
			}
			_schedule.printSchedule();
			System.out.println("\n\n");
			return;
		}
		
		Schedule schedule = new Schedule();
		
		Vector<Section> sections = courses.get(index).allSections;
		for (int i = 0; i < sections.size(); i++) {
			
			copy(_schedule, schedule);
//			System.out.println("\nCopy of schedule");
//			_schedule.printSchedule();
			
			if (!schedule.conflicts(sections.get(i))) {
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
//				System.out.println(sections.get(i).sectionID + " conflicts.");
			}
		}
//		System.out.println("End of checking  " + courses.get(index).name);
	}
}
