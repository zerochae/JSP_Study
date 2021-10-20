package kr.or.ddit.guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import kr.or.ddit.guestbook.dao.MessageDao;

public class GetMessageListService {
	
	private static GetMessageListService instance;
	public static GetMessageListService getInstance() {
		if(instance == null) instance = new GetMessageListService();
		return instance; 
	}
	private GetMessageListService() {}
	
	// 한 페이지에 보여줄 메시지 개수를 3으로 지정( 상수 )
	
	private static final int MESSAGE_COUNT_PER_PAGE = 3;
	
	// 파라미터 : 페이지 번호
	
	public void getMessageList(int pageNumber) {
		Connection conn = null;
		
		//현재 페이지 번호
		int currentPageNumber = pageNumber;
		
		try {
			
			conn = ConnectionProvider.getConnection();
			//Data Access Object (DB작업하는 객체)
			MessageDao messageDao = MessageDao.getInstance();
			// 전체 글수를 구함
			int messageTotalCount = messageDao.selectCount(conn);
		} catch (SQLException e) {
			// TODO: handle exception
		}
	}

}
