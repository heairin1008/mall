package dao;
import java.util.*;
import vo.*;
import commons.DBUtil;
import java.sql.*;

public class NoticeDao {
	//메인페이지 공지 리스트 출력
	public ArrayList<Notice> selecrMainNoticeList() throws Exception{
		ArrayList<Notice> list = new ArrayList<Notice>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select notice_id, notice_title from notice order by notice_date desc limit 0, 2";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		// 반복문을 통해 데이터 순서대로 입력
		while(rs.next()) {
			Notice notice = new Notice();
			notice.setNoticeId(rs.getInt("notice_id"));
			notice.setNoticeTitle(rs.getString("notice_title"));
			list.add(notice);
		}
		
		conn.close();
		return list;
	}
	
	//공지 상세보기
	public Notice selectNoticeOne(int noticeId) throws Exception{
		Notice notice = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select notice_id, notice_title, notice_content, notice_date from notice where notice_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, noticeId);
		ResultSet rs = stmt.executeQuery();
		
		// 반복문을 통해 데이터 순서대로 입력
		while(rs.next()) {
			notice = new Notice();
			notice.setNoticeId(rs.getInt("notice_id"));
			notice.setNoticeTitle(rs.getString("notice_title"));
			notice.setNoticeContent(rs.getString("notice_content"));
			notice.setNoticeDate(rs.getString("notice_date"));
		}
		
		return notice;
	}
	
	// 공지리스트 출력
	public ArrayList<Notice> selectNoticeList() throws Exception{
		ArrayList<Notice> list = new ArrayList<Notice>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
			
		String sql = "select notice_id, notice_title, notice_date from notice order by notice_date desc";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
			
		// 반복문을 통해 데이터 순서대로 입력
		while(rs.next()) {
			Notice notice = new Notice();
			notice.setNoticeId(rs.getInt("notice_id"));
			notice.setNoticeTitle(rs.getString("notice_title"));
			notice.setNoticeDate(rs.getString("notice_date"));
			list.add(notice);
		}
			
		conn.close();
		return list;
	}
}
