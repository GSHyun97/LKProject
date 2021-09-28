package user;
// 연동 시키기 database access object

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDAO {
	
	private Connection conn; 											
	private PreparedStatement pstmt;  									
	private ResultSet rs;    											

	public AdminDAO() {         											
		try {
			String dbURL="jdbc:mysql://localhost:3306/KProject";
			String dbID="root";
			String dbPassword="1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int adminlogin(String admin_Id, String admin_Password) {					
		String SQL="SELECT admin_Password FROM ADMIN WHERE admin_Id = ?";     
		try {
			pstmt=conn.prepareStatement(SQL);      						
			pstmt.setString(1, admin_Id);                                  
			rs=pstmt.executeQuery();                   						
			if(rs.next()) {                               					
				if(rs.getString(1).equals(admin_Password)) {    				
					return 1;             								
				}
			}
			return -1;                      								
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
}
