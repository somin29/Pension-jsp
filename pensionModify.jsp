<%@page import="finalTest.pensionDao"%>
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

<jsp:useBean id="pDao" class="finalTest.pensionDao" scope="application"/>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	pensionDo pDo = pDao.getPensionOne(num);
%>

<center>
<h2> 예약 정보 수정</h2>
<hr>
<form action="pensionModifyProc.jsp" method="post">
	<table border="1">
		<tr height="60" align="center"> 
			<td width="100"> 이름 </td>
			<td width="200"> 
				<input type="text" name="name" value="<%=pDo.getName() %>"> 
			</td>
		</tr>
		<tr height="60" align="center"> 
			<td width="100"> 전화번호 </td>
			<td width="200"> 
				<input type="text" name="tel" value="<%=pDo.getTel() %>"> 
			</td>
		</tr>
		<tr height="60" align="center"> 
			<td width="100"> 이메일 </td>
			<td width="200"> 
				<input type="text" name="email" value="<%=pDo.getEmail() %>"> 
			</td>
		</tr>
		<tr height="60" align="center"> 
			<td width="100"> 성별 </td>
			<td width="200"> 
				<input type="text" name="gender" value="<%=pDo.getGender() %>"> 
			</td>
		</tr>
		<tr height="60" align="center"> 
			<td width="100"> 방 </td>
			<td width="200"> 
				<input type="text" name="room" value="<%=pDo.getRoom() %>"> 
			</td>
		</tr>
		<tr height="60" align="center"> 
			<td width="100"> 직업 </td>
			<td width="200"> 
				<input type="text" name="job" value="<%=pDo.getJob() %>"> 
			</td>
		</tr>
		<tr height="60" align="center"> 
			<td colspan="2"> 
			<input type="hidden" name="num" value="<%=pDo.getNum() %>">
			<input type="submit" value="수정하기">
			<input type="button" value="목록보기"
				onclick="location.href='pensionList.jsp'">
			</td>
		</tr>
	</table>
</form>
</center>
</body>
</html>