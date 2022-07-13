<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="participation.*"%>

<%@ page import="java.io.PrintWriter" %>
<%@ page import="util.DatabaseUtil" %>

<%

	request.setCharacterEncoding("UTF-8");
	

	String participation_participants = (String)session.getAttribute("user_id");	
	int participation_year = Integer.parseInt(request.getParameter("participation_year"));
	int participation_month = Integer.parseInt(request.getParameter("participation_month"));
	int participation_date = Integer.parseInt(request.getParameter("participation_date"));

	
	
	
	ParticipationDAO participationDAO = new ParticipationDAO();
	
	int result = participationDAO.participationDelete(participation_participants, participation_year,participation_month,participation_date);
	
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