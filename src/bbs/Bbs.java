package bbs;

public class Bbs {
	private int bbsID;
	private String bbsTitle;
	private String bbsNick;
	private String bbsDate;
	private String bbsContent;
	private int bbsAvailable; // �����Ͱ� ���� �ƴ��� �ȵƴ���
	private int rnd; // ��ȸ��
	
	public int getBbsID() {
		return bbsID;
	}
	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}
	public String getBbsTitle() {
		return bbsTitle;
	}
	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}
	
	public String getBbsNick() {
		return bbsNick;
	}
	public void setBbsNick(String bbsNick) {
		this.bbsNick = bbsNick;
	}
	public String getBbsDate() {
		return bbsDate;
	}
	public void setBbsDate(String bbsDate) {
		this.bbsDate = bbsDate;
	}
	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
	public int getBbsAvailable() {
		return bbsAvailable;
	}
	public void setBbsAvailable(int bbsAvailable) {
		this.bbsAvailable = bbsAvailable;
	}
	
	  public int getRnd() {
		  return rnd;
	}
	  public void setRnd(int rnd){ 
		  this.rnd = rnd;
	}
	 

}
