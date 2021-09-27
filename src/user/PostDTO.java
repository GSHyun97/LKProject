package user;

public class PostDTO {
	
	private int post_count;
	private String post_Title;
	private String post_Link;
	private String post_Hashtag;
	private int post_View;
	private int post_Like;
	private int post_Report;
	private String post_UploadDate;
	
	
	public int getPost_count() {
		return post_count;
	}
	public void setPost_count(int post_count) {
		this.post_count = post_count;
	}
	public String getPost_Title() {
		return post_Title;
	}
	public void setPost_Title(String post_Title) {
		this.post_Title = post_Title;
	}
	public String getPost_Link() {
		return post_Link;
	}
	public void setPost_Link(String post_Link) {
		this.post_Link = post_Link;
	}
	public String getPost_Hashtag() {
		return post_Hashtag;
	}
	public void setPost_Hashtag(String post_Hashtag) {
		this.post_Hashtag = post_Hashtag;
	}
	public int getPost_View() {
		return post_View;
	}
	public void setPost_View(int post_View) {
		this.post_View = post_View;
	}
	public int getPost_Like() {
		return post_Like;
	}
	public void setPost_Like(int post_Like) {
		this.post_Like = post_Like;
	}
	public int getPost_Report() {
		return post_Report;
	}
	public void setPost_Report(int post_Report) {
		this.post_Report = post_Report;
	}
	public String getPost_UploadDate() {
		return post_UploadDate;
	}
	public void setPost_UploadDate(String post_UploadDate) {
		this.post_UploadDate = post_UploadDate;
	}
	
	public PostDTO() {
		
	}
	
	public PostDTO(int post_count, String post_Title, String post_Link, String post_Hashtag, int post_View,
			int post_Like, int post_Report, String post_UploadDate) {
		super();
		this.post_count = post_count;
		this.post_Title = post_Title;
		this.post_Link = post_Link;
		this.post_Hashtag = post_Hashtag;
		this.post_View = post_View;
		this.post_Like = post_Like;
		this.post_Report = post_Report;
		this.post_UploadDate = post_UploadDate;
	}

}
