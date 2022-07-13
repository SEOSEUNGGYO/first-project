<%@page import="accompany.AccompanyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="accompany.AccompanyDTO" %>
<%@ page import="accompany.AccompanyDAO" %>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="participation.*" %>
<%@ page import="java.util.Calendar" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>


</head>
<body>
<jsp:include page="./navbar.jsp"/>

<%	
	request.setCharacterEncoding("UTF-8");
%>
	
<%
	
	String user_id = null;
	if(session.getAttribute("user_id")!=null){
		user_id = (String) session.getAttribute("user_id");
	}

	UserDAO userDAO = new UserDAO();
	UserDTO userDTO = userDAO.getUserInfo((String)request.getParameter("accompany_host"));
	//accompany_host를 user테이블에서 찾아서 그 user에 대한 정보를 userDTO객체에 담아놓는 것
	
	
	String participation_host = String.valueOf(request.getParameter("accompany_host"));
	String participation_course = String.valueOf(request.getParameter("accompany_course"));
	int participation_year = Integer.parseInt(request.getParameter("accompany_year"));
	int participation_month = Integer.parseInt(request.getParameter("accompany_month"));
	int participation_date = Integer.parseInt(request.getParameter("accompany_date"));
	
	ParticipationDAO participationDAO = new ParticipationDAO();
	ArrayList<ParticipationDTO> listParticipants = participationDAO.getParticipation(participation_host, participation_year, participation_month, participation_date);
	int participationCount = participationDAO.headcountCheck(participation_host, participation_year, participation_month, participation_date); 


	int accompany_headcount = Integer.parseInt(request.getParameter("accompany_headcount"));
	
	
%> 

<div class="container-fluid container pt-3" align="center"> 
	<div class="row pt-3">
	<p class="h3" style="text-align: center;">선택한 동행 일정 정보</p>
	<hr class="text-success border-2 opacity-50">
		<div class="col-md-2">
			<p><strong>코스</strong></p>
			<%=request.getParameter("accompany_course") %>
		</div>
		<div class="col-md-2">
			<p><strong>주최자ID</strong></p>
			<%=request.getParameter("accompany_host") %>
		</div>
		<div class="col-md-2">
			<p><strong>날짜</strong></p>
			<%=request.getParameter("accompany_year") %>년
			<%=request.getParameter("accompany_month") %>월
			<%=request.getParameter("accompany_date") %>일
		</div>
		<div class="col-md-2">
			<p><strong>시간</strong></p>
			<%=request.getParameter("accompany_hour") %>시<%=request.getParameter("accompany_minute") %>분
		</div>
		<div class="col-md-2">
			<p><strong>정원</strong></p>
			<%=request.getParameter("accompany_headcount") %>명
		</div>
		<div class="col-md-2">
			<p><strong>정보</strong></p>
			<%=request.getParameter("accompany_info") %>
		</div>
		<hr class="text-success border-2 opacity-50">
	</div>
</div>

<div class="container-fluid container pt-3" align="center"> 
	<div class="row pt-3">
	<p class="h3" style="text-align: center;">동행 주최자 정보</p>
	<hr class="text-success border-2 opacity-50">
		<div class="col-md-2">
			<p><strong>아이디</strong>
			<%=userDTO.getUser_id() %>
			</p>
		</div>
		<div class="col-md-2">
			<p><strong>이름</strong>
			<%=userDTO.getUser_name() %>
			</p>
		</div>
		<div class="col-md-2">
			<p><strong>생년월일</strong>
			<%=userDTO.getUser_year()%>년
			<%=userDTO.getUser_month() %>월
			<%=userDTO.getUser_day() %>일
			</p>
		</div>
		<div class="col-md-2">
			<p><strong>성별</strong>
			<%=userDTO.getUser_gender() %>
			</p>
		</div>
		<div class="col-md-2">
			<p><strong>연락처</strong>
			<%=userDTO.getUser_phone()%>
			</p>
		</div>
		<hr class="text-success border-2 opacity-50">
	</div>
</div>

<div class="container-fluid container pt-3" align="center"> 
	<div class="row pt-3">
	<p class="h3" style="text-align: center;">동행 참여자 정보</p>
	<hr class="text-success border-2 opacity-50">
		<%for(int i=0; i<listParticipants.size(); i++){
			ParticipationDTO participationDTO = listParticipants.get(i);
			UserDTO participationUser = userDAO.getUserInfo(participationDTO.getParticipation_participants());
		%>
		<div class="col-md-2">
			<p><strong>아이디</strong>
			<%=participationUser.getUser_id()  %>
			</p>
		</div>
		<div class="col-md-2">
			<p><strong>이름</strong>
			<%=participationUser.getUser_name() %>
			</p>
		</div>
		<div class="col-md-2">
			<p><strong>생년월일</strong>
			<%=participationUser.getUser_year()%>년
			<%=participationUser.getUser_month() %>월
			<%=participationUser.getUser_day() %>일
			</p>
		</div>
		<div class="col-md-2">
			<p><strong>성별</strong>
			<%if("M".equals(participationUser.getUser_gender())) {%>
			남
			<%}else{ %>
			여<%} %>
			</p>
		</div>
		<div class="col-md-2">
			<p><strong>연락처</strong>
			<%=participationUser.getUser_phone()%>
			</p>
		</div>
		<div class="col-md-2">
			<p><strong>이메일</strong>
			<%=participationUser.getUser_email()%>
			</p>
		</div>
		<hr class="text-success border-2 opacity-50">
		<%} %>
	</div>
	<div class="row pt-3">
		<form action="participationRegistAction.jsp" method="post">
			<input type="hidden" value="<%=user_id %>" name="participation_participants">
			<input type="hidden" value="<%=participation_course %>" name="participation_course">
			<input type="hidden" value="<%=participation_host %>" name="participation_host">
			<input type="hidden" value="<%=participation_year %>" name="participation_year">
			<input type="hidden" value="<%=participation_month %>" name="participation_month">
			<input type="hidden" value="<%=participation_date %>" name="participation_date">
			<input type="hidden" value="<%=accompany_headcount %>" name="accompany_headcount">
			
			<%if(participationCount+1<accompany_headcount){ %>
			<button type="submit" class="btn btn-success">참여</button> 
			<%}else{ %>
			<button type="submit" class="btn btn-secomdary" disabled>참여 불가</button>
			<%} %>
		</form>
	</div>
</div>



</body>
</html>