package user;
// 연동 시키기 database access object

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn; 											//DB에 접근하게 해주는 객체
	private PreparedStatement pstmt;  									//SQL문장 삽입할거임ㄴㅇㅁ
	private ResultSet rs;    											//정보를 담을 객체

	public UserDAO() {         											//이 클래스가 생성될 때 DB와 연결
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
	
	public int login (String userID, String userPassword) {					//로그인용
		String SQL="SELECT user_Password FROM USER WHERE user_ID = ?";      //보안 때문에 ?를 사용하고 추후에 ? 위치에 특정값이 들어감, 입력한 ID의 userPassword를 가져옴
		try {
			pstmt=conn.prepareStatement(SQL);      							//SQL에 있는 문장 가져와서 넣을거임
			pstmt.setString(1, userID);                                   //?자리에 userID의 값을 넣어주는거임
			rs=pstmt.executeQuery();                   						//SQL에 문장 넣은 결과값을 저장
			if(rs.next()) {                               					//결과가 존재한다면
				if(rs.getString(1).equals(userPassword)) {    				//가져온 password가 입력한 password와 같으면
					return 1;             								//로그인성공
				}
			}
			return -1;                      								//아이디가 없음
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //DB오류를 의미
	}
	//회원가입 메소드
	public int register(String user_Id, String user_Password, String user_Name, String user_Birth1, String user_Birth2, String user_Birth3, String user_Email1, String user_Email2) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL="INSERT INTO USER VALUES (?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";     
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
		}finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
		}catch(Exception e){
			e.printStackTrace();
			}
		}
		return -1;
	}
	//중복확인 메서드
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
		System.out.println("add실행");
		String SQL = "SELECT user_Id FROM user WHERE user_Name=? AND user_Email = ?";
		System.out.println("sql생성");
		try {
			pstmt=conn.prepareStatement(SQL);
			System.out.println("1실행");
			pstmt.setString(1, user_Name);
			System.out.println("2실행");
			pstmt.setString(2, user_Email);
			System.out.println("3실행");
			rs = pstmt.executeQuery();
			System.out.println("rs실행");
			rs.next();
				System.out.println("if실행");
				return rs.getString(1);
		}catch(Exception e){
			e.printStackTrace();
		}//sdasadsadsadada
		return null;
	}
}
