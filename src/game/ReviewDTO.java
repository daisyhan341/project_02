package game;

//DTO(Data Transfer Object): JSP와 MYSQL이 서로 데이터를 전달하기 위한 단위
public class ReviewDTO {  // 사용할 속성을 변수로 선언
	private int gr_num;
	private int gr_gnum;
	private String gr_cont;
	private String gr_nick;
	private double gr_score;
	private String mem_id;
	private String gr_date;
	
	public String getGr_date() {
		return gr_date;
	}
	public void setGr_date(String gr_date) {
		this.gr_date = gr_date;
	}
	public int getGr_num() {
		return gr_num;
	}
	public void setGr_num(int gr_num) {
		this.gr_num = gr_num;
	}
	public int getGr_gnum() {
		return gr_gnum;
	}
	public void setGr_gnum(int gr_gnum) {
		this.gr_gnum = gr_gnum;
	}
	public String getGr_cont() {
		return gr_cont;
	}
	public void setGr_cont(String gr_cont) {
		this.gr_cont = gr_cont;
	}
	public String getGr_nick() {
		return gr_nick;
	}
	public void setGr_nick(String gr_nick) {
		this.gr_nick = gr_nick;
	}
	public double getGr_score() {
		return gr_score;
	}
	public void setGr_score(double gr_score) {
		this.gr_score = gr_score;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
}
