package test002;
// ���� ��Ű�� database access object

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PostDAO {
	
	private Connection conn; 											//DB�� �����ϰ� ���ִ� ��ü
	private PreparedStatement pstmt;  									//SQL���� �����Ұ���
	private ResultSet rs;    											//������ ���� ��ü

	public PostDAO() {         											//�� Ŭ������ ������ �� DB�� ����
		try {
			String dbURL="jdbc:mysql://localhost:3306/KProject";
			String dbID="root";
			String dbPassword="1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL, dbID, dbPassword);
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
//	auto increment ���� null�� �����ؼ� ī��Ʈ
	public int write(PostDTO write) {
		String SQL = "INSERT INTO POST VALUES (NULL, ? , ? , ? , 0 , 0 , 0 , ?)";

		try {
			pstmt = conn.prepareStatement(SQL);
//			pstmt.setInt(1,write.getPost_count()); //����1
			pstmt.setString(1,write.getPost_Title());
			pstmt.setString(2,write.getPost_Link());
			pstmt.setString(3,write.getPost_Hashtag());
//			pstmt.setInt(?,write.getPost_View()); //����5
//			pstmt.setInt(?,write.getPost_Like()); //����6
//			pstmt.setInt(?,write.getPost_Report()); //����7
			pstmt.setString(4,write.getPost_UploadDate());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		//db������ -1
		return -1;
	}
//	// 6�� ������ ������
//	public ArrayList<PostDTO> getList(int pagenumber){
//		String SQL = "SELECT * FROM post WHERE post_count < ? = ORDER BY post_count DESC LIMIT 6";
//		ArrayList<PostDTO> list = new ArrayList<PostDTO>();
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(SQL);
//			pstmt.setInt(1, getC - (pagenumber-1) *10);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				PostDTO postDTO = new PostDTO();
//				postDTO.setPost_Title(rs.getString(1));
//				postDTO.setPost_Link(rs.getString(2));
//				postDTO.setPost_Hashtag(rs.getString(3));
//				postDTO.setPost_UploadDate(rs.getString(4));
//				list.add(postDTO);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return list;
//	}


}





