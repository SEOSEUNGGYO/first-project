<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="accompany.*" %>
<%@ page import="participation.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");

	
	Calendar cal = Calendar.getInstance(); //현재 날짜에 해당하는 년,월,일을 알기위해서
	AccompanyDAO accompanyDAO = new AccompanyDAO();
	accompanyDAO.refreshAccompany(cal.get(Calendar.YEAR),cal.get(Calendar.MONTH)+1,cal.get(Calendar.DATE));
	//오늘 날짜 이전의 동행 일정을 삭제
	ParticipationDAO participationDAO = new ParticipationDAO();
	participationDAO.deleteParticipation(cal.get(Calendar.YEAR),cal.get(Calendar.MONTH)+1,cal.get(Calendar.DATE));
	//오늘 날짜 이전의 동행 일정을 삭제
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('갱신 완료!!. 날짜가 지난 일정들이 삭제되었습니다.');");
	script.println("location.href = 'adminMain.jsp'");
	script.println("</script>");
	script.close();
	return;
	
%>