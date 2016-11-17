<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<jsp:useBean id ="stdao" class="my.student.StudentDAO" />
<!-- my.student.StudentDAO stdao = new my.student.StudentDAO(); 
useBean 이란 jsp 에서 사용하는 객체 만드는 방법이다. -->

<%
	request.setCharacterEncoding("EUC-KR");//post에서의 한글처리 방식
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String cname = request.getParameter("cname");
	
	int result = stdao.insertStudent(id, name, cname);
	if (result>0){%>
		<script type="text/javascript">
			alert("학생등록성공!!")
			location.href="list.jsp"
		</script>
<%	}else {%>
		<script type="text/javascript">
			alert("학생등록실패!!")
			location.href="student.jsp"
		</script>	
<%	}%>