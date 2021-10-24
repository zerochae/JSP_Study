package kr.or.ddit.guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import kr.or.ddit.guestbook.dao.MessageDao;
import kr.or.ddit.guestbook.vo.GuestbookMessageVO;

public class DeleteMessageService {

	private static DeleteMessageService instance;
	public static DeleteMessageService getInstance() {
		if(instance == null) instance = new DeleteMessageService();
		return instance;
	}
	private DeleteMessageService() {}

	public int delete(int msgNo) {
		Connection conn = null;
		try{ 
			conn = ConnectionProvider.getConnection(); 
			MessageDao messageDao = MessageDao.getInstance();
			return messageDao.delete(conn, msgNo);
		} catch(SQLException e) {
			throw new ServiceException("메시지 삭제 실패 : " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn); 
		}
	}
}
