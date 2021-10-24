package kr.or.ddit.guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import kr.or.ddit.guestbook.dao.MessageDao;
import kr.or.ddit.guestbook.vo.GuestbookMessageVO;

public class GetPasswordService {

	private static GetPasswordService instance;
	public static GetPasswordService getInstance() {
		if(instance == null) instance = new GetPasswordService();
		return instance;
	}
	private GetPasswordService() {}

	public String getPw(int msgNo) {
		Connection conn = null;
		try{ 
			conn = ConnectionProvider.getConnection(); 
			MessageDao messageDao = MessageDao.getInstance();
			return messageDao.getPw(conn, msgNo);
		} catch(SQLException e) {
			throw new ServiceException("메시지 등록 실패 : " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn); 
		}
	}
}
