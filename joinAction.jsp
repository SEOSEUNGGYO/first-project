<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="util.DatabaseUtil" %>

<%

	request.setCharacterEncoding("UTF-8");
	
	if(request.getParameter("user_id")==null||request.getParameter("user_pw")==null||request.getParameter("user_name")==null||request.getParameter("user_year")==null||request.getParameter("user_month")==null||request.getParameter("user_day")==null||request.getParameter("user_gender")==null||
			request.getParameter("user_email")==null||request.getParameter("user_phone")==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력안된 값이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}


	String user_id = null;
	String user_pw = null;
	String user_name = null;
	int user_year = 0;
	int user_month = 0;
	int user_day = 0;
	String user_gender = null;
	String user_email = null;
	String user_phone = null;
	
	if(request.getParameter("user_id")!=null){
		//join.jsp 페이지의 form태그에서 받아온 userID가 null이 아니면
		user_id = request.getParameter("user_id");
		//해당페이지의 변수 userID값에 받아온 ID값을 넣어준다.
	}
	if(request.getParameter("user_pw")!=null){
		//join.jsp 페이지의 form태그에서 받아온 user_pw null이 아니면
		user_pw = request.getParameter("user_pw");
		//해당페이지의 변수 user_pw 받아온 user_pw 넣어준다.
	}
	if(request.getParameter("user_name")!=null){
		//join.jsp 페이지의 form태그에서 받아온 user_name null이 아니면
		user_name = request.getParameter("user_name");
		//해당페이지의 변수 user_name 받아온 ID값을 넣어준다.
	}
	if(request.getParameter("user_year")!=null){
		user_year = Integer.parseInt(request.getParameter("user_year"));
	}
	if(request.getParameter("user_month")!=null){
		user_month = Integer.parseInt(request.getParameter("user_month"));
	}	

	if(request.getParameter("user_day")!=null){
		user_day = Integer.parseInt(request.getParameter("user_day"));
	}
	if(request.getParameter("user_gender")!=null){
		//join.jsp 페이지의 form태그에서 받아온 userID가 null이 아니면
		user_gender = request.getParameter("user_gender");
		//해당페이지의 변수 userID값에 받아온 ID값을 넣어준다.
	}
	if(request.getParameter("user_email")!=null){
		//join.jsp 페이지의 form태그에서 받아온 userID가 null이 아니면
		user_email = request.getParameter("user_email");
		//해당페이지의 변수 userID값에 받아온 ID값을 넣어준다.
	}
	if(request.getParameter("user_phone")!=null){
		//join.jsp 페이지의 form태그에서 받아온 userID가 null이 아니면
		user_phone = request.getParameter("user_phone");
		//해당페이지의 변수 userID값에 받아온 ID값을 넣어준다.
	}
	
	
	
	UserDTO userDTO = new UserDTO(user_id,user_pw,user_name,user_year,user_month,user_day,user_gender,user_email,user_phone);
	UserDAO userDAO = new UserDAO();
		
	int result = userDAO.join(userDTO);
		
	if(result==1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원 가입완료!!. 메인 페이지로 돌아갑니다.');");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();
		return;
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('가입 실패.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		}
%>