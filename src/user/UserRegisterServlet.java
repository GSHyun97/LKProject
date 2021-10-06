package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserRegisterServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String user_Id = request.getParameter("user_Id");
		String user_Password1 = request.getParameter("user_Password1");
		String user_Password2 = request.getParameter("user_Password2");
		String user_Name = request.getParameter("user_Name");
		String user_Birth1 = request.getParameter("user_Birth1");
		String user_Birth2 = request.getParameter("user_Birth2");
		String user_Birth3 = request.getParameter("user_Birth3");
		String user_Email1 = request.getParameter("user_Email1");
		String user_Email2 = request.getParameter("user_Email2");
		if(user_Id == null || user_Id.equals("") || user_Password1 == null || user_Password1.equals("")
				|| user_Password2 == null || user_Password2.equals("") || user_Name == null || user_Name.equals("")
				|| user_Birth1 == null || user_Birth1.equals("") || user_Email1 == null || user_Email1.equals("")
				|| user_Birth2 == null || user_Birth2.equals("") || user_Email2 == null || user_Email2.equals("")
				|| user_Birth3 == null || user_Birth3.equals(""))
		{
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "모든 내용을 입력하세요.");
			response.sendRedirect("addMember.jsp");
			return;
		}
		if(!(user_Password1.equals(user_Password2))) {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "비밀번호가 다릅니다");
			response.sendRedirect("addMember.jsp");
			return;
		}
		int result = new UserDAO().register(user_Id, user_Password1, user_Name, user_Birth1, user_Birth2, user_Birth3, user_Email1, user_Email2);
		if(result == 1) {
			request.getSession().setAttribute("messageType", "성공 메시지");
			request.getSession().setAttribute("messageContent", "회원가입 완료");
			response.sendRedirect("login.jsp");
			return;
		}else {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "이미 존재하는 회원입니다.");
			response.sendRedirect("addMember.jsp");
			return;
		}
	}
}

