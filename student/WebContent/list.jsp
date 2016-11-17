<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.student.*" %>    
<jsp:useBean id ="stdao" class="my.student.StudentDAO" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>학생 목록</title>
</head>
<body>
<div align = "center">
<hr color ="green "  width ="300" >
<h2> 학생 목록 보기</h2>
<hr color = "green " width ="300">
<table border ="1" width ="500">
<tr bgcolor="yellow">
    <th width="20%"> 아이디 </th>
    <th width="30%"> 학생명 </th>
    <th width="50%"> 학급명 </th>
      
</tr>
<!--  여기에 DB 의 자료를 가져와서 보여준다 -->
<%		List<StudentDTO> list = stdao.listStudent(); 
		if (list == null || list.size()==0){%>
		<tr>
			<td colspan="3">등록된 학생이 없습니다.
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

