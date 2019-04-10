import java.util.Scanner;

// Just a convenient class to store the section times

public class Time {
	public String startTime = "";
	public String endTime = "";
	public String AMPM = "";
//	int duration; // Can add in later if needed
	
	public Time(String in) {
		String flatStart = "";
		String flatEnd = "";
		
		boolean start = true;
		
		int i = 0;
		// Expects a string formatted like so: 
		for (i = 0; i < in.length(); i++) {
			if (in.charAt(i) == ':') {
				if (start) startTime += in.charAt(i);
				else endTime += in.charAt(i);
			}
			else if (in.charAt(i) == '-') {
				start = false;
			}
			else if (in.charAt(i) == 'A') {
				AMPM = "AM";
				break;
			}
			else if (in.charAt(i) == 'P') {
				AMPM = "FM";
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
//		System.out.println("flatStart: " + flatStart);
//		System.out.println("flatEnd: " + flatEnd);
//		System.out.println("start: " + startTime);
//		System.out.println("end: " + endTime);
//		System.out.println("formatted: " + getFormattedTime());

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
