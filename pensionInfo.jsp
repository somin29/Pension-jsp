<%@page import="finalTest.pensionDo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="pDao" class="finalTest.pensionDao" scope="application" />

<%
	int num = Integer.parseInt(request.getParameter("num"));
	pensionDo pDo = pDao.getPensionOne(num);
%>

<center>
<h2> 선택한 예약정보 보기</h2>
<hr>
<table border="1">
		<tr height="60" align="center"> 
			<td width="100"> 이름 </td>
			<td width="200"> <%=pDo.getName() %> </td>
		</tr>
		<tr height="60" align="center"> 
			<td width="100"> 전화번호 </td>
			<td width="200"> <%=pDo.getTel() %> </td>
		</tr>
		<tr height="60" align="center"> 
			<td width="100"> 이메일 </td>
			<td width="200"> <%=pDo.getEmail() %> </td>
		</tr>
		<tr height="60" align="center"> 
			<td width="100"> 성별 </td>
			<td width="200"> <%=pDo.getGender() %> </td>
		</tr>
		<tr height="60" align="center"> 
			<td width="100"> 방 </td>
			<td width="200"> <%=pDo.getRoom() %> </td>
		</tr>
		<tr height="60" align="center"> 
			<td width="100"> 직업 </td>
			<td width="200"> <%=pDo.getJob() %> </td>
		</tr>
		<tr height="60" align="center"> 
			<td colspan="2">
				<input type="button" value="수정하기"
					onclick="location.href='pensionModify.jsp?num=<%=pDo.getNum() %>'">
				<input type="button" value="삭제하기"
					onclick="location.href='pensionDelete.jsp?num=<%=pDo.getNum() %>'">
				<input type="button" value="목록보기"
					onclick="location.href='pensionList.jsp'">
			</td>
		</tr>
</table>
</center>
</body>
</html>