package course;

public class CourseDTO {
	private String course_id;
	private String course_name;
	private double course_length;
	private int course_hour;
	private int course_hour2;
	private int course_level;
	private String course_start;
	private String course_middle;
	private String course_finish;
	
	public String getCourse_id() {
		return course_id;
	}
	public void setCourse_id(String course_id) {
		this.course_id = course_id;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public double getCourse_length() {
		return course_length;
	}
	public void setCourse_length(double course_length) {
		this.course_length = course_length;
	}
	public int getCourse_hour() {
		return course_hour;
	}
	public void setCourse_hour(int course_hour) {
		this.course_hour = course_hour;
	}
	public int getCourse_hour2() {
		return course_hour2;
	}
	public void setCourse_hour2(int course_hour2) {
		this.course_hour2 = course_hour2;
	}
	public int getCourse_level() {
		return course_level;
	}
	public void setCourse_level(int course_level) {
		this.course_level = course_level;
	}
	
	public String getCourse_start() {
		return course_start;
	}
	public void setCourse_start(String course_start) {
		this.course_start = course_start;
	}
	public String getCourse_middle() {
		return course_middle;
	}
	public void setCourse_middle(String course_middle) {
		this.course_middle = course_middle;
	}
	public String getCourse_finish() {
		return course_finish;
	}
	public void setCourse_finish(String course_finish) {
		this.course_finish = course_finish;
	}
	public CourseDTO(String course_id, String course_name, double course_length, int course_hour, int course_hour2,
			int course_level, String course_start, String course_middle, String course_finish) {
		
		this.course_id = course_id;
		this.course_name = course_name;
		this.course_length = course_length;
		this.course_hour = course_hour;
		this.course_hour2 = course_hour2;
		this.course_level = course_level;
		this.course_start = course_start;
		this.course_middle = course_middle;
		this.course_finish = course_finish;
	}
	public CourseDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	
}
