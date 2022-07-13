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

<form action="loginAction.jsp" method="post" name="form">
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
		<div class="col-12" style="text-align:center;">
		<button type="submit" class="btn btn-primary" >로그인</button>
		</div>
		
	</div>
		
</form>
   


</body>
</html>