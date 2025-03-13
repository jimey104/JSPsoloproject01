package cmt;

public class Comment {
	private int 	vId; 
	private String 	mId;
	private String	vComment;
	private String	vDate;
	private String	vWriter;

	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Comment(int vId, String mId, String vComment, String vDate, String vWriter) {
		super();
		this.vId = vId;
		this.mId = mId;
		this.vComment = vComment;
		this.vDate = vDate;
		this.vWriter = vWriter;
	}
	public int getvId() {
		return vId;
	}
	public void setvId(int vId) {
		this.vId = vId;
	}
	public String getvComment() {
		return vComment;
	}
	public void setvComment(String vComment) {
		this.vComment = vComment;
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
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	
	
}
