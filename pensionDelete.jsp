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
	pDao.deletePension(num); //데이터 삭제
	response.sendRedirect("pensionList.jsp"); 
%>

</body>
</html>