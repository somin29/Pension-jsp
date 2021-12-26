<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="pDo" class="finalTest.pensionDo">
	<jsp:setProperty name="pDo" property="*"/>
</jsp:useBean>

<jsp:useBean id="pDao" class="finalTest.pensionDao" scope="application"/>

<%
	pDao.modifypension(pDo); //수정된 데이터 저장
	response.sendRedirect("pensionList.jsp"); //수정 데이터 확인 

%>
</body>
</html>