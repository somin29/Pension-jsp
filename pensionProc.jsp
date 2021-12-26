<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>펜션 등록 정보 확인</title>
</head>
<body>
<center>
<h2> 펜션 등록 정보</h2>
<hr>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="pDo" class="finalTest.pensionDo">
	<jsp:setProperty name="pDo" property="*" />
</jsp:useBean>

<jsp:useBean id="pDao" class="finalTest.pensionDao" scope="application" />

<%

		pDao.insertpension(pDo);

%>

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
			<td width="100"> 직업 </td>
			<td width="200"> <%=pDo.getJob() %> </td>
		</tr>
		<tr height="60" align="center"> 
			<td width="100"> 방 </td>
			<td width="200"> <%=pDo.getRoom() %> </td>
		</tr>
</table>
<br>
<br>
<a href="pensionList.jsp"> 전체 예약정보 보기</a>
</center>
</body>
</html>