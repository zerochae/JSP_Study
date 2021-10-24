package kr.or.ddit.guestbook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import jdbc.JdbcUtil;
import kr.or.ddit.guestbook.vo.GuestbookMessageVO;

public class MessageDao {

	private static MessageDao instance;

	public static MessageDao getInstance() {
		if (instance == null)
			instance = new MessageDao();
		return instance;

	}

	private MessageDao() {
	}

	public int insert(Connection conn, GuestbookMessageVO message) {
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into guestbook_message(message_id,guest_name,password,message) values (seq_gm.nextval,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, message.getGuestName());
			pstmt.setString(2, message.getPassword());
			pstmt.setString(3, message.getMessage());
			return pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	public int update(Connection conn, GuestbookMessageVO message) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			
			pstmt = conn.prepareStatement("update guestbook_message set guest_name = ? , password = ? , message = ? where message_id = ?");
			
//			stmt.executeQuery("delete from guestbook_message where message_id= '"+MsgNo+"' ");
//			// 리턴값이 null일 수가 없어요
			
			pstmt.setString(1, message.getGuestName());
			pstmt.setString(2, message.getPassword());
			pstmt.setString(3, message.getMessage());
			pstmt.setInt(4, message.getMessageId());
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public String getPw(Connection conn , int MsgNo) {
		Statement stmt = null;
		ResultSet rs = null;
		try {

			stmt = conn.createStatement();
			rs = stmt.executeQuery("select password from guestbook_message where message_id= '"+MsgNo+"' ");
			// 리턴값이 null일 수가 없어요
			rs.next();
			
			

			return rs.getString(1);

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
	
	public int delete(Connection conn , int MsgNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			
			pstmt = conn.prepareStatement("delete from guestbook_message where message_id= ?");
			
//			stmt.executeQuery("delete from guestbook_message where message_id= '"+MsgNo+"' ");
//			// 리턴값이 null일 수가 없어요
			
			pstmt.setInt(1, MsgNo);
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
//	public int delete(Connection conn, GuestbookMessageVO message) {
//		PreparedStatement pstmt = null;
//		try {
//			String sql = "select password from guestbook_message where message_id=?;";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, message.getGuestName());
//			pstmt.setString(2, message.getPassword());
//			pstmt.setString(3, message.getMessage());
//			return pstmt.executeUpdate();
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//			return 0;
//		} finally {
//			JdbcUtil.close(pstmt);
//		}
//	}

	public int selectCount(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		try {

			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from guestbook_message");
			// 리턴값이 null일 수가 없어요
			rs.next();

			return rs.getInt(1);

		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

	public List<GuestbookMessageVO> selectList(Connection conn, int firstRow, int endRow) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(
					"SELECT S.* " + 
					"FROM (SELECT ROW_NUMBER() OVER(ORDER BY MESSAGE_ID DESC) RNUM, MESSAGE_ID,GUEST_NAME,PASSWORD,MESSAGE FROM GUESTBOOK_MESSAGE)S " + 
					"WHERE S.RNUM BETWEEN ? AND ?");
			
			pstmt.setInt(1, firstRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			
			List<GuestbookMessageVO> messageList = new ArrayList<>();
			
			while(rs.next()) {
				GuestbookMessageVO vo = new GuestbookMessageVO();
				vo.setMessageId(rs.getInt("MESSAGE_ID"));
				vo.setGuestName(rs.getString("GUEST_NAME"));
				vo.setPassword(rs.getString("PASSWORD"));
				vo.setMessage(rs.getString("MESSAGE"));
				messageList.add(vo);
		}
			return messageList;
			
//			if(rs.next()) {
//				List<GuestbookMessageVO> messageList = new ArrayList<>();
//				do {
//					GuestbookMessageVO vo = new GuestbookMessageVO();
//					vo.setMessageId(rs.getInt("MESSAGE_ID"));
//					vo.setGuestName(rs.getString("GUEST_NAME"));
//					vo.setPassword(rs.getString("PASSWORD"));
//					vo.setMessage(rs.getString("MESSAGE"));
//					
//					messageList.add(vo);
//					
//				}while(rs.next());
//				return messageList;
//			} else {
//				return Collections.emptyList();
//			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
	}
	

}
