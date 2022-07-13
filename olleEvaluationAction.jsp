<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="evaluation.EvaluationDTO"%>
<%@ page import="evaluation.EvaluationDAO"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="util.DatabaseUtil" %>

<%

	String user_id = null;
	if(session.getAttribute("user_id")!=null){
		user_id=(String)session.getAttribute("user_id");
	}


	request.setCharacterEncoding("UTF-8");
	
	
	if(request.getParameter("evaluation_course")==null||request.getParameter("evaluation_level")==null
			||request.getParameter("evaluation_hour")==null||request.getParameter("evaluation_minute")==null
			||request.getParameter("evaluation_recommend")==null||request.getParameter("evaluation_info")==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력안된 값이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	String evaluation_user = user_id;
	String evaluation_course = request.getParameter("evaluation_course");
	int evaluation_level = Integer.parseInt(request.getParameter("evaluation_level"));
	int evaluation_hour = Integer.parseInt(request.getParameter("evaluation_hour"));
	int evaluation_minute = Integer.parseInt(request.getParameter("evaluation_minute"));
	int evaluation_recommend = Integer.parseInt(request.getParameter("evaluation_recommend"));
	String evaluation_info = request.getParameter("evaluation_info");
	
	EvaluationDAO evaluationDAO = new EvaluationDAO();
	EvaluationDTO evaluationDTO = new EvaluationDTO(evaluation_user,evaluation_course,evaluation_level,evaluation_hour,evaluation_minute,evaluation_recommend,evaluation_info);
	
	int evaluationCheck = evaluationDAO.evaluationCheck(evaluation_course, evaluation_user);
	if(evaluationCheck!=0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('해당 코스에 이미 평가한 내역이 있습니다..');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}else{
		int evaluationInsert = evaluationDAO.evaluationInsert(evaluationDTO);
		if(evaluationInsert==1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('평가 완료!. 메인 페이지로 돌아갑니다.');");
		script.println("location.href = 'olle.jsp'");
		script.println("</script>");
		script.close();
		return;
		}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('평가 실패.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
		}
	}
	
%>