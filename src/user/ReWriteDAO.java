package user;
// ���� ��Ű�� database access object

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class ReWriteDAO {
	private Connection conn; 											//DB�� �����ϰ� ���ִ� ��ü
	private PreparedStatement pstmt;  									//SQL���� �����Ұ���
	private ResultSet rs;    											//������ ���� ��ü

	public ReWriteDAO() {         											//�� Ŭ������ ������ �� DB�� ����
		try {
			String dbURL="jdbc:mysql://localhost:3306/KProject";
			String dbID="root";
			String dbPassword="1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void ViewReWriteDAO(int num) {
		String SQL ="UPDATE post SET post_View=post_View+1 WHERE post_number=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("Exception");
		}
	}
	
}