package cmt;

public class Comment {
	private int 	vId; 
	private String	vcomment;
	private String	vDate;
	private String	vWriter;
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Comment(int vId, String vcomment, String vDate, String vWriter) {
		super();
		this.vId = vId;
		this.vcomment = vcomment;
		this.vDate = vDate;
		this.vWriter = vWriter;
	}
	public int getvId() {
		return vId;
	}
	public void setvId(int vId) {
		this.vId = vId;
	}
	public String getVcomment() {
		return vcomment;
	}
	public void setVcomment(String vcomment) {
		this.vcomment = vcomment;
	}
	public String getvDate() {
		return vDate;
	}
	public void setvDate(String vDate) {
		this.vDate = vDate;
	}
	public String getvWriter() {
		return vWriter;
	}
	public void setvWriter(String vWriter) {
		this.vWriter = vWriter;
	}

	
	
}
