package kr.or.ddit.guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import kr.or.ddit.guestbook.dao.MessageDao;
import kr.or.ddit.guestbook.vo.GuestbookMessageVO;

public class GetMessageListService {

	private static GetMessageListService instance;

	public static GetMessageListService getInstance() {
		if (instance == null)
			instance = new GetMessageListService();
		return instance;
	}

	private GetMessageListService() {
	}

	// 한 페이지에 보여줄 메시지 개수를 3으로 지정( 상수 )

	private static final int MESSAGE_COUNT_PER_PAGE = 10;

	// 파라미터 : 페이지 번호

	public MessageListView getMessageList(int pageNumber) {
		Connection conn = null;
		// 전체 데이터를 담을 List 선언
		List<GuestbookMessageVO> messageList = null;

		// 현재 페이지 번호
		int currentPageNumber = pageNumber;

		try {

			conn = ConnectionProvider.getConnection();
			// Data Access Object (DB작업하는 객체)
			MessageDao messageDao = MessageDao.getInstance();
			// 전체 글수를 구함
			int messageTotalCount = messageDao.selectCount(conn);

			// 첫행
			int firstRow = 0;

			// 끝행
			int endRow = 0;

			if (messageTotalCount > 0) {
				// 첫행 공식 : (현재 페이지 -1 ) * 출력할데이터개수 + 1;
				firstRow = (currentPageNumber - 1) * MESSAGE_COUNT_PER_PAGE + 1;
				// 끝행 공식 : firstRow + 출력할데이터 개수 -1;
				endRow = firstRow + MESSAGE_COUNT_PER_PAGE - 1;
				// 글 목록 구하기
				messageList = messageDao.selectList(conn, firstRow, endRow);
			} else { // 데이터가 없으면..
				currentPageNumber = 0;
				messageList = Collections.emptyList();
			}
			return new MessageListView(messageTotalCount, currentPageNumber, MESSAGE_COUNT_PER_PAGE, firstRow, endRow, messageList);

		} catch (SQLException e) {
			throw new ServiceException("목록 구하기 실패 : " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
