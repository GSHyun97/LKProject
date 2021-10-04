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
	public int write(PostDTO write) {
        String SQL = "INSERT INTO POST VALUES (0, ? , ? , CURRENT_TIMESTAMP , 0 , 0 , 0)";

        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,write.getPost_count());
            pstmt.setString(1,write.getPost_Title());
            pstmt.setString(2,write.getPost_Link());
            pstmt.setString(3,write.getPost_Hashtag());
            pstmt.setInt(5,write.getPost_View());
            pstmt.setInt(6,write.getPost_Like());
            pstmt.setInt(7,write.getPost_Report());

            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        //db오류시 -1
        return -1;
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

	public ArrayList<PostDTO> getList(int pageNumber) {
		String SQL = "SELECT * from post " + "WHERE post_Number < ? " + "AND post_seeState = 1 "
				+ "ORDER BY post_Number DESC LIMIT 8";

		ArrayList<PostDTO> list = new ArrayList<PostDTO>();
		int num = getNext() - (pageNumber - 1) * 8;
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PostDTO postdto = new PostDTO();
				postdto.setPost_Number(rs.getInt(1));
				postdto.setPost_Title(rs.getString(2));
				postdto.setPost_Link(rs.getString(3));
				postdto.setPost_Hashtag(rs.getString(4));
				postdto.setPost_UploadDate(rs.getString(5));
				postdto.setPost_View(rs.getInt(6)); 
				postdto.setPost_Like(rs.getInt(7)); //
				postdto.setPost_Report(rs.getInt(8));
				list.add(postdto);
			}

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * from post WHERE post_Number < ? AND post_seeState = 1";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 8);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
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