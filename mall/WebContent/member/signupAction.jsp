<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%
	// 로그인 중임에도 이 파일을 접근했을 때
	if(session.getAttribute("loginMemberEmail") != null){
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
	
	// 언어 맞추기
	request.setCharacterEncoding("utf-8");
	
	// 매개변수 받아오기
	String memberEmail = request.getParameter("memberEmail");
	String memberPw = request.getParameter("memberPw");
	String memberName = request.getParameter("memberName");
	
	// 사용가능한 이메일인지 아닌지 확인
	MemberDao memberDao = new MemberDao();
	Member member = memberDao.selectMemberEmailCk(memberEmail);
	
	if(member != null){
		response.sendRedirect(request.getContextPath()+"/member/signup.jsp");
		return;
	}
	
	// 멤버리스트에 정보 입력
	Member paraMember = new Member();
	paraMember.setMemberEmail(memberEmail);
	paraMember.setMemberPw(memberPw);
	paraMember.setMemberName(memberName);
	memberDao.insertMember(paraMember);
	
	response.sendRedirect(request.getContextPath()+"/member/login.jsp");
%>