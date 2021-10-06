package user;
// ���� ��Ű�� database access object

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class ReWriteDAO {
   private Connection conn;                                  //DB�� �����ϰ� ���ִ� ��ü
   private PreparedStatement pstmt;                             //SQL���� �����Ұ���
   private ResultSet rs;                                     //������ ���� ��ü

   public ReWriteDAO() {                                          //�� Ŭ������ ������ �� DB�� ����
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
	   System.out.println("해쉬태그리롸이트 실행");
      String[] array=(new PostDAO().seeHashtag(num)).split("#");
      String SQL="UPDATE hashtag SET hashtag_View=hashtag_View+1 WHERE hashtag_Name=?";
      
      try {
         for(int i=1;i<array.length;i++) {
            pstmt=conn.prepareStatement(SQL);
            pstmt.setString(1, array[i]);
            pstmt.executeUpdate();
         }
         System.out.println("해쉬태그리롸이트 종료");
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
   
   
   
   
   //------------------------���ƿ�----------------------------
   public void LikeReWrite(int num) {
      String SQL ="UPDATE post SET post_Like=post_Like+1 WHERE post_number=?";
      
      try {
         pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1, num);
         pstmt.executeUpdate();
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
   public void UnLikeReWrite(int num) {
      String SQL ="UPDATE post SET post_Like=post_Like-1 WHERE post_number=?";
      try {
         pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1, num);
         pstmt.executeUpdate();
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
   
   public void LikeUserReWrite(int num,int userNum) {
      String SQL ="INSERT INTO postLikeUser VALUES(?,?)";
      
      try {
         pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1, num);
         pstmt.setInt(2, userNum);
         pstmt.executeUpdate();
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
   public void LikeUserDelete(int num,int userNum) {
      String SQL ="DELETE FROM postLikeUser WHERE post_Number = ? AND post_LikeUser = ?";
      
      try {
         pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1, num);
         pstmt.setInt(2, userNum);
         pstmt.executeUpdate();
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
   public boolean LikeUserInquiry(int num,int userNum) {
      String SQL ="SELECT * FROM postLikeUser WHERE post_Number = ? AND post_LikeUser = ?";
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
   //------------------------------------���ƿ� ��---------------------------------
   
   //------------------------------------�ϸ�ũ ����-------------------------------
   public void BookmarkUserReWrite(int num,int userNum) {
	      String SQL ="INSERT INTO postBookmarkUser VALUES(?,?)";
	      
	      try {
	         pstmt = conn.prepareStatement(SQL);
	         pstmt.setInt(1, num);
	         pstmt.setInt(2, userNum);
	         pstmt.executeUpdate();
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	   }
   public void BookmarkUserDelete(int num,int userNum) {
	      String SQL ="DELETE FROM postBookmarkUser WHERE post_Number = ? AND post_BookmarkUser = ?";
	      
	      try {
	         pstmt = conn.prepareStatement(SQL);
	         pstmt.setInt(1, num);
	         pstmt.setInt(2, userNum);
	         pstmt.executeUpdate();
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	   }
   public boolean BookmarkUserInquiry(int num,int userNum) {
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
   
   
}