<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="course.*"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="util.DatabaseUtil" %>

<%
	request.setCharacterEncoding("UTF-8");
	

	if(request.getParameter("course_id")==""||request.getParameter("course_name")==""||request.getParameter("course_length")==""||request.getParameter("course_hour")==""||request.getParameter("course_hour2")==""
		||request.getParameter("course_level")==null||request.getParameter("course_start")==""||request.getParameter("course_middle")==""||request.getParameter("course_finish")==""){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력안된 값이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
		}
	
	String course_id = request.getParameter("course_id");
	String course_name = request.getParameter("course_name");
	double course_length = Double.parseDouble(request.getParameter("course_length"));
	int course_hour = Integer.parseInt(request.getParameter("course_hour"));
	int course_hour2 =  Integer.parseInt(request.getParameter("course_hour2"));
	int course_level =  Integer.parseInt(request.getParameter("course_level"));
	String course_start = request.getParameter("course_start");
	String course_middle = request.getParameter("course_middle");
	String course_finish = request.getParameter("course_finish");

	CourseDAO courseDAO = new CourseDAO();
	CourseDTO courseDTO = new CourseDTO(course_id,course_name,course_length,course_hour,course_hour2,course_level,course_start,course_middle,course_finish);
	int result = courseDAO.courseUpdate(courseDTO);

	if(result==1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('평가 완료!. 메인 페이지로 돌아갑니다.');");
		script.println("location.href = 'adminMain.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('평가 실패.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
%>