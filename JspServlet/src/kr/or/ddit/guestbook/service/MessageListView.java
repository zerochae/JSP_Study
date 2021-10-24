package kr.or.ddit.guestbook.service;

import java.util.List;

import kr.or.ddit.guestbook.vo.GuestbookMessageVO;

// 페이징처리 전용 클래스
public class MessageListView {

	private int messageTotalCount; // 전체 글수
	private int currentPageNumber; // 현재 페이지 번호
	private int pageTotalCount; // 전체 페이지 수
	private int messageCountperPage; //페이지별
	private int firstRow; //첫행번호
	private int endRow; //끝행번호
	private List<GuestbookMessageVO> messagelist; //출력할 데이터
	
	//constructor(생성자)
	public MessageListView(int messageTotalCount, int currentPageNumber, int messageCountperPage,
			int firstRow, int endRow, List<GuestbookMessageVO> messagelist) {
		this.messageTotalCount = messageTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.messageCountperPage = messageCountperPage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		this.messagelist = messagelist;
		calculatePageTotalcount();
	}
	
	//전체 행의수, 페이지 별 글의 개수를 이용 => 전체 페이지 개수 구함
	private void calculatePageTotalcount() {
		if(this.messageTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			// 전체 페이지 수 = 전체 행의 수 / 페이지 별 개수
			pageTotalCount = messageTotalCount / messageCountperPage;
			if(messageTotalCount % messageCountperPage != 0) {
				pageTotalCount+=1;
			}
		}
	}

	public int getMessageTotalCount() {
		return messageTotalCount;
	}

	public void setMessageTotalCount(int messageTotalCount) {
		this.messageTotalCount = messageTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}

	public int getMessageCountperPage() {
		return messageCountperPage;
	}

	public void setMessageCountperPage(int messageCountperPage) {
		this.messageCountperPage = messageCountperPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public List<GuestbookMessageVO> getMessagelist() {
		return messagelist;
	}

	public void setMessagelist(List<GuestbookMessageVO> messagelist) {
		this.messagelist = messagelist;
	}
	
	public boolean isEmpty() {
		return messageTotalCount == 0;
	}
	
	
	
	
	
}
