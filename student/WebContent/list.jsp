<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.student.*" %>    
<jsp:useBean id ="stdao" class="my.student.StudentDAO" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�л� ���</title>
</head>
<body>
<div align = "center">
<hr color ="green "  width ="300" >
<h2> �л� ��� ����</h2>
<hr color = "green " width ="300">
<table border ="1" width ="500">
<tr bgcolor="yellow">
    <th width="20%"> ���̵� </th>
    <th width="30%"> �л��� </th>
    <th width="50%"> �б޸� </th>
      
</tr>
<!--  ���⿡ DB �� �ڷḦ �����ͼ� �����ش� -->
<%		List<StudentDTO> list = stdao.listStudent(); 
		if (list == null || list.size()==0){%>
		<tr>
			<td colspan="3">��ϵ� �л��� �����ϴ�.
		</tr>
<%		}else{ 
			for(StudentDTO dto : list){%>
		<tr>
			<td><%=dto.getId()%></td>
			<td><%=dto.getName()%></td>
			<td><%=dto.getCname()%></td>
		</tr>			
<%			}
		}	%>					
	</table>
	</div>
</body>
</html>

