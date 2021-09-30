package user;
// 연동 시키기 database access object

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class ReWriteDAO {
	private Connection conn; 											//DB에 접근하게 해주는 객체
	private PreparedStatement pstmt;  									//SQL문장 삽입할거임
	private ResultSet rs;    											//정보를 담을 객체

	public ReWriteDAO() {         											//이 클래스가 생성될 때 DB와 연결
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
	
	public void ViewReWrite(int num) {
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
	
	public void hashtagViewReWrite(int num) {
		String[] array=(new PostDAO().seeHashtag(num)).split("#");
		String SQL="UPDATE hashtag SET hashtag_View=hashtag_View+1 WHERE hashtag_Name=?";
		try {
			for(int i=1;i<array.length;i++) {
				pstmt=conn.prepareStatement(SQL);
				pstmt.setString(1, array[i]);
				pstmt.executeUpdate();
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void ReportReWrite(int num) {
		String SQL ="UPDATE post SET post_Report= post_Report+1 WHERE post_Number=?";
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