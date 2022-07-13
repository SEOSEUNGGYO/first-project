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





CourseDAO courseDAO = new CourseDAO();
ArrayList<CourseDTO> listCourse = courseDAO.getAllCourse();
//전체 코스 목록 확인

String user_id = null;
if(session.getAttribute("user_id")!=null){
	user_id = (String) session.getAttribute("user_id");
}


%>





<div class="container mx-auto py-3"  style="width: 600px;" align="center">
<form action="courseDeleteAction.jsp" method="post">
	<select class="form-select" name="course_id" aria-label="Default select example" >
		<option selected>코스</option>
 		<%for(int i=0; i<listCourse.size(); i++) {
 			CourseDTO listDTO = listCourse.get(i);
 		%>
  		<option value="<%=listDTO.getCourse_id()%>"><%=listDTO.getCourse_id() %>코스</option>
  		<%} %>
	</select>
	<button type="button" class="btn btn-secondary" onclick="history.back();">뒤로</button>
	<button type="submit" class="btn btn-danger">삭제</button>
</form>
</div>

 

</body>
</html>