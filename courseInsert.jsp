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

<div class="container mx-auto py-3"  style="width: 600px;">
<form action="courseInsertAction.jsp" method="post">
	<table class="table table-bordered" style="text-align: center; vertical-align: middle;" >
		<tr height="50">
			<td width="300" align="center">코스 번호</td>
			<td width="300"  align="center">
				<input type="text" class="form-control" name="course_id">
			</td>
		</tr>
		<tr height="50">
			<td width="300" align="center">코스 이름</td>
			<td width="300"  align="center">
				<input type="text"class="form-control"name="course_name">
			</td>
		</tr>
		<tr height="50">
			<td width="300" align="center">코스 총 길이</td>
			<td width="300"  align="center">
				<input type="text" class="form-control" name="course_length">
			</td>
		</tr>
		<tr height="50">
			<td width="300" align="center">소요 시간</td>
			<td width="300"  align="center">
			<input type="text"  style="width: 50px;" name="course_hour"> ~
			<input type="text"  style="width: 50px;"  name="course_hour2"> 시간
			
			</td>
		</tr>
		<tr height="50">
			<td width="300" align="center">난이도</td>
			<td width="300"  align="center">
				<select class="form-select" name="course_level" style="width: 100px;">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
				</select>
			</td>
		</tr>
		<tr height="50">
			<td width="300" align="center">코스 출발점
			<td width="300"  align="center">
			<input type="text" class="form-control" name="course_start">
			</td>
		</tr>
		<tr height="50">
			<td width="300" align="center">코스 중간점
			<td width="300"  align="center">
			<input type="text" class="form-control" name="course_middle">
			</td>
		</tr>
		<tr height="50">
			<td width="300" align="center">코스 끝점
			<td width="300"  align="center">
			<input type="text" class="form-control" name="course_finish">
			</td>
		</tr>
		<tr height="50">
			<td colspan="2" width="150" align="center">
			<button type="button" class="btn btn-secondary" onclick="location.href='adminMain.jsp'">취소</button>
  			<button type="submit" class="btn btn-primary">등록</button>
		</td>	
	</table>
</form>
</div>

 

</body>
</html>