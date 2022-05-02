<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="dao" class="board.BoardDao"/> 

<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardVo vo = dao.selectOne(num);
	pageContext.setAttribute("vo",vo);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
</head>

<body>
<h3>수정하기</h3>
<form action="edit.jsp" method="post">
	<input type="hidden" name="num" value="${vo.num}"> <% // num 값을 전달해주기 위해서.... 안보이게 하나 만듬. %>
	<input type="text" name="title" value="${vo.title}" }required><br> <% //데이터베이스 필드 만들때 not null인 경우 required.. %>
	<input type="text" name="writer" value="${vo.writer}" required disabled><br>
	<textarea rows="4" cols="22" name="content" placeholder="내용">${vo.content}</textarea><br>
	<input type="submit" value="수정완료">
</form>
</body>
</html>