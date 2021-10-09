package kr.or.ddit.chap08;

// 자바빈
public class LprodVO {
	
	private int lprodId;
	private String lprodGu;
	private String lprodNm;
	
	public LprodVO() {
	}
	
	public int getLprodId() {
		return lprodId;
	}
	public void setLprodId(int lprodId) {
		this.lprodId = lprodId;
	}
	public String getLprodGu() {
		return lprodGu;
	}
	public void setLprodGu(String lprodGu) {
		this.lprodGu = lprodGu;
	}
	public String getLprodNm() {
		return lprodNm;
	}
	public void setLprodNm(String lprodNm) {
		this.lprodNm = lprodNm;
	}

	@Override
	public String toString() {
		return "LprodVO [lprodId=" + lprodId + ", lprodGu=" + lprodGu + ", lprodNm=" + lprodNm + "]";
	}
}
