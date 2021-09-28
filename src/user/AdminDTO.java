package user;

public class AdminDTO {
	
	private String admin_Id;
	private String admin_Password;
	private int admin_TotalView;
	
	public String getAdmin_Id() {
		return admin_Id;
	}
	public void setAdmin_Id(String admin_Id) {
		this.admin_Id = admin_Id;
	}
	public String getAdmin_Password() {
		return admin_Password;
	}
	public void setAdmin_Password(String admin_Password) {
		this.admin_Password = admin_Password;
	}
	public int getAdmin_TotalView() {
		return admin_TotalView;
	}
	public void setAdmin_TotalView(int admin_TotalView) {
		this.admin_TotalView = admin_TotalView;
	}
}
