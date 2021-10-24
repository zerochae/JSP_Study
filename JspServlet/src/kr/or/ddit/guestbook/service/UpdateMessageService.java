package kr.or.ddit.guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import kr.or.ddit.guestbook.dao.MessageDao;
import kr.or.ddit.guestbook.vo.GuestbookMessageVO;

public class UpdateMessageService {

	private static UpdateMessageService instance;
	public static UpdateMessageService getInstance() {
		if(instance == null) instance = new UpdateMessageService();
		return instance;
	}
	private UpdateMessageService() {}

	public int update(GuestbookMessageVO message) {
		Connection conn = null;
		try{ 
			conn = ConnectionProvider.getConnection(); 
			MessageDao messageDao = MessageDao.getInstance();
			return messageDao.update(conn, message);
		} catch(SQLException e) {
			throw new ServiceException("메시지 등록 수정 : " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn); 
		}
	}
}
