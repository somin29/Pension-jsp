<%@page import="finalTest.pensionDo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

	function searchCheck(frm){
		
		if(frm.keyWord.value == ""){
			alert("검색 단어를 입력하세요");
			frm.keyWord.focus();
			return;
		}
		frm.submit();
	}

</script>
</head>
<body>
<jsp:useBean id="pDao" class="finalTest.pensionDao" scope="application" />
<%
	ArrayList<pensionDo> v = pDao.getAllpension();
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	ArrayList<pensionDo> pList = pDao.getpensionlist(keyField, keyWord);
%>

<center>
<h2> 전체 예약 보기</h2>
<hr>
<a href="pensionForm.jsp"> 새로운 정보 추가하기 </a>
<td width="100">
	<tr height="60" align="right"> 
		<select name="sort">
				<option value="오름차순"> 오름차순 </option>
				<option value="내림차순"> 내림차순</option>
		</select>
	</tr>
</td>		
<hr>

<table border="1">
	<tr height="60" align="center">
		<td width="150"> 이름 </td>
		<td width="150"> 전화번호 </td>
		<td width="150"> 이메일 </td>
		<td width="150"> 성별 </td>
		<td width="150"> 방 </td>
		<td width="150"> 직업 </td>
	</tr>

<% 
for(int i=0; i < v.size(); i++) 
{
		pensionDo pDo = v.get(i);
	
%>
	<tr height="60" align="center">
		<td width="150"> 
			<a href="pensionInfo.jsp?num=<%=pDo.getNum() %>"><%=pDo.getName() %></a> 
			</td>
		<td width="150"> <%=pDo.getTel() %> </td>
		<td width="150"> <%=pDo.getEmail() %> </td>
		<td width="150"> <%=pDo.getGender() %> </td>
		<td width="150"> <%=pDo.getJob() %> </td>
		<td width="150"> <%=pDo.getRoom() %> </td>
	</tr>

<% 
}
%> 
<tr>
        <td colspan="7"> <br/>
            <form name="serach" method ="post">
            <select name="keyField">
                <option value="0"> ----선택----</option>
                <option value="name" >이름</option>
                <option value="tel">전화번호</option>
                <option value="email">이메일</option>  
            </select>
            <input type="text" name="keyWord" />
            <input type="button" value="검색" onclick="searchCheck(form)" />
           
            </form>
           
        </td>      
    </tr>
</table>
</center>
</body>
</html>