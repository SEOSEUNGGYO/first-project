<%@page import="java.util.Calendar"%>
<%@page import="com.sun.org.apache.xalan.internal.xsltc.cmdline.Transform"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

	String accompany_course = request.getParameter("accompany_course");
	
	String user_id = null;
	if(session.getAttribute("user_id")!=null){
		user_id = (String) session.getAttribute("user_id");
	}

	Calendar cal = Calendar.getInstance(); //현재 날짜에 해당하는 년,월,일을 알기위해서
	
%> 

<jsp:include page="./navbar.jsp"/>

<div class="container mx-auto py-3" align="center" style="width: 600px;">
<form action="accompanyRegistAction.jsp" method="post">
	<table class="table table-bordered" style="text-align: center; vertical-align: middle;" >
		<tr height="50">
			<td width="300" align="center">코스 번호</td>
			<td width="300"  align="center">
				<input type="hidden" class="form-control" name="accompany_course" value="<%=accompany_course %>"><%=accompany_course %>
			</td>
		</tr>
		<tr height="50">
			<td width="300" align="center">작성자</td>
			<td width="300"  align="center">
				<input type="hidden" class="form-control" name="accompany_host" value="<%=user_id %>"><%=user_id %>
			</td>
		</tr>
		
		<tr height="50">
			<td width="300" align="center">출발 날짜</td>
			<td width="300"  align="center">
				<select name="accompany_year">
							<%for(int i=cal.get(Calendar.YEAR); i<=cal.get(Calendar.YEAR)+3; i++){ %>
							<option value="<%=i %>"><%=i %></option>
							<%} %>			
				</select>년
				<select name="accompany_month">
							<%for(int i=cal.get(Calendar.MONTH)+1; i<=12; i++){ %>
							<option value="<%=i %>"><%=i %></option>
							<%} %>			
				</select>월
				<input type="text" style="width: 50px;"name="accompany_date">일
			</td>
		</tr>
		
		<tr height="50">
			<td width="300" align="center">출발 시간</td>
			<td width="300"  align="center">
				<select name="accompany_hour">
							<option value="" disabled selected hidden="">  </option>
							<%for(int i=8; i<=13; i++){ %>
							<option value="<%=i %>"><%=i %></option>
							<%} %>			
				</select>시
				<select name="accompany_minute">
							<option value="" disabled selected hidden="">  </option>
							<%for(int i=0; i<=50; i=i+10){ %>
							<option value="<%=i %>"><%=i %></option>
							<%} %>			
				</select>분
				
			</td>
		</tr>
		
		
		
		<tr height="50">
			<td width="300" align="center">동행 인원 수</td>
			<td width="300"  align="center">
				 <input type="text" class="form-control" name="accompany_headcount">
			</td>
		</tr>
		
		<tr height="50">
			<td width="300" align="center">기타 내용
			<td width="300">
			<textarea class="form-control" rows="10" cols="25" wrap="hard" name="accompany_info"></textarea>
			</td>
		</tr>
	</table>
	<button type="submit" class="btn btn-primary">등록</button>
</form>
</div>

 

</body>
</html>