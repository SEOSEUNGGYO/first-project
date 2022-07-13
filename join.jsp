<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

</head>

<body>
<jsp:include page="./navbar.jsp"/>

<form action="joinAction.jsp" method="post" name="form">
	<div class="row" style="margin: 0 auto; width: 500px;" >
		<div class="col-12">
		<h3>아이디</h3>
		</div>
		<div class="col-12">
			<input type="text" class="form-control" id="user_id" name="user_id">
		</div>
		
		<div class="col-12">
		<h3>비밀번호</h3>
		</div>
		<div class="col-12">
			<input type="password" class="form-control" id="user_pw" name="user_pw">
		</div>
		
		<div class="col-12">
		<h3>이름</h3>
		</div>
		<div class="col-12">
			<input type="text" class="form-control" id="user_name" name="user_name">
		</div>
		
		<div class="col-12">
		<h3>생년월일</h3>
		</div>
		<div class="wrap">
			<div class="row">
					<div class="col-4">
						<select class="form-select" name="user_year" id="user_year">
							<%for(int i=1940; i<=2022; i++){ %>
							<option value="<%=i %>"><%=i %>년</option>
							<%} %>
						</select>
					</div>
					<div class="col-4">
						<select class="form-select" name="user_month" id="user_month">
							<%for(int i=1; i<=12; i++){ %>
							<option value="<%=i %>"><%=i %>월</option>
							<%} %>
						</select>
					</div>
					<div class="col-4">
						<input type="text" class="form-control" id="user_day" name="user_day" placeholder="일">
					</div>
			</div>
		</div>
		

		<div class="col-12">
		<h3>성별</h3>
		</div>
		<div class="col-12">
			<input type="radio" class="form-check-input" id="gender_m" name="user_gender" value="M">
			<label class="form-check-label" for="gender_m">
    			남
  			</label>
  			<input type="radio" class="form-check-input" id="gender_f" name="user_gender" value="F">
			<label class="form-check-label" for="gender_f">
    			여
  			</label>
		</div>
		
		<div class="col-12">
		<h3>이메일</h3>
		</div>
		<div class="col-12">
			<input type="email" class="form-control" id="user_email" name="user_email" >
		</div>
		
		<div class="col-12">
		<h3>연락처</h3>
		</div>
		<div class="col-12">
			<input type="text" class="form-control" id="user_phone" name="user_phone">
		</div>

		<div class="col-12" style="text-align:center;">
		<button type="submit" class="btn btn-primary" >회원가입</button>
		</div>
	</div>
		
</form>
   


</body>
</html>