package user;
// 연동 시키기 database access object

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn; 											//DB에 접근하게 해주는 객체
	private PreparedStatement pstmt;  									//SQL문장 삽입할거임
	private ResultSet rs;    											//정보를 담을 객체

	public UserDAO() {         											//이 클래스가 생성될 때 DB와 연결
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
	
	public int login(String userID, String userPassword) {					//로그인용
		String SQL="SELECT userPassword FROM USER WHERE userID = ?";      //보안 때문에 ?를 사용하고 추후에 ? 위치에 특정값이 들어감, 입력한 ID의 userPassword를 가져옴
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
	
}
