package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class getUserNumberDAO {
	private Connection conn; 											//DB�� �����ϰ� ���ִ� ��ü
	private PreparedStatement pstmt;  									//SQL���� �����Ұ��Ӥ�����
	private ResultSet rs;    											//������ ���� ��ü

	public getUserNumberDAO() {         											//�� Ŭ������ ������ �� DB�� ����
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
	public int getUserNumber(String user_Id) {
		String SQL = "SELECT user_Number FROM user WHERE user_Id=?";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, user_Id);
			rs = pstmt.executeQuery();
			rs.next();{
				return rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
		
	}
}
