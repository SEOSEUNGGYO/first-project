package accompany;

public class AccompanyDTO {
	private String accompany_course;
	private String accompany_host;
	private int accompany_year;
	private int accompany_month;
	private int accompany_date;
	private int accompany_hour;
	private int accompany_minute;
	private int accompany_headcount;
	private String accompany_info;
	
	
	public String getAccompany_course() {
		return accompany_course;
	}
	public void setAccompany_course(String accompany_course) {
		this.accompany_course = accompany_course;
	}
	public String getAccompany_host() {
		return accompany_host;
	}
	public void setAccompany_host(String accompany_host) {
		this.accompany_host = accompany_host;
	}
	public int getAccompany_year() {
		return accompany_year;
	}
	public void setAccompany_year(int accompany_year) {
		this.accompany_year = accompany_year;
	}
	public int getAccompany_month() {
		return accompany_month;
	}
	public void setAccompany_month(int accompany_month) {
		this.accompany_month = accompany_month;
	}
	public int getAccompany_date() {
		return accompany_date;
	}
	public void setAccompany_date(int accompany_date) {
		this.accompany_date = accompany_date;
	}
	public int getAccompany_hour() {
		return accompany_hour;
	}
	public void setAccompany_hour(int accompany_hour) {
		this.accompany_hour = accompany_hour;
	}
	public int getAccompany_minute() {
		return accompany_minute;
	}
	public void setAccompany_minute(int accompany_minute) {
		this.accompany_minute = accompany_minute;
	}
	public int getAccompany_headcount() {
		return accompany_headcount;
	}
	public void setAccompany_headcount(int accompany_headcount) {
		this.accompany_headcount = accompany_headcount;
	}
	public String getAccompany_info() {
		return accompany_info;
	}
	public void setAccompany_info(String accompany_info) {
		this.accompany_info = accompany_info;
	}
	
	
	public AccompanyDTO(String accompany_course, String accompany_host, int accompany_year, int accompany_month,
			int accompany_date, int accompany_hour, int accompany_minute, int accompany_headcount,
			String accompany_info) {
		
		this.accompany_course = accompany_course;
		this.accompany_host = accompany_host;
		this.accompany_year = accompany_year;
		this.accompany_month = accompany_month;
		this.accompany_date = accompany_date;
		this.accompany_hour = accompany_hour;
		this.accompany_minute = accompany_minute;
		this.accompany_headcount = accompany_headcount;
		this.accompany_info = accompany_info;
	}
	public AccompanyDTO() {}
	
	
	
	
}
