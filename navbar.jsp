<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);	
	.jejugothic-font{
		font-family: 'Jeju Gothic', sans-serif;
		color: black;
	}
@import url(//fonts.googleapis.com/earlyaccess/jejuhallasan.css);
	.jejuhallasan-font{
		font-family: 'Jeju Hallasan', cursive;
		color: black;
	}
</style>

</head>

<body>
<%
	String user_id = null;
	if(session.getAttribute("user_id")!=null){
		user_id = String.valueOf(session.getAttribute("user_id"));
	}
	
%>
	<nav class="navbar navbar-expand-lg bg-light" >
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp">
				<img src="./images/icon.JPG" width="90" height="70">
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
   		   	<span class="navbar-toggler-icon"></span>
   		   	</button>
   		   	<div class="collapse navbar-collapse" id="navbarSupportedContent">
      			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
      				<li class="nav-item">
      					<a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
      				</li>
      				<li class="nav-item">
      					<a class="nav-link" href="olle.jsp">olle</a>
      				</li>
      				<li class="nav-item">
      					<a class="nav-link" href="accompany.jsp">accompony</a>
      				</li>
       				<li class="nav-item dropdown">
       					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            				<%if(user_id!=null){%>
            					<%=user_id %>님 안녕하세요
            				<%}else{%>
            					로그인해주세요
            				<%} %>
            				
         		 		</a>
          				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
          				<%if(user_id==null){%>
        				    <li><a class="dropdown-item" href="join.jsp">Join</a></li>
        				    <li><hr class="dropdown-divider"></li>
        			    	<li><a class="dropdown-item" href="login.jsp">LogIn</a></li>
    	  			     	<li><hr class="dropdown-divider"></li>
    	  			     	<%}else{ %>
      				     	<li><a class="dropdown-item" href="logout.jsp">LogOut</a></li>
      				     	<li><hr class="dropdown-divider"></li>
      				     	<%if("admin".equals(user_id)){ %>
      				      	<li><a class="dropdown-item" href="adminMain.jsp">AdminPage</a></li>
      				      	<% %>
      				     	<%}else{ %>
      				      	<li><a class="dropdown-item" href="myPage.jsp">MyPage</a></li>
      				      	<li><hr class="dropdown-divider"></li>
      				      	<%}} %>
    				    </ul>
					</li>
      			</ul>
			</div>
		</div>
	</nav>
	
	


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
</body>
</html>