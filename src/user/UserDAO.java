package user;
// ���� ��Ű�� database access object

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn; 											//DB�� �����ϰ� ���ִ� ��ü
	private PreparedStatement pstmt;  									//SQL���� �����Ұ���
	private ResultSet rs;    											//������ ���� ��ü

	public UserDAO() {         											//�� Ŭ������ ������ �� DB�� ����
		try {
			String dbURL="jdbc:mysql://localhost:3306/KProject";
			String dbID="root";
			String dbPassword="1234";
			Class.forName("com.mysql.jdbc.Drvier");
			conn=DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {					//�α��ο�
		String SQL="SELECT userPassword FROM USER WHERE userID = ?";      //���� ������ ?�� ����ϰ� ���Ŀ� ? ��ġ�� Ư������ ��, �Է��� ID�� userPassword�� ������
		try {
			pstmt=conn.prepareStatement(SQL);      							//SQL�� �ִ� ���� �����ͼ� ��������
			pstmt.setString(1, userID);                                   //?�ڸ��� userID�� ���� �־��ִ°���
			rs=pstmt.executeQuery();                   						//SQL�� ���� ���� ������� ����
			if(rs.next()) {                               					//����� �����Ѵٸ�
				if(rs.getString(1).equals(userPassword)) {    				//������ password�� �Է��� password�� ������
					return 1;               								//�α��μ���
				}
			}
			return -1;                      								//���̵� ����
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //DB������ �ǹ�
	}
	
}
