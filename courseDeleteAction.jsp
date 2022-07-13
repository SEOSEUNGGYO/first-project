<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="course.CourseDTO"%>
<%@ page import="course.CourseDAO"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="util.DatabaseUtil" %>

<%

	request.setCharacterEncoding("UTF-8");
	
	
	if(request.getParameter("course_id")==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('코스가 제대로 선택되지 않았습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}

	String course_id = request.getParameter("course_id");
	
	
	CourseDAO courseDAO = new CourseDAO();
	
	int result = courseDAO.courseDelete(course_id);
	
	if(result==1){
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