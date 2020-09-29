<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
	response.sendRedirect(request.getContextPath()+"/index.jsp");
	// 세션 삭제
	// 인덱스 페이지로 이동
	
%>