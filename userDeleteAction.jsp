<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.*"%>
<%@ page import="evaluation.*" %>
<%@ page import="accompany.*" %>
<%@ page import="participation.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="util.DatabaseUtil" %>

<%

	request.setCharacterEncoding("UTF-8");
	
	
	if(request.getParameter("user_id")==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원이 아닙니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}

	String user_id = request.getParameter("user_id");
	
	
	UserDAO userDAO = new UserDAO();
	EvaluationDAO evaluationDAO = new EvaluationDAO();
	AccompanyDAO accompanyDAO = new AccompanyDAO();
	ParticipationDAO participationDAO = new ParticipationDAO();
	int result = userDAO.userDelete(user_id);
	
	
	if(result==1){
		accompanyDAO.accompanyDeleteNoUser(user_id);
		evaluationDAO.evaluationDeleteNoUser(user_id);
		participationDAO.participationDeleteNoUser(user_id);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('삭제 완료!. 메인 페이지로 돌아갑니다.');");
		script.println("location.href = 'adminMain.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('삭제 실패.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
%>