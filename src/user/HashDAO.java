package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class HashDAO {
	private Connection conn; 											//DB에 접근하게 해주는 객체
	private PreparedStatement pstmt;  									//SQL문장 삽입할거임
	private ResultSet rs;    											//정보를 담을 객체

	public HashDAO() {         											//이 클래스가 생성될 때 DB와 연결
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
	
	public String[] HashRanking(int num) {
		String SQL="select hashtag_Name from hashtag order by hashtag_View desc limit ?";
		String[] hashRank=new String[num];
	 
		try{
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, num);    
			rs=pstmt.executeQuery();
			for(int i=0;i<num;i++) {
				rs.next();
				hashRank[i]=rs.getString(1);
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return hashRank;
		
	}
	public String[] HashRankingView(int num) {
		String SQL="select hashtag_View from hashtag order by hashtag_View desc limit ?";
		String[] hashRank=new String[num];
	 
		try{
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, num);    
			rs=pstmt.executeQuery();
			for(int i=0;i<num;i++) {
				rs.next();
				hashRank[i]=rs.getString(1);
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return hashRank;
		
	}
}
