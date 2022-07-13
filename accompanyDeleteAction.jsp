<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="accompany.*"%>

<%@ page import="java.io.PrintWriter" %>
<%@ page import="util.DatabaseUtil" %>

<%

	request.setCharacterEncoding("UTF-8");
	
	String accompany_host = (String)session.getAttribute("user_id");	
	int accompany_year = Integer.parseInt(request.getParameter("accompany_year"));
	int accompany_month = Integer.parseInt(request.getParameter("accompany_month"));
	int accompany_date = Integer.parseInt(request.getParameter("accompany_date"));

	
	
	
	AccompanyDAO accompanyDAO = new AccompanyDAO();
	
	int result = accompanyDAO.accompanyDelete(accompany_host, accompany_year,accompany_month,accompany_date);
	
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