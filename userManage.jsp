<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%!int pageSize=10;%>
<%


String pageNum = request.getParameter("pageNum");

if(pageNum==null){
	pageNum="1";
}
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage - 1) * pageSize + 1;
int endRow = currentPage * pageSize;
int count = 0;
int number = 0;


UserDAO userDAO = new UserDAO();
count = userDAO.getUserCount();
ArrayList<UserDTO> getUserList = userDAO.getUserList(startRow, pageSize);






%>


<div class="container-fluid container pt-3" align="center"> 

	<% 
	for(int i=0; i<getUserList.size(); i++){ 
    	UserDTO userDTO = getUserList.get(i);
    %>
    <form action="userDeleteAction.jsp" method="post">	
	<div class="row pt-3">
		<div class="col-md-2">
			<p>
			<strong>ID</strong>
			<input type="hidden" name="user_id" value="<%=userDTO.getUser_id() %>"><%=userDTO.getUser_id() %>
			</p>
		</div>
		<div class="col-md-2">
			<p>
			<strong>이름</strong>
			<input type="hidden" name="user_name" value="<%=userDTO.getUser_name() %>"><%=userDTO.getUser_name() %>
			</p>
		</div>
		<div class="col-md-2">
			<p>
			<strong>연락처</strong>
			<input type="hidden" name="user_phone" value="<%=userDTO.getUser_phone() %>"><%=userDTO.getUser_phone() %>
			</p>
		</div>
		<div class="col-md-2">
			<p>
			<strong>성별</strong>
			<input type="hidden" name="user_gender" value="<%=userDTO.getUser_gender() %>"><%=userDTO.getUser_gender() %>
			</p>
		</div>
		<div class="col-md-2">
			<p>
			<strong>이메일</strong>
			<input type="hidden" name="user_email" value="<%=userDTO.getUser_email() %>"><%=userDTO.getUser_email() %>
			</p>
		</div>
		<div class="col-md-2">
			<button type="submit" class="btn btn-danger">삭제</button>
		</div>
	</div>
	<hr class="text-success border-2 opacity-50">
	
	
		
	</form>
	<%}%>	
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
            <li class="page-item"><a class="page-link" href="userManage.jsp?pageNum=<%= startPage - 10 %>">[이전]</a></li>
<%      }
        
        for (int i = startPage ; i <= endPage ; i++) {  %>
			<li class="page-item"><a class="page-link" href="userManage.jsp?pageNum=<%= i %>">[<%= i %>]</a></li>
<%      }
        
        if (endPage < pageCount) {  %>
        	<li class="page-item"><a class="page-link" href="userManage.jsp?pageNum=<%=startPage + 10 %>">[다음]</a></li>
<%
        }
    }
%>
		</ul>
	</nav>
</div>

 

</body>
</html>