import java.util.Scanner;

// Just a convenient class to store the section times

public class Time {
	
	public String startTime = "";
	public String endTime = "";
	
	public int militaryStart;
	public int militaryEnd;
	
	public String AMPM = "";
	
	// Is true if the class goes past noon
	public boolean jumps = false;
//	int duration; // Can add in later if needed
	
	// Expects input such as "9:30-10:50AM"
	public Time(String in) {
		String flatStart = "";
		String flatEnd = "";
		in.toLowerCase();
		boolean start = true;
		if (in.toLowerCase().contains("tba")) {
			startTime = null;
			endTime = null;
			AMPM = null;
			militaryStart = -1;
			militaryEnd = -1;
			return;
		}
		int i = 0;
		// Expects a string formatted like so: 
		for (i = 0; i < in.length(); i++) {
//			System.out.println("end: " + flatEnd);
			if (in.charAt(i) == ':') {
				if (start) startTime += in.charAt(i);
				else endTime += in.charAt(i);
			}
			else if (in.charAt(i) == '-') {
				start = false;
			}
			else if (in.charAt(i) == 'a') {
				AMPM = "AM";
				break;
			}
			else if (in.charAt(i) == 'p') {
				AMPM = "PM";
				break;
			}
			else if (start) {
				flatStart += in.charAt(i);
				startTime += in.charAt(i);
			}
			else {
				flatEnd += in.charAt(i);
				endTime += in.charAt(i);
			}
		}
		
		militaryStart = Integer.parseInt(flatStart);
		militaryEnd = Integer.parseInt(flatEnd);
		
//		System.out.println(startTime + " vs " + endTime);
		if (startTime.length() > endTime.length()) {
//			System.out.println(startTime + " vs " + endTime);
			jumps = true;
		}
		
		if (AMPM.contentEquals("PM")) {
//			System.out.println("PM");
			militaryEnd += 1200;
			if (!jumps) militaryStart += 1200;
			
		}
		
//		System.out.println("flatStart: " + flatStart);
//		System.out.println("flatEnd: " + flatEnd);
//		System.out.println("start: " + startTime);
//		System.out.println("end: " + endTime);
//		System.out.println("formatted: " + getFormattedTime());
//		if (AMPM.contentEquals("PM") && !jumps) {
//			System.out.println("				milStart: " + militaryStart + " vs " + flatStart);
//			System.out.println("				milEnd: " + militaryEnd + " vs " + flatEnd);
//		}

	}
	
	// Prints the original formatted time
	public String getFormattedTime() {
		return startTime + "-" + endTime + AMPM;
	}
	
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		String line = scan.nextLine();
		@SuppressWarnings("unused")
		Time t = new Time(line);
		

		scan.close();

		
	}
}
