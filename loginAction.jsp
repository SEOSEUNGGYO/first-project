<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="accompany.*" %>
<%@ page import="participation.*" %>
<%@ page import="user.UserDAO" %>
<%

	request.setCharacterEncoding("UTF-8");
	
	if(request.getParameter("user_id")==null||request.getParameter("user_pw")==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력안된 값이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	String user_id = null;
	String user_pw = null;
	if(request.getParameter("user_id")!=null){
		user_id = request.getParameter("user_id");
	}
	if(request.getParameter("user_pw")!=null){
		user_pw = request.getParameter("user_pw");
	}
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(user_id,user_pw);

	if(result==1){
		session.setAttribute("user_id", user_id);
		if("admin".equals(user_id)){
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('관리자 로그인 완료!!. 메인 페이지로 돌아갑니다.');");
			script.println("location.href = 'adminMain.jsp'");
			script.println("</script>");
			script.close();
			return;
		}
		else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 완료!!. 메인 페이지로 돌아갑니다.');");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
			script.close();
			return;
		}
	}else if(result==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호 틀렸습니다!.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('가입되지 않은 ID!.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
%>