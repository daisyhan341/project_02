package game;

//DTO(Data Transfer Object): JSP와 MYSQL이 서로 데이터를 전달하기 위한 단위
public class GameDTO {  // 사용할 속성을 변수로 선언
	private int gm_num;
	private String gm_name;
	private String gm_cont;
	private String gm_thn;
	private double gm_mark;
	private int gm_rmd;
	private String gm_keyword;
	
	public int getGm_num() {
		return gm_num;
	}
	public void setGm_num(int gm_num) {
		this.gm_num = gm_num;
	}
	public String getGm_name() {
		return gm_name;
	}
	public void setGm_name(String gm_name) {
		this.gm_name = gm_name;
	}
	public String getGm_cont() {
		return gm_cont;
	}
	public void setGm_cont(String gm_cont) {
		this.gm_cont = gm_cont;
	}
	public String getGm_thn() {
		return gm_thn;
	}
	public void setGm_thn(String gm_thn) {
		this.gm_thn = gm_thn;
	}
	public double getGm_mark() {
		return gm_mark;
	}
	public void setGm_mark(double gm_mark) {
		this.gm_mark = gm_mark;
	}
	public int getGm_rmd() {
		return gm_rmd;
	}
	public void setGm_rmd(int gm_rmd) {
		this.gm_rmd = gm_rmd;
	}
	public String getGm_keyword() {
		return gm_keyword;
	}
	public void setGm_keyword(String gm_keyword) {
		this.gm_keyword = gm_keyword;
	}
}
