<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<jsp:useBean id ="stdao" class="my.student.StudentDAO" />
<!-- my.student.StudentDAO stdao = new my.student.StudentDAO(); 
useBean �̶� jsp ���� ����ϴ� ��ü ����� ����̴�. -->

<%
	request.setCharacterEncoding("EUC-KR");//post������ �ѱ�ó�� ���
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String cname = request.getParameter("cname");
	
	int result = stdao.insertStudent(id, name, cname);
	if (result>0){%>
		<script type="text/javascript">
			alert("�л���ϼ���!!")
			location.href="list.jsp"
		</script>
<%	}else {%>
		<script type="text/javascript">
			alert("�л���Ͻ���!!")
			location.href="student.jsp"
		</script>	
<%	}%>