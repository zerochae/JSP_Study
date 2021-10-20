package kr.or.ddit.guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import kr.or.ddit.guestbook.dao.MessageDao;
import kr.or.ddit.guestbook.vo.GuestbookMessageVO;

public class WriteMessageService {

	private static WriteMessageService instance;
	public static WriteMessageService getInstance() {
		if(instance == null) instance = new WriteMessageService();
		return instance;
	}
	private WriteMessageService() {}

	public int write(GuestbookMessageVO message) {
		Connection conn = null;
		try{ 
			conn = ConnectionProvider.getConnection(); 
			MessageDao messageDao = MessageDao.getInstance();
			return messageDao.insert(conn,message);
		} catch(SQLException e) {
			throw new ServiceException("메시지 등록 실패 : " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn); 
		}
	}
}
