<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	request.setCharacterEncoding("utf-8");
%>


<jsp:useBean id="vo" class="board.BoardVo"/>
<jsp:useBean id="dao" class="board.BoardDao"/>
<jsp:setProperty name="vo" property="*"/>

<%
	dao.insert(vo);
	// response.sendRedirect(request.getContextPath() + "board/list.jsp") 아래와 똑같은 코드 ( 아무거나 써도 됨)
%>
<c:redirect url="${pageContext.request.contextPath}/list.jsp"></c:redirect>