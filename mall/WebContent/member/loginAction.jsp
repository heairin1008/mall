<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%
	if(session.getAttribute("loginMemberEmail") != null){
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}

	// 매개변수 값 받아오기
	request.setCharacterEncoding("utf-8");
	String memberEmail = request.getParameter("memberEmail");
	String memberPw = request.getParameter("memberPw");
	
	Member paraMember = new Member();
	paraMember.setMemberEmail(memberEmail);
	paraMember.setMemberPw(memberPw);
	
	// 받아온 로그인 값과 저장되어있는 정보가 같은지 비교
	MemberDao memberDao = new MemberDao();
	String paraMemberEmail = memberDao.login(paraMember);
	if(paraMemberEmail == null){
		// 정보가 없으면 로그인 페이지로
		response.sendRedirect(request.getContextPath()+"/member/login.jsp");
	}else{
		// 정보가 일치하면 인덱스로
		session.setAttribute("loginMemberEmail", paraMemberEmail);
		response.sendRedirect(request.getContextPath()+"/index.jsp");
	}


%>