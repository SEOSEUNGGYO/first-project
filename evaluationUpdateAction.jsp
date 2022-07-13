
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="evaluation.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="util.DatabaseUtil" %>

<%

	request.setCharacterEncoding("UTF-8");
	
	if(request.getParameter("evaluation_level")==null||request.getParameter("evaluation_hour")==null||request.getParameter("evaluation_minute")==null
			||request.getParameter("evaluation_recommend")==null||request.getParameter("evaluation_course")==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력안된 값이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	String evaluation_user= (String)session.getAttribute("user_id");
	String evaluation_course = request.getParameter("evaluation_course");
	int evaluation_level = Integer.parseInt(request.getParameter("evaluation_level"));
	int evaluation_hour = Integer.parseInt(request.getParameter("evaluation_hour"));
	int evaluation_minute = Integer.parseInt(request.getParameter("evaluation_minute"));
	int evaluation_recommend = Integer.parseInt(request.getParameter("evaluation_recommend"));
	String evaluation_info = request.getParameter("evaluation_info");
	
	System.out.println(evaluation_user);
	System.out.println(evaluation_course);
	System.out.println(evaluation_level);
	System.out.println(evaluation_hour);
	System.out.println(evaluation_minute);
	System.out.println(evaluation_recommend);
	System.out.println(evaluation_info);
	
	EvaluationDTO evaluationDTO = new EvaluationDTO(evaluation_user,evaluation_course,evaluation_level,evaluation_hour,evaluation_minute,evaluation_recommend,evaluation_info);
	EvaluationDAO evaluationDAO = new EvaluationDAO();
		
	int result = evaluationDAO.evaluationUpdate(evaluationDTO);
		
	if(result==1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('수정 완료!!. 메인 페이지로 돌아갑니다.');");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();
		return;
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('수정 실패.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		}
%>