package dao;
import vo.*;
import java.util.*;
import java.sql.*;
import commons.DBUtil;

public class MemberDao {
	// �α���(�̸��ϰ� ��й�ȣ�� �´���)
	public String login(Member member) throws Exception{
		String memberEmail = null;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select member_email from member where member_email = ? and member_pw = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberEmail());
		stmt.setString(2, member.getMemberPw());
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) { // �α��� ����
			memberEmail = rs.getString("member_email");
		}
		conn.close();
		return memberEmail;
	}
	
	// ��� ���� �Է�
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
	
	// ������ �� �̸��� �ߺ� Ȯ��
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
			// ���� �Է��� �̸����� �̹� ���Ե��ִ� �̸����̹Ƿ� ��� �Ұ���
			member = new Member();
			member.setMemberEmail(rs.getString("id"));
		}
		conn.close();
		return member;
	}
}