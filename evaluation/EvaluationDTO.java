package evaluation;

public class EvaluationDTO {
	private String evaluation_user;
	private String evaluation_course;
	private int evaluation_level;
	private int evaluation_hour;
	private int evaluation_minute;
	private int evaluation_recommend;
	private String evaluation_info;
	
	
	
	public String getEvaluation_user() {
		return evaluation_user;
	}
	public void setEvaluation_user(String evaluation_user) {
		this.evaluation_user = evaluation_user;
	}
	public String getEvaluation_course() {
		return evaluation_course;
	}
	public void setEvaluation_course(String evaluation_course) {
		this.evaluation_course = evaluation_course;
	}
	public int getEvaluation_level() {
		return evaluation_level;
	}
	public void setEvaluation_level(int evaluation_level) {
		this.evaluation_level = evaluation_level;
	}
	public int getEvaluation_hour() {
		return evaluation_hour;
	}
	public void setEvaluation_hour(int evaluation_hour) {
		this.evaluation_hour = evaluation_hour;
	}
	public int getEvaluation_minute() {
		return evaluation_minute;
	}
	public void setEvaluation_minute(int evaluation_minute) {
		this.evaluation_minute = evaluation_minute;
	}
	public int getEvaluation_recommend() {
		return evaluation_recommend;
	}
	public void setEvaluation_recommend(int evaluation_recommend) {
		this.evaluation_recommend = evaluation_recommend;
	}
	public String getEvaluation_info() {
		return evaluation_info;
	}
	public void setEvaluation_info(String evaluation_info) {
		this.evaluation_info = evaluation_info;
	}
	public EvaluationDTO(String evaluation_user, String evaluation_course, int evaluation_level, int evaluation_hour,
			int evaluation_minute, int evaluation_recommend, String evaluation_info) {
		this.evaluation_user = evaluation_user;
		this.evaluation_course = evaluation_course;
		this.evaluation_level = evaluation_level;
		this.evaluation_hour = evaluation_hour;
		this.evaluation_minute = evaluation_minute;
		this.evaluation_recommend = evaluation_recommend;
		this.evaluation_info = evaluation_info;
	}
	public EvaluationDTO() {}
	
}
