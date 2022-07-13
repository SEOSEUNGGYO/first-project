<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="accompany.AccompanyDTO"%>
<%@ page import="accompany.AccompanyDAO"%>
<%@ page import="participation.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="util.DatabaseUtil" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	
	if(request.getParameter("accompany_course")==null||request.getParameter("accompany_host")==null||request.getParameter("accompany_year")==null
			||request.getParameter("accompany_month")==null||request.getParameter("accompany_date")==null
			||request.getParameter("accompany_hour")==null||request.getParameter("accompany_minute")==null
			||request.getParameter("accompany_headcount")==""||request.getParameter("accompany_info")==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력안된 값이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}

	String accompany_course = request.getParameter("accompany_course");
	String accompany_host = request.getParameter("accompany_host");
	int accompany_year = Integer.parseInt(request.getParameter("accompany_year"));
	int accompany_month = Integer.parseInt(request.getParameter("accompany_month"));
	int accompany_date =  Integer.parseInt(request.getParameter("accompany_date"));
	int accompany_hour =  Integer.parseInt(request.getParameter("accompany_hour"));
	int accompany_minute =  Integer.parseInt(request.getParameter("accompany_minute"));
	int accompany_headcount =  Integer.parseInt(request.getParameter("accompany_headcount"));
	String accompany_info = request.getParameter("accompany_info");
	
	AccompanyDAO accompanyDAO = new AccompanyDAO();
	int hostCheck = accompanyDAO.hostCheck(accompany_host, accompany_year, accompany_month, accompany_date);
	ParticipationDAO participationDAO = new ParticipationDAO();
	int participationCheck = participationDAO.participationCheck(accompany_host, accompany_year, accompany_month, accompany_date);
	
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
			script.println("alert('해당 일정에 참여중이거나, 해당 날짜에 본인이 참여중인 일정이 존재합니다');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		}else{
			AccompanyDTO accompanyDTO = new AccompanyDTO(accompany_course,accompany_host,accompany_year,accompany_month,accompany_date,accompany_hour,accompany_minute,accompany_headcount,accompany_info);
			int accompanyInsert = accompanyDAO.accompanyInsert(accompanyDTO);
			if(accompanyInsert==1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('동행 등록 완료!!. 메인 페이지로 돌아갑니다.');");
				script.println("location.href = 'index.jsp'");
				script.println("</script>");
				script.close();
				return;
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('동행 등록 실패.');");
				script.println("history.back();");
				script.println("</script>");
				script.close();
				return;
			}
		}
	}
%>