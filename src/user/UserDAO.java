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
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {					//�α��ο�
		String SQL="SELECT user_Password FROM USER WHERE user_ID = ?";      //���� ������ ?�� ����ϰ� ���Ŀ� ? ��ġ�� Ư������ ��, �Է��� ID�� userPassword�� ������
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
	//ȸ������ �޼ҵ�
	public int addMember(dbgetset user) {					
		String SQL="INSERT INTO USER VALUES (?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";     
		try {
			pstmt=conn.prepareStatement(SQL);      							
			pstmt.setString(1, user.getUser_Id());   
			pstmt.setString(2, user.getUser_Password());
			pstmt.setString(3, user.getUser_Name());
			pstmt.setString(4, user.getUser_Birth1()+user.getUser_Birth2()+user.getUser_Birth3());
			pstmt.setString(5, user.getUser_Email1()+"@"+user.getUser_Email2());
			return pstmt.executeUpdate();                   				
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //DB������ �ǹ�
	}
}
/*
 * //���̵� �ߺ�üũ public int addIdCheck(String userID){ String SQL =
 * "select id from fun_member where id=?"; try {
 * pstmt=conn.prepareStatement(SQL); pstmt.setString(1, user.getUser_Id()); rs =
 * pstmt.executeQuery(); if(rs.next()){ if; }else{ result = 1; }
 * 
 * System.out.println("���̵� �ߺ�üũ��� : "+result); } catch (Exception e) { // TODO
 * Auto-generated catch block e.printStackTrace(); } finally { closeDB(); }
 * return result; }
 */