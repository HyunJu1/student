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
		alert("���̵� ���������ʽ��ϴ�. �ٽ��ѹ� �Է��� �ּ���!!")
		history.back();
		
			</script>
	<% return;  }  
    
	
	int result = stdao.deleteStudent(id);
	if (result>0){%>
	<script type="text/javascript">
		alert("�л���������!!")
		location.href="list.jsp"
	</script>
<%	}else {%>
	<script type="text/javascript">
		alert("�л���������!!")
		location.href="student.jsp"
	</script>	
<%	}%>