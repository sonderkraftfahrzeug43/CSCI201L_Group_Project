package Scraping;
import java.util.Scanner;
import java.util.Vector;

public class Scheduling {
	private static Vector<Vector<Section>> all = new Vector<Vector<Section>>();
	private static Vector<Vector<Section>> possible = new Vector<Vector<Section>>();
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
	
	
	public Scheduling() {
	}
	
	public static void main(String[] args) {
		testSearch();
//		Data d = new Data();
//		Vector<Department> dep = d.getDepartments();
		
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
		
			
		
		
//		Vector<Course> c = d.findCourses("Software Development");
//		Course cs201 = c.get(0);
//		Schedule s = new Schedule();
//		Schedule s2 = new Schedule(s);
//		
//		s.addSection(cs201.sections.get(0));
//		
//		c = d.findCourses("Introduction to Algorithms");
//		Course cs270 = c.get(0);
//		s.addSection(cs270.sections.get(0));
//		
//		
//		
//		
//		s.addSection(d.findCourses("Data Structures").get(0).sections.get(0));
//		System.out.println("s2");
//		s2.printSchedule();
//		System.out.println("\ns");
//		s.printSchedule();
		
		
//		c.clear();
//		c.add(cs201);
//		c.add(cs270);
		
//		schedule(c);
//		for (int i = 0 ; i < all.size(); i++) {
//			System.out.println("NEW COMBINATION: ");
//			for (int j = 0; j < all.get(i).size(); j++) {
//				System.out.println(all.get(i).get(j).sectionID);
//			}
//			System.out.println();
//			
//		}
			
		


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
	
	private static void scheduleHelper(int index, Schedule _schedule) {
		Schedule schedule = _schedule;
		
		// If you reach the end, do nothing
		if (index == courses.size()) {
			System.out.println("Index: " + index);
			all.add(schedule.sections);
			Vector<Section> s = schedule.sections;
			for (int i = 0; i < s.size(); i++) {
				System.out.println(s.get(i).sectionID);
			}
			schedule.printSchedule();
			System.out.println("\n\n");
			return;
		}
		
		
		boolean allConflicts = true;
		Vector<Section> sections = courses.get(index).sections;
		for (int i = 0; i < sections.size(); i++) {
			schedule = new Schedule(_schedule);
			System.out.println("Trying " + sections.get(i).sectionID + "\n");
			schedule.printSchedule();
			
			if (!schedule.conflicts(sections.get(i))) {
				
//				schedule.printSchedule();
				System.out.println();
				allConflicts = false;
				scheduleHelper(index+1, schedule.addSection(sections.get(i)));
				
//				System.out.println("after rec call");
//				_schedule.printSchedule();
				
			}
		}
	}
}
