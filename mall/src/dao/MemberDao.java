package dao;
import vo.*;
import java.util.*;
import java.sql.*;
import commons.DBUtil;

public class MemberDao {
	// 로그인(이메일과 비밀번호가 맞는지)
	public String login(Member member) throws Exception{
		String memberEmail = null;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select member_email from member where member_email = ? and member_pw = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberEmail());
		stmt.setString(2, member.getMemberPw());
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) { // 로그인 성공
			memberEmail = rs.getString("member_email");
		}
		conn.close();
		return memberEmail;
	}
	
	// 멤버 정보 입력
	public void insertMember(Member member) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "insert into member(member_email, member_pw, member_name, member_date) values(?, ?, ?, now())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberEmail());
		stmt.setString(2, member.getMemberPw());
		stmt.setString(3, member.getMemberName());
		
		stmt.executeUpdate();
		conn.close();
	}
	
	// 가입할 때 이메일 중복 확인
	public Member selectMemberEmailCk(String memberEmail) throws Exception{
		Member member = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		/*
		 * SELECT id
		 * FROM
		 * (SELECT member_email FROM member
		 * UNION
		 * SELECT admin_id FROM admin) email
		 * WHERE id = '';
		 */
		String sql = "select id from (select member_email id from member union select admin_id id from admin) email where id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberEmail);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			// 지금 입력한 이메일은 이미 가입되있는 이메일이므로 사용 불가능
			member = new Member();
			member.setMemberEmail(rs.getString("id"));
		}
		conn.close();
		return member;
	}
	
	public Member selectMemberOne(String memberEmail) throws Exception{
		Member member = null;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select member_email, member_name, member_date from member where member_email = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberEmail);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			member = new Member();
			member.setMemberEmail(rs.getString("member_email"));
			member.setMemberName(rs.getString("member_name"));
			member.setMemberDate(rs.getString("member_date"));
		}
		
		conn.close();
		return member;
	}
}
