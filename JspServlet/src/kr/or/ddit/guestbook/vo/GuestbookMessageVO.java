package kr.or.ddit.guestbook.vo;

public class GuestbookMessageVO {

	private int messageId;
	private String guestName;
	private String password;
	private String message;

	public int getMessageId() {
		return messageId;
	}

	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}

	public String getGuestName() {
		return guestName;
	}

	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "GuestbookMessageVO [messageId=" + messageId + ", guestName=" + guestName + ", password=" + password
				+ ", message=" + message + "]";
	}

}
