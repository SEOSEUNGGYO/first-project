<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="course.*" %> 
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



String course_id = request.getParameter("course_id");

if(course_id==null){
	course_id="1";
}

CourseDAO courseDAO = new CourseDAO();
ArrayList<CourseDTO> listCourse = courseDAO.getAllCourse();
//전체 코스 목록 확인
CourseDTO infoDTO = courseDAO.getCourse(course_id);

String user_id = null;
if(session.getAttribute("user_id")!=null){
	user_id = (String) session.getAttribute("user_id");
}


%>

<div class="container-fluid container py-3" style="width:600px;" align="center" >
	<select class="form-select" name="course_id" aria-label="Default select example" onchange="window.open(value,'_self');">
		<option selected>코스</option>
 		<%for(int i=0; i<listCourse.size(); i++) {
 			CourseDTO listDTO = listCourse.get(i);
 		%>
  		<option value="courseUpdate.jsp?course_id=<%=listDTO.getCourse_id()%>"><%=listDTO.getCourse_id() %>코스</option>
  		<%} %>
	</select>
</div>



<div class="container mx-auto py-3"  style="width: 600px;">
<form action="courseUpdateAction.jsp" method="post">
	<table class="table table-bordered" style="text-align: center; vertical-align: middle;" >
		<tr height="50">
			<td width="300" align="center">코스 번호</td>
			<td width="300"  align="center">
				<input type="hidden" class="form-control" name="course_id" value="<%=infoDTO.getCourse_id() %>"><%=infoDTO.getCourse_id()%>코스
			</td>
		</tr>
		<tr height="50">
			<td width="300" align="center">코스 이름</td>
			<td width="300"  align="center">
				<input type="text"class="form-control"name="course_name" value="<%=infoDTO.getCourse_name()%>">
			</td>
		</tr>
		<tr height="50">
			<td width="300" align="center">코스 총 길이</td>
			<td width="300"  align="center">
				<input type="text" class="form-control" name="course_length" value="<%=infoDTO.getCourse_length()%>">
			</td>
		</tr>
		<tr height="50">
			<td width="300" align="center">소요 시간</td>
			<td width="300"  align="center">
			<input type="text"  style="width: 50px;" name="course_hour" value="<%=infoDTO.getCourse_hour()%>"> ~
			<input type="text"  style="width: 50px;"  name="course_hour2" value="<%=infoDTO.getCourse_hour2()%>"> 시간
			
			</td>
		</tr>
		<tr height="50">
			<td width="300" align="center">난이도</td>
			<td width="300"  align="center">
				<select class="form-select" name="course_level" style="width: 100px;">
					<option selected><%=infoDTO.getCourse_level()%></option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
				</select>
			</td>
		</tr>
		<tr height="50">
			<td width="300" align="center">코스 출발
			<td width="300"  align="center">
				<input type="text" class="form-control" name="course_start" value="<%=infoDTO.getCourse_start() %>">
			</td>
		</tr>
		<tr height="50">
			<td width="300" align="center">코스 중간
			<td width="300"  align="center">
				<input type="text" class="form-control" name="course_middle" value="<%=infoDTO.getCourse_middle() %>">
			</td>
		</tr>
		<tr height="50">
			<td width="300" align="center">코스 끝점
			<td width="300"  align="center">
				<input type="text" class="form-control" name="course_finish" value="<%=infoDTO.getCourse_finish() %>">
			</td>
		</tr>
		<tr height="50">
			<td colspan="2" width="150" align="center">
			<button type="button" class="btn btn-secondary" onclick="location.href='adminMain.jsp'">취소</button>
  			<button type="submit" class="btn btn-primary">수정</button>
		</td>	
	</table>
</form>
</div>

 

</body>
</html>