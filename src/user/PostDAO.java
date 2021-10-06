package user;
// 연동 시키기 database access object

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
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
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public int seeNumber(String originalAddress) {
		String sql="SELECT post_Number FROM post WHERE post_Link=?";
		
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, originalAddress);
			rs=pstmt.executeQuery();
			rs.next();
		return rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
            try {if(conn != null) {conn.close();}} catch (Exception e) {e.printStackTrace();}
            try {if(pstmt != null){pstmt.close();}}catch (Exception e) {e.printStackTrace();}
            try {if(rs != null)   {rs.close();}}   catch (Exception e) {e.printStackTrace();}
        }
		return -1;
		
	}
	public String seeTitle(int num) {
		String sql="SELECT * FROM post WHERE post_Number=? AND post_seeState=1";
		
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
		rs=pstmt.executeQuery();
		rs.next();
		return rs.getString(2);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	
	}
	public String seeVideo(int num) {
		String sql="SELECT * FROM post WHERE post_Number=?";
		
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
		rs=pstmt.executeQuery();
		rs.next();
		return rs.getString(3);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public String seeHashtag(int num) {
		String SQL="SELECT * FROM post WHERE post_Number=?";
		
		try{
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, num);
		rs=pstmt.executeQuery();
		rs.next();
		return rs.getString(4);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public String seeUploadDate(int num) {
		String sql="SELECT * FROM post WHERE post_Number=?";
		
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
		rs=pstmt.executeQuery();
		rs.next();
		return rs.getString(5);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public String seeView(int num) {
		String sql="SELECT * FROM post WHERE post_Number=?";
		
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			rs.next();
			return rs.getString(6);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public String seeLike(int num) {
		String sql="SELECT * FROM post WHERE post_Number=?";
		
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
		rs=pstmt.executeQuery();
		rs.next();
		return rs.getString(7);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String seeReport(int num) {
		String sql="SELECT * FROM post WHERE post_Number=?";
		
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
		rs=pstmt.executeQuery();
		rs.next();
		return rs.getString(8);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public int dbCount(String str) {
		String sql="SELECT COUNT(*) FROM post";
		try {
			pstmt=conn.prepareStatement(sql);
			//pstmt.setString(1, str);
			rs=pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int write(String post_Title, String post_Link, String post_Hashtag, int post_User) {
        String SQL = "INSERT INTO POST VALUES (post_Number, ?, ?, ?, CURRENT_TIMESTAMP , 0 , 0 ,0, 1, ?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1,post_Title);
            pstmt.setString(2,post_Link);
            pstmt.setString(3,post_Hashtag);
            pstmt.setInt(4,post_User);
            HashSearch(post_Hashtag);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        //db오류시 -1
        return -1;
	}
	public void HashSearch(String post_Hashtag) {   
		//String str="#아이패드#애플워치#애플#갤럭시#갤럭시Z플립3#스마트폰#갤럭시워치4#갤럭시#스마트워치#애플TV#애플#마술#김준표#오킹#마술#김준표#침착맨#승우아빠#이원일#토마호크#스테이크#요리#승우아빠#에일리#양자컴퓨터#양자역학#과학#테넷#크리스토퍼놀란#영화#SF#양자역학#과학#테넷#상대성이론#광속불변의법칙#광속불변#과학#김준표#마술#여캠#롤#탈론#미키#강의#롤#라이즈#미키#강의#롤#이렐리아#미키#강의#오징어게임#넷플릭스#이정재#DP#넷플릭스#정해인#군대#DP#넷프릭스#정해인#군대#한일커플#브이로그#커플#넷플릭스#클렉베이트#드라마#리뷰#영화#랑종#리뷰#공포#승우아빠#김말이튀김#요리#한일커플#거짓말탐지기#침착맨 #염따 #명품#구찌#병병병#롤#브라움#병병병#롤#시리즈#oyo#발젭#킬링벌스#킬링벌스#롤#시리즈#병병병#oyo#발젭#병병병#롤#시리즈#oyo#발젭#킬링벌스#병병병#롤#시리즈#oyo#발젭#킬링벌스#마블#리뷰#영화#어벤져스마블#리뷰#영화#어벤져스#침착맨#주호민#이상형월드컵#침착맨#주호민#이상형월드컵#한일커플#100문답#최현우#마술#강의#혜안#에일리#배그#스토브리그#드라마#남궁민#세븐#드라마#리뷰#에드워드권#까르보나라레시피#이마트밀키트#침착맨#헤드폰#쇼핑맨#승우아빠#치킨#백종원#새마을식당#7분돼지김치#결말#분석#서바이벌#웨폰마스터#할아버지#로그라이트#고양이#육묘일기#잠자는고양이#벤샤피로#Benshapiro#연필공장#침착맨#추억#이상형월드컵#THEBOB#더밥스튜디오#분식오맛카세#떡볶이#분식집떡볶이#포장마차떡볶이#에드워드권#냉동볶음밥리뷰#볶음밥만들기#넷플릭#DP#디피#마동석#영화#명장면#도라마코리아#일드#고독한미식가#THEBOB#더밥스튜디오#최자로드5#cat#InvisibleWallChallenge#투명벽챌린지#침착맨#양심자전거#침착맨#사랑#평화#고양이#cat#kitten#테스터훈#장인초대석#땅우양#승우아빠#흑우리뷰#햄버거#공수도#정다은#블랙서바이벌#영원회귀#병식#영화리뷰#B급리뷰#결말포함#김도#트위치#데바데#침착맨#김풍#주펄#하스스톤#전장#리노잭슨#군대#대한민국#무비트립#부당거래#황정민#류승범#침착맨#주호민#양말아저씨#군대요리#쏘야#군대인기메뉴#하스스톤#전장#후크터스크#에드워드권#요리먹방#쿡방#가성비#신화템#아이템#김도#트위치#무협배그#김도#트위치#고양이#자취요리#두부조림";
		//String[] array=str.split("#");
		String[] array=post_Hashtag.split("#");
		for(int i=1;i<array.length;i++) {
			HashWrite(array[i]);
		}
		return;
	}
	
	public void HashWrite(String post_Hashtag) {
		String SQL = "INSERT INTO hashtag values (?,0)";
		try {
			PreparedStatement pstmt2 = conn.prepareStatement(SQL);
            pstmt2.setString(1,post_Hashtag);
            pstmt2.executeUpdate();
		}catch (Exception e) {
            e.printStackTrace();
        }
	}
	public int seeState(int num) {
		String SQL = "SELECT post_seeState from post where post_Number=?";
		
		try {
			
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, num);
		rs=pstmt.executeQuery();
		rs.next();
		return rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int searchPostCount(String str) {
		String SQL = "SELECT Count(*) from post where post_Title Like ? OR post_HashTag Like ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%"+str+"%");
			pstmt.setString(2, "%"+str+"%");
			rs=pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int deletePostCount(String str) {
		String SQL = "SELECT Count(*) from post where post_seeState=0 AND( post_Title Like ? OR post_HashTag Like ?)";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, "%"+str+"%");
			pstmt.setString(2, "%"+str+"%");
			rs=pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int searchPost(int num,String str) {
		String SQL = "SELECT post_Number from post where post_Title Like ? OR post_HashTag Like ?";
		int State=0;
		
		try {
			
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, "%"+str+"%");
			pstmt.setString(2, "%"+str+"%");
			rs=pstmt.executeQuery();
			/*for(int i=1;i<=searchPostCount(str);i++) {
				rs.next();
				if(num==rs.getInt(1)) {
					State=1;
					return State;
				}
				
			}*/
			while(rs.next()) {
				if(num==rs.getInt(1)) {
					State=1;
					return State;
				}
			}
			return State;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public boolean Bookmarkpost(int num,int userNum) {
	      String SQL ="SELECT * FROM postBookmarkUser WHERE post_Number = ? AND post_BookmarkUser = ?";
	      try {
	         pstmt = conn.prepareStatement(SQL);
	         pstmt.setInt(1, num);
	         pstmt.setInt(2, userNum);
	         rs=pstmt.executeQuery();
	         if(rs.next()) {
	            return true;
	         }
	         return false;
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      return false;
	   }
	public boolean MyWritepost(int num, int userNum) {
		String SQL ="SELECT * FROM post WHERE post_Number = ? AND post_WriteUser = ?";
	      try {
	         pstmt = conn.prepareStatement(SQL);
	         pstmt.setInt(1, num);
	         pstmt.setInt(2, userNum);
	         rs=pstmt.executeQuery();
	         if(rs.next()) {
	            return true;
	         }
	         return false;
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      return false;
		
	}
	public int getNext() {
		String SQL = "SELECT post_Number FROM post ORDER BY post_Number DESC";
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	
	
	public int[][]postnum(int mpn) {
		String SQL ="SELECT post_Number FROM post WHERE post_seeState=1 ORDER BY post_Number DESC";
		int[][] post=new int[mpn][8];
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			for(int i=0;i<mpn;i++) {
				for(int j=0;j<8;j++) {
					if(rs.next()) {
						post[i][j]=rs.getInt(1);
					}
					else {
						post[i][j]=1;
					}
				}
			}
			return post;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("오류");
		}
		return post;
	}
	
	
	
	
	
	
	
	
	
}

/*
 * //아이디 중복체크 public int addIdCheck(String userID){ String SQL =
 * "select id from fun_member where id=?"; try {
 * pstmt=conn.prepareStatement(SQL); pstmt.setString(1, user.getUser_Id()); rs =
 * pstmt.executeQuery(); if(rs.next()){ if; }else{ result = 1; }
 * 
 * System.out.println("아이디 중복체크결과 : "+result); } catch (Exception e) { // TODO
 * Auto-generated catch block e.printStackTrace(); } finally { closeDB(); }
 * return result; }
 */