<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="accompany.*" %>
<%@ page import="participation.*" %>
<%@ page import="course.*" %>
<%@ page import="evaluation.*" %>
<%@ page import="user.*" %>
<%@ page import="java.util.Timer" %>
<%@ page import="java.util.TimerTask" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.ArrayList" %>
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
String user_id = null;
if(session.getAttribute("user_id")!=null){
	user_id = (String) session.getAttribute("user_id");
}


UserDAO userDAO = new UserDAO();
UserDTO user = userDAO.getUserInfo(user_id);

CourseDAO courseDAO = new CourseDAO();

EvaluationDAO evaluationDAO = new EvaluationDAO();
ArrayList<EvaluationDTO> getUserEvaluationList = evaluationDAO.getUserEvaluationList(user_id);

AccompanyDAO accompanyDAO = new AccompanyDAO();
ArrayList<AccompanyDTO> getUserAccompanyList = accompanyDAO.getUserAccompanyList(user_id);

ParticipationDAO participationDAO = new ParticipationDAO();
ArrayList<ParticipationDTO> getUserParticipationList = participationDAO.getUserParticipationList(user_id);

Calendar cal = Calendar.getInstance(); //현재 날짜에 해당하는 년,월,일을 알기위해서
%>


<div class="container-fluid py-3">
	<div class="row">
		<div class="col-md-2">        
			<div class="card text-black bg-light ">
				<div class="card-header">코스 평가 관리</div>
					<ul class="list-group list-group-flush">
						                     
						<li class="list-group-item"><a href="courseInsert.jsp" >코스 정보 추가</a></li>
						<li class="list-group-item"><a href="courseUpdate.jsp" >코스 정보 수정</a></li>
						<li class="list-group-item"><a href="courseDelete.jsp" >코스 정보 삭제</a></li>
						
					</ul>
				<div class="card-header">회원관리</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item"><a href="userManage.jsp" >회원 관리</a></li>
					</ul>
				<div class="card-header">동행관리</div>
					<ul class="list-group list-group-flush">                     
						<li class="list-group-item"><a href="accompanyRefresh.jsp" >동행 데이터 갱신</a></li>
					</ul>
			</div>
		</div>
		
		<div class="col-md-10">
			<div class="container" align="center">
				<figure>
					<blockquote class="blockquote">
    				<p class="h3">마이페이지</p>
  					</blockquote>
  					<figcaption class="blockquote-footer">
    					아래 항목을 클릭하시면 펼쳐집니다.
  					</figcaption>
				</figure>
				
				<div class="accordion" id="accordionExample">
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingOne">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
						<strong>내 정보 확인 / 수정 / 탈퇴</strong>
						</button>
						</h2>
    						<div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      							<div class="accordion-body">
        							<form action="userUpdateAction.jsp" method="post">
										<table class="table table-bordered" style="text-align: center; vertical-align: middle;" >
											<tr height="50">
												<td width="300" align="center">아이디(수정불가)</td>
												<td width="300"  align="center">
													<input type="hidden" class="form-control" name="user_id" value="<%=user.getUser_id()%>"><%=user.getUser_id() %>
												</td>
											</tr>
											<tr height="50">
												<td width="300" align="center">비밀번호</td>
												<td width="300"  align="center">
													<input type="password" class="form-control" name="user_pw" value="<%=user.getUser_pw()%>">
												</td>
											</tr>
											<tr height="50">
												<td width="300" align="center">이름</td>
												<td width="300"  align="center">
													<input type="text" class="form-control" name="user_name" value="<%=user.getUser_name()%>">
												</td>
											</tr>
											<tr height="50">
												<td width="300" align="center">생년월일</td>
												<td width="300"  align="center">
													<input type="text" style="width: 50px;" name="user_year" value="<%=user.getUser_year()%>">년
													<input type="text" style="width: 50px;" name="user_month" value="<%=user.getUser_month()%>">월
													<input type="text" style="width: 50px;" name="user_day" value="<%=user.getUser_day()%>">일
												</td>
											</tr>
											<tr height="50">
												<td width="300" align="center">성별</td>
												<td width="300"  align="center">
												<%if("F".equals(user.getUser_gender())){%>
													<input class="form-check-input" type="radio" name="user_gender" checked="checked" value="<%=user.getUser_gender() %>">여성
													<input class="form-check-input" type="radio" name="user_gender" value="M">남성
												<%}else{ %>
													<input class="form-check-input" type="radio" name="user_gender" checked="checked" value="<%=user.getUser_gender() %>">남성
													<input class="form-check-input" type="radio" name="user_gender" value="F">여성
												<%} %>
												</td>
											</tr>
											<tr height="50">
												<td width="300" align="center">연락처</td>
												<td width="300"  align="center">
													<input type="text" class="form-control" name="user_phone" value="<%=user.getUser_phone()%>">
												</td>
											</tr>
											<tr height="50">
												<td width="300" align="center">이메일</td>
												<td width="300"  align="center">
													<input type="text" class="form-control" name="user_email" value="<%=user.getUser_email()%>">
												</td>
											</tr>
       								</table>
       								<button type="submit" class="btn btn-primary">수정</button>
									<button type="submit" class="btn btn-danger" formaction="userDeleteAction.jsp">탈퇴</button>
       							</form>
      						</div>
    					</div>
					</div>
					
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingTwo">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
						<strong>내 평가 내역 확인 / 수정 / 삭제</strong>
						</button>
						</h2>
    					<div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
		      				<div class="accordion-body">
      							<form action="evaluationUpdateAction.jsp" method="post">
									<table class="table table-bordered" style="text-align: center; vertical-align: middle;" >
										<tr height="50">
											<td width="100" align="center">코스(수정불가)</td>
											<td width="100" align="center">난이도</td>
											<td width="100" align="center">소요시간</td>
											<td width="100" align="center">추천도</td>
											<td width="100" align="center">기타 정보</td>
											<td width="100" align="center">선택</td>											
										</tr>
										<%for(int i=0; i<getUserEvaluationList.size(); i++) {
        									EvaluationDTO evaluationDTO = getUserEvaluationList.get(i);
        								%>	
										<tr height="50">
											<td width="100" align="center">
												<input type="hidden" class="form-control" name="evaluation_course" value="<%=evaluationDTO.getEvaluation_course() %>"><%=evaluationDTO.getEvaluation_course() %>
											</td>
											<td width="100" align="center">										
												<select class="form-select" name="evaluation_level">
													<option value="<%=evaluationDTO.getEvaluation_level() %>" selected><%=evaluationDTO.getEvaluation_level() %></option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
												</select>						
											</td>
											<td width="100" align="center">
												<input type="number" min="1" max="7" step="1" style="width: 50px;" name="evaluation_hour" value="<%=evaluationDTO.getEvaluation_hour()%>">시간
												<input type="number" min="0" max="50" step="10" style="width: 50px;" name="evaluation_minute" value="<%=evaluationDTO.getEvaluation_minute()%>">분
													</td>
											<td width="100" align="center">
												<select class="form-select" name="evaluation_recommend">
													<option value="<%=evaluationDTO.getEvaluation_recommend() %>" selected><%=evaluationDTO.getEvaluation_recommend() %></option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
												</select>						
											</td>
											<td width="100" align="center">
												<textarea class="form-control" name="evaluation_info"><%=evaluationDTO.getEvaluation_info() %></textarea>
											</td>
											<td>
											<button type="submit" class="btn btn-primary">수정</button>
											<button type="submit" class="btn btn-danger" formaction="evaluationDeleteAction.jsp">삭제</button>
											</td>											
										</tr>
										<%} %>
       								</table>						
		       					</form>
      						</div>
    					</div>
					</div>
						
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingThree">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
						<strong>내 주최 정보 확인 / 수정 / 삭제</strong>
						</button>
						</h2>
    						<div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
      							<div class="accordion-body">
      								<form action="accompanyUpdateAction.jsp" method="post">
										<table class="table table-bordered" style="text-align: center; vertical-align: middle;" >
											<tr height="50">
												<td width="100" align="center">코스(수정불가)</td>
												<td width="200" align="center">날짜</td>
												<td width="100" align="center">시간</td>
												<td width="100" align="center">정원</td>
												<td width="100" align="center">기타 정보</td>
												<td width="100" align="center">선택</td>											
											</tr>
											<%for(int i=0; i<getUserAccompanyList.size(); i++) {
        										AccompanyDTO accompanyDTO = getUserAccompanyList.get(i);
        									%>	
											<tr height="50">
												<td width="100" align="center">
													<input type="hidden" class="form-control" name="accompany_course" value="<%=accompanyDTO.getAccompany_course()%>"><%=accompanyDTO.getAccompany_course()%>
												</td>
												<td width="200" align="center">										
													<select name="accompany_year">
														<option value="<%=accompanyDTO.getAccompany_year() %>" selected><%=accompanyDTO.getAccompany_year() %></option>
														<%for(int j=cal.get(Calendar.YEAR); j<=cal.get(Calendar.YEAR)+3; j++){ %>
														<option value="<%=j %>"><%=j %></option>
														<%} %>			
													</select>년
													<select name="accompany_month">
														<option value="<%=accompanyDTO.getAccompany_month() %>" selected><%=accompanyDTO.getAccompany_month() %></option>
														<%for(int j=cal.get(Calendar.MONTH)+1; j<=12; j++){ %>
														<option value="<%=j %>"><%=j %></option>
														<%} %>			
													</select>월
													<input type="text" style="width: 50px;"name="accompany_date" value="<%=accompanyDTO.getAccompany_date()%>">일
												</td>
												<td width="100" align="center">
													<select name="accompany_hour">
														<option value="<%=accompanyDTO.getAccompany_hour() %>" selected><%=accompanyDTO.getAccompany_hour() %></option>
														<%for(int j=8; j<=13; j++){ %>
														<option value="<%=j %>"><%=j %></option>
														<%} %>			
													</select>시
													<select name="accompany_minute">
														<option value="<%=accompanyDTO.getAccompany_minute() %>" selected><%=accompanyDTO.getAccompany_minute() %></option>
														<%for(int j=0; j<=50; j=j+10){ %>
														<option value="<%=j %>"><%=j %></option>
														<%} %>			
													</select>분										
												</td>
												<td width="100" align="center">
													<input type="text" class="form-control" name="accompany_headcount" value="<%=accompanyDTO.getAccompany_headcount() %>">						
												</td>
												<td width="100" align="center">
													<textarea class="form-control" name="accompany_info"><%=accompanyDTO.getAccompany_info() %></textarea>
												</td>
												<td>
												<button type="submit" class="btn btn-primary">수정</button>
												<button type="submit" class="btn btn-danger" formaction="accompanyDeleteAction.jsp">삭제</button>
												</td>											
											</tr>
											<%} %>
       									</table>			
       								</form>
      							</div>
    						</div>
					</div>
			
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingFour">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
						<strong>내 참여 정보 확인 / 수정 / 삭제</strong>
						</button>
						</h2>
    						<div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
      							<div class="accordion-body">
		      						<form action="participationDeleteAction.jsp" method="post">
										<table class="table table-bordered" style="text-align: center; vertical-align: middle;" >
											<tr height="50">
												<td width="100" align="center">코스(수정불가)</td>
												<td width="100" align="center">호스트(수정불가)</td>
												<td width="100" align="center">날짜(수정불가)</td>
												<td width="100" align="center">삭제(수정불가)</td>											
											</tr>
											<%for(int i=0; i<getUserParticipationList.size(); i++) {
        										ParticipationDTO participationDTO = getUserParticipationList.get(i);
        									%>	
											<tr height="50">
												<td width="100" align="center">
													<input type="hidden" class="form-control" name="participation_course" value="<%=participationDTO.getParticipation_course()%>"><%=participationDTO.getParticipation_course()%>
												</td>
												<td width="100" align="center">
													<input type="hidden" class="form-control" name="participation_host" value="<%=participationDTO.getParticipation_host()%>"><%=participationDTO.getParticipation_host()%>
												</td>
												<td width="100" align="center">
													<input type="hidden" class="form-control" name="participation_year" value="<%=participationDTO.getParticipation_year()%>"><%=participationDTO.getParticipation_year()%>년
													<input type="hidden" class="form-control" name="participation_month" value="<%=participationDTO.getParticipation_month()%>"><%=participationDTO.getParticipation_month()%>월
													<input type="hidden" class="form-control" name="participation_date" value="<%=participationDTO.getParticipation_date()%>"><%=participationDTO.getParticipation_date()%>일
												</td>
												<td width="100" align="center">
												<button type="submit" class="btn btn-danger" >삭제</button>
												</td>											
											</tr>
											<%} %>
       									</table>			
       								</form>
      							</div>
    						</div>
					</div>
				</div>
			</div>
		</div>
    </div>
</div>




 

</body>
</html>