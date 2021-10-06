package user;
// ���� ��Ű�� database access object

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn; 											//DB�� �����ϰ� ���ִ� ��ü
	private PreparedStatement pstmt;  									//SQL���� �����Ұ��Ӥ�����
	private ResultSet rs;    											//������ ���� ��ü

	public UserDAO() {         											//�� Ŭ������ ������ �� DB�� ����
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
	
	public int login (String userID, String userPassword) {					//�α��ο�
		String SQL="SELECT user_Password FROM USER WHERE user_ID = ?";      //���� ������ ?�� ����ϰ� ���Ŀ� ? ��ġ�� Ư������ ��, �Է��� ID�� userPassword�� ������
		try {
			pstmt=conn.prepareStatement(SQL);      							//SQL�� �ִ� ���� �����ͼ� ��������
			pstmt.setString(1, userID);                                   //?�ڸ��� userID�� ���� �־��ִ°���
			rs=pstmt.executeQuery();                   						//SQL�� ���� ���� ������� ����
			if(rs.next()) {                               					//����� �����Ѵٸ�
				if(rs.getString(1).equals(userPassword)) {    				//������ password�� �Է��� password�� ������
					return 1;             								//�α��μ���
				}
			}
			return -1;                      								//���̵� ����
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //DB������ �ǹ�
	}
	//ȸ������ �޼ҵ�
	public int register(String user_Id, String user_Password, String user_Name, String user_Birth1, String user_Birth2, String user_Birth3, String user_Email1, String user_Email2) {
		
		
		String SQL="INSERT INTO USER VALUES (user_Number,?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";     
		try {
			pstmt = conn.prepareStatement(SQL);      							
			pstmt.setString(1, user_Id);   
			pstmt.setString(2, user_Password);
			pstmt.setString(3, user_Name);
			pstmt.setString(4, user_Birth1+user_Birth2+user_Birth3);
			pstmt.setString(5, user_Email1+"@"+user_Email2);
			return pstmt.executeUpdate();                   				
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	//�ߺ�Ȯ�� �޼���
	public int registerCheck(String user_Id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT * FROM USER WHERE user_ID = ?";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,  user_Id);
			rs = pstmt.executeQuery();
			if(rs.next() || user_Id.equals("")) {
				return 0;
			}else {
				return 1;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
	public String findId(String user_Name, String user_Email) {
		String SQL = "SELECT user_Id FROM user WHERE user_Name=? AND user_Email = ?";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, user_Name);
			pstmt.setString(2, user_Email);
			rs = pstmt.executeQuery();
			rs.next();{
				return rs.getString(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	public String findPassword(String user_Name, String user_Id, String user_Email) {
		String SQL = "SELECT user_Password FROM user WHERE user_Name=? AND user_Id = ? AND user_Email = ?";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, user_Name);
			pstmt.setString(2, user_Id);
			pstmt.setString(3, user_Email);
			rs = pstmt.executeQuery();
			rs.next();{
				return rs.getString(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
}
