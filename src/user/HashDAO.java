package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class HashDAO {
	private Connection conn; 											//DB�� �����ϰ� ���ִ� ��ü
	private PreparedStatement pstmt;  									//SQL���� �����Ұ���
	private ResultSet rs;    											//������ ���� ��ü

	public HashDAO() {         											//�� Ŭ������ ������ �� DB�� ����
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
	
	public String[] HashRanking() {
		String SQL="select hashtag_Name from hashtag order by hashtag_View desc limit 6";
		String[] hashRank=new String[6];
	
		try{
			pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			for(int i=0;i<6;i++) {
				rs.next();
				hashRank[i]=rs.getString(1);
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return hashRank;
		
	}
}
