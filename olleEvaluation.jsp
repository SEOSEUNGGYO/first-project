<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="course.CourseDTO" %>
<%@ page import="course.CourseDAO" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

</head>
<body>

<%	
	String course_id = request.getParameter("course_id");
	CourseDAO courseDAO = new CourseDAO();
	ArrayList<CourseDTO> list = courseDAO.getAllCourse();
	String evaluation_course = request.getParameter("evaluation_course");
	
	
%> 

<jsp:include page="./navbar.jsp"/>

<div class="container mx-auto py-3" align="center" style="width: 600px;">
<form action="olleEvaluationAction.jsp" method="post">
	<table class="table table-bordered" style="text-align: center; vertical-align: middle;" >
		<tr height="50">
			<td width="300" align="center">코스 번호</td>
			<td width="300"  align="center">
				<input type="hidden" class="form-control" name="evaluation_course" value="<%=course_id %>"><%=course_id %>
			</td>
		</tr>
		<tr height="50">
			<td width="300" align="center">코스 난이도</td>
			<td width="300"  align="center">
				 <input class="form-check-input" type="radio" name="evaluation_level" value="1">1
			     <input class="form-check-input" type="radio" name="evaluation_level" value="2">2
				 <input class="form-check-input" type="radio" name="evaluation_level" value="3">3
				
			</td>
		</tr>
		
		<tr height="50">
			<td width="300" align="center">소요 시간</td>
			<td width="300"  align="center">
			<select name="evaluation_hour" style="width: 70px;"> 
				<option value="" disabled selected hidden="">시간</option>
				
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
			</select>시간
			<select name="evaluation_minute"style="width: 70px;"> 
				<option value="" disabled selected hidden="">분</option>
				<option value="0">0</option>
				<option value="10">10</option>
				<option value="20">20</option>
				<option value="30">30</option>
				<option value="40">40</option>
				<option value="50">50</option>
			</select>분
			
			</td>
		</tr>
		
		<tr height="50">
			<td width="300" align="center">코스 추천도</td>
			<td width="300"  align="center">
				 <input class="form-check-input" type="radio" name="evaluation_recommend" value="1">1
			     <input class="form-check-input" type="radio" name="evaluation_recommend" value="2">2
				 <input class="form-check-input" type="radio" name="evaluation_recommend" value="3">3
			</td>
		</tr>
		
		<tr height="50">
			<td width="300" align="center">코스 설명
			<td width="300">
			<textarea class="form-control" rows="10" cols="25" wrap="hard" name="evaluation_info"></textarea>
			</td>
		</tr>
	</table>
	<button type="submit" class="btn btn-primary">등록</button>
</form>
</div>



</body>
</html>