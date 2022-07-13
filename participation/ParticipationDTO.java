package participation;

public class ParticipationDTO {
	private String participation_host;
	private String participation_course;
	private String participation_participants;
	private int participation_year;
	private int participation_month;
	private	int participation_date;
	
	
	public String getParticipation_host() {
		return participation_host;
	}
	public void setParticipation_host(String participation_host) {
		this.participation_host = participation_host;
	}
	public String getParticipation_course() {
		return participation_course;
	}
	public void setParticipation_course(String participation_course) {
		this.participation_course = participation_course;
	}
	public String getParticipation_participants() {
		return participation_participants;
	}
	public void setParticipation_participants(String participation_participants) {
		this.participation_participants = participation_participants;
	}
	
	
	public int getParticipation_year() {
		return participation_year;
	}
	public void setParticipation_year(int participation_year) {
		this.participation_year = participation_year;
	}
	public int getParticipation_month() {
		return participation_month;
	}
	public void setParticipation_month(int participation_month) {
		this.participation_month = participation_month;
	}
	public int getParticipation_date() {
		return participation_date;
	}
	public void setParticipation_date(int participation_date) {
		this.participation_date = participation_date;
	}
	
	
	public ParticipationDTO(String participation_host, String participation_course, String participation_participants,int participation_year, int participation_month, int participation_date) {
		
		this.participation_host = participation_host;
		this.participation_course = participation_course;
		this.participation_participants = participation_participants;
		this.participation_year = participation_year;
		this.participation_month = participation_month;
		this.participation_date = participation_date;
	}
	
	
	public ParticipationDTO() {}
	
	
}
