<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="evaluation.*"%>

<%@ page import="java.io.PrintWriter" %>
<%@ page import="util.DatabaseUtil" %>

<%

	request.setCharacterEncoding("UTF-8");
	
	String evaluation_user = (String)session.getAttribute("user_id");	
	String evaluation_course = request.getParameter("evaluation_course");

	
	
	
	EvaluationDAO evaluationDAO = new EvaluationDAO();
	
	int result = evaluationDAO.evaluationDelete(evaluation_user, evaluation_course);
	
	if(result==1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('삭제 완료!. 메인 페이지로 돌아갑니다.');");
		script.println("location.href = 'index.jsp'");
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