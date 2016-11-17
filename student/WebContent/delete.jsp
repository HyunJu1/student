<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <jsp:useBean id ="stdao" class="my.student.StudentDAO" />
	
	<% 
	request.setCharacterEncoding("EUC-KR");
	String f= request.getParameter("f");
	String id = request.getParameter("id");
	if(id ==null || id.trim().equals("")){
	//	response.sendRedirect("student.jsp"); 
	%>
	<script type="text/javascript">
		alert("아이디가 존재하지않습니다. 다시한번 입력해 주세요!!")
		history.back();
		
			</script>
	<% return;  }  
    
	
	int result = stdao.deleteStudent(id);
	if (result>0){%>
	<script type="text/javascript">
		alert("학생삭제성공!!")
		location.href="list.jsp"
	</script>
<%	}else {%>
	<script type="text/javascript">
		alert("학생삭제실패!!")
		location.href="student.jsp"
	</script>	
<%	}%>