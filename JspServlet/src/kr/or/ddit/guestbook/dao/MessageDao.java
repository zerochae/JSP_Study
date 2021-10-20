package kr.or.ddit.guestbook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
}
