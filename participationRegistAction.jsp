<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="participation.*" %>
<%@ page import="accompany.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="util.DatabaseUtil" %>

<%

	request.setCharacterEncoding("UTF-8");

	
	String accompany_host = request.getParameter("accompany_host");
	int accompany_headcount = Integer.parseInt(request.getParameter("accompany_headcount"));
	
	
	String participation_participants= request.getParameter("participation_participants");
	String participation_host = request.getParameter("participation_host");
	String participation_course = request.getParameter("participation_course");
	int participation_year = Integer.parseInt(request.getParameter("participation_year"));
	int participation_month = Integer.parseInt(request.getParameter("participation_month"));
	int participation_date = Integer.parseInt(request.getParameter("participation_date"));
	
	
	
	
	
	
	
	
	
	
	AccompanyDAO accompanyDAO = new AccompanyDAO();
	int hostCheck = accompanyDAO.hostCheck(participation_participants, participation_year, participation_month, participation_date);
	ParticipationDAO participationDAO = new ParticipationDAO();
	int participationCheck = participationDAO.participationCheck(participation_participants, participation_year, participation_month, participation_date);
	
	if(hostCheck!=0){
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('일정의 호스트가 본인이거나, 해당 날짜에 본인이 호스트인 일정이 존재합니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}else{
		if(participationCheck!=0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('해당 일정에 참여중이거나, 해당 날짜에 본인이 참여중인 일정이 존재합니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		}else{
			ParticipationDTO participationDTO = new ParticipationDTO(participation_host,participation_course,participation_participants,participation_year,participation_month,participation_date);
			int participationInsert = participationDAO.participationInsert(participationDTO);
			if(participationInsert==1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('동행 참여 완료!!. 메인 페이지로 돌아갑니다.');");
				script.println("location.href = 'index.jsp'");
				script.println("</script>");
				script.close();
				return;
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('동행 참여 실패.');");
				script.println("history.back();");
				script.println("</script>");
				script.close();
				return;
			}
		}
	}
		
	
%>