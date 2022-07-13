<%@page import="accompany.AccompanyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="accompany.*" %>
<%@ page import="course.*" %>
<%@ page import="participation.*" %>;
<%@ page import="java.io.PrintWriter" %>
<%@page import="java.util.Calendar"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>


</head>
<body>
<jsp:include page="./navbar.jsp"/>

<%!int pageSize=10;%>

<%
Calendar cal = Calendar.getInstance(); //현재 날짜에 해당하는 년,월,일을 알기위해서

String course_id = request.getParameter("course_id");
if(course_id==null){
	course_id="1";
}


String accompany_course = request.getParameter("accompany_course");


CourseDAO courseDAO = new CourseDAO();
ArrayList<CourseDTO> listCourse = courseDAO.getAllCourse();
//전체 코스 목록 확인
CourseDTO infoDTO = courseDAO.getCourse(accompany_course);



String pageNum = request.getParameter("pageNum");

if(pageNum==null){
	pageNum="1";
}
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage - 1) * pageSize + 1;
int endRow = currentPage * pageSize;
int count = 0;
int number = 0;

AccompanyDAO accompanyDAO = new AccompanyDAO();
ArrayList<AccompanyDTO> listAccompany = null;
count = accompanyDAO.getAccompanyCount(accompany_course);
//해당 코스의 총 평가글의 갯수
ParticipationDAO participationDAO = new ParticipationDAO();
ArrayList<AccompanyDTO> getUserAccompany = null;
ArrayList<ParticipationDTO> getUserParticipation = null;



if(count>0){
	listAccompany = accompanyDAO.getAccompany(accompany_course,cal.get(Calendar.YEAR),cal.get(Calendar.MONTH)+1,cal.get(Calendar.DATE), startRow, pageSize);
	//해당 코스의 동행일정들을 ArrayList에 담기 
	}






String user_id = null;
if(session.getAttribute("user_id")!=null){
	user_id = (String) session.getAttribute("user_id");
}

if (user_id == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.');");
			script.println("location.href = 'login.jsp';");
			script.println("</script>");
			script.close();
			return;
		}

getUserAccompany = accompanyDAO.getUserAccompanyList(user_id);
getUserParticipation = participationDAO.getUserParticipationList(user_id);
%>
<%if(accompany_course==null){ %>
<div class="container-fluid container py-3">
	<div class="row">
		<div class="col-8">
		<p class="h3">내가 주최한 일정</p>
		<table class="table table-bordered">
			<thead>
			<tr align="center">
				<th scope="row">코스</th>
				<th scope="row">날짜</th>
				<th scope="row">시간</th>
			</tr>
			</thead>
			<tbody>
				<%for(int i=0; i<getUserAccompany.size(); i++){
					AccompanyDTO accompanyDTO = getUserAccompany.get(i);
				%>
			<tr align="center">
				<td><%=accompanyDTO.getAccompany_course() %></td>
				<td><%=accompanyDTO.getAccompany_year() %>년<%=accompanyDTO.getAccompany_month() %>월<%=accompanyDTO.getAccompany_date() %>일</td>
				<td><%=accompanyDTO.getAccompany_hour() %>시<%=accompanyDTO.getAccompany_minute() %>분</td>

				
			</tr>
				<%} %>
			</tbody>
		</table>
		<hr class="text-success border-2 opacity-50">
		<p class="h3">내가 참여한 일정</p>
		<table class="table table-bordered">
			<thead>
			<tr align="center">
				<th scope="row">호스트</th>
				<th scope="row">코스</th>
				<th scope="row">날짜</th>
			</tr>
			</thead>
			<tbody>
				<%for(int i=0; i<getUserParticipation.size(); i++){
					ParticipationDTO participationDTO = getUserParticipation.get(i);
				%>
			<tr align="center">
				<td><%=participationDTO.getParticipation_host() %></td>
				<td><%=participationDTO.getParticipation_course() %></td>
				<td><%=participationDTO.getParticipation_year() %>년<%=participationDTO.getParticipation_month() %>월<%=participationDTO.getParticipation_date() %>일</td>
			</tr>
				<%} %>
			</tbody>
		</table>		
		</div>
		
		<div class="col-2">
			<p><strong>코스별</strong></p>
			<select class="form-select" name="accompany_course" style="width: 50%;" aria-label="Default select example" onchange="window.open(value,'_self');">
	 			<option selected>코스</option>
 				<%for(int i=0; i<listCourse.size(); i++) {
 						
 					CourseDTO listDTO = listCourse.get(i);
 						
	 			%>
  				<option value="accompany.jsp?accompany_course=<%=listDTO.getCourse_id()%>"><%=listDTO.getCourse_id() %>코스</option>
  				<%} %>
			</select>
		</div>
		<div class="col-2">
			<p><strong>등록</strong></p>
			<select class="form-select" name="accompany_course" style="width: 50%;" aria-label="Default select example" onchange="window.open(value,'_self');">
	 			<option selected>코스</option>
 				<%for(int i=0; i<listCourse.size(); i++) {
 						
 					CourseDTO listDTO = listCourse.get(i);
 						
	 			%>
  				<option value="accompanyRegist.jsp?accompany_course=<%=listDTO.getCourse_id()%>"><%=listDTO.getCourse_id() %>코스</option>
  				<%} %>
			</select>
		</div>
	</div>
</div>
	<%}else{ %>
<div class="container-fluid container pt-3 ">
	<div class="row">
		<div class="col-md-8 col-sm-12">
			<h5><strong><%=infoDTO.getCourse_name() %>코스(<%=infoDTO.getCourse_id() %>코스)</strong></h5>
		</div>
		<div class="col-md-2 col-sm-12">
			<select class="form-select" name="accompany_course" aria-label="Default select example" onchange="window.open(value,'_self');">
	 		<option selected>코스</option>
 				<%for(int i=0; i<listCourse.size(); i++) {		
 					CourseDTO listDTO = listCourse.get(i);
 				%>
  				<option value="accompany.jsp?accompany_course=<%=listDTO.getCourse_id()%>"><%=listDTO.getCourse_id() %>코스</option>
  				<%} %>
			</select>
		</div>
		<div class="col-md-2 col-sm-12">
			<a href="accompanyRegist.jsp?accompany_course=<%=infoDTO.getCourse_id() %>" class="btn btn-success"><%=infoDTO.getCourse_id() %>코스 일정 생성</a>
		</div>
	</div>
	
</div>

<div class="container-fluid container pt-3" align="center"> 
	<%if(count==0){
			
		%>
			
		<%}else{ %>
			<% 
			for(int i=0; i<listAccompany.size(); i++){ 
    			AccompanyDTO accompanyDTO = listAccompany.get(i);
    			//listEvaluation은 해당 코스당 평가 내용을 start부터 end까지 갯수로 보여줌
    			
    		%>
    <form action="participation.jsp" method="post">	
	<div class="row pt-3">
	
		<div class="col-md-2">
			<p>
			<strong>주최자ID</strong>
			<input type="hidden" name="accompany_course" value="<%=accompanyDTO.getAccompany_course() %>">
			<input type="hidden" name="accompany_host" value="<%=accompanyDTO.getAccompany_host() %>"><%=accompanyDTO.getAccompany_host() %>
			</p>
		</div>
		<div class="col-md-2">
			<p>
			<strong>일자</strong>
			<input type="hidden" name="accompany_year" value="<%=accompanyDTO.getAccompany_year() %>"><%=accompanyDTO.getAccompany_year() %>년
			<input type="hidden" name="accompany_month" value="<%=accompanyDTO.getAccompany_month() %>"><%=accompanyDTO.getAccompany_month() %>월
			<input type="hidden" name="accompany_date" value="<%=accompanyDTO.getAccompany_date() %>"><%=accompanyDTO.getAccompany_date() %>일
			</p>
		</div>
		<div class="col-md-2">
			<p>
			<strong>시간</strong>
			<input type="hidden" name="accompany_hour" value="<%=accompanyDTO.getAccompany_hour() %>"><%=accompanyDTO.getAccompany_hour() %>시
			<input type="hidden" name="accompany_minute" value="<%=accompanyDTO.getAccompany_minute() %>"><%=accompanyDTO.getAccompany_minute() %>분
			</p>
		</div>
		<div class="col-md-2">
			<p>
			<strong>정원</strong>
			<input type="hidden" name="accompany_headcount" value="<%=accompanyDTO.getAccompany_headcount() %>"><%=accompanyDTO.getAccompany_headcount() %>명
			</p>
		</div>
		<div class="col-md-2">
			<p>
			<strong>내용</strong>
			<input type="hidden" name="accompany_info" value="<%=accompanyDTO.getAccompany_info() %>">
			</p>
		</div>
		<div class="col-md-2">
			<p>
			<strong>자세히</strong>
			<button type="submit" class="btn btn-success">보기</button>
			</p>
		</div>
	</div>
	<hr class="text-success border-2 opacity-50">
	
	
		
	</form>
	<%}}}%>	
</div>


<div class="container-fluid" align="center" >
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
    	<li class="page-item">
    	</li>
<%
    if (count > 0) {
        int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage =1;
		
		if(currentPage % 10 != 0)
           startPage = (int)(currentPage/10)*10 + 1;
		else
           startPage = ((int)(currentPage/10)-1)*10 + 1;

		int pageBlock = 10;
        int endPage = startPage + pageBlock - 1;
        if (endPage > pageCount) endPage = pageCount;
        
        if (startPage > 10) { %>
            <li class="page-item"><a class="page-link" href="accompany.jsp?accompany_course=<%=accompany_course %>&pageNum=<%= startPage - 10 %>">[이전]</a></li>
<%      }
        
        for (int i = startPage ; i <= endPage ; i++) {  %>
			<li class="page-item"><a class="page-link" href="accompany.jsp?accompany_course=<%=accompany_course %>&pageNum=<%= i %>">[<%= i %>]</a></li>
<%      }
        
        if (endPage < pageCount) {  %>
        	<li class="page-item"><a class="page-link" href="accompany.jsp?accompany_course=<%=accompany_course %>&pageNum=<%=startPage + 10 %>">[다음]</a></li>
<%
        }
    }
%>
		</ul>
	</nav>
</div>



</body>
</html>