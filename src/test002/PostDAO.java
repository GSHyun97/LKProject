package test002;
// 연동 시키기 database access object

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PostDAO {
	
	private Connection conn; 											//DB에 접근하게 해주는 객체
	private PreparedStatement pstmt;  									//SQL문장 삽입할거임
	private ResultSet rs;    											//정보를 담을 객체

	public PostDAO() {         											//이 클래스가 생성될 때 DB와 연결
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
	
	public int login(String userID, String userPassword) {					//로그인용
		String SQL="SELECT user_Password FROM USER WHERE user_ID = ?";      //보안 때문에 ?를 사용하고 추후에 ? 위치에 특정값이 들어감, 입력한 ID의 userPassword를 가져옴
		try {
			pstmt=conn.prepareStatement(SQL);      							//SQL에 있는 문장 가져와서 넣을거임
			pstmt.setString(1, userID);                                   //?자리에 userID의 값을 넣어주는거임
			rs=pstmt.executeQuery();                   						//SQL에 문장 넣은 결과값을 저장
			if(rs.next()) {                               					//결과가 존재한다면
				if(rs.getString(1).equals(userPassword)) {    				//가져온 password가 입력한 password와 같으면
					return 1;               								//로그인성공
				}
			}
			return -1;                      								//아이디가 없음
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //DB오류를 의미
	}
//	auto increment 값은 null로 시작해서 카운트
	public int write(PostDTO write) {
		String SQL = "INSERT INTO POST VALUES (NULL, ? , ? , ? , 0 , 0 , 0 , ?)";

		try {
			pstmt = conn.prepareStatement(SQL);
//			pstmt.setInt(1,write.getPost_count()); //정수1
			pstmt.setString(1,write.getPost_Title());
			pstmt.setString(2,write.getPost_Link());
			pstmt.setString(3,write.getPost_Hashtag());
//			pstmt.setInt(?,write.getPost_View()); //정수5
//			pstmt.setInt(?,write.getPost_Like()); //정수6
//			pstmt.setInt(?,write.getPost_Report()); //정수7
			pstmt.setString(4,write.getPost_UploadDate());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		//db오류시 -1
		return -1;
	}
//	// 6개 까지만 가져옴
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





