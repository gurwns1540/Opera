/**
 * 
 */
package com.opera.survway.panel.model.vo;

/**
 * @author Sooo
 *
 */
public class InsertAnswer {
	
	private int mno;
	private int researchNo;
	private String totalAnswer;
	private String researchTime;
	private String researchDisposal;
	private int rquestionNo;
	private String rquestionResponse;
	private int pcCount;
	private int targetCount;
	private int researchOrder;
	
	public InsertAnswer() {}

	public InsertAnswer(int mno, int researchNo, String totalAnswer, String researchTime, String researchDisposal,
			int rquestionNo, String rquestionResponse, int pcCount, int targetCount, int researchOrder) {
		super();
		this.mno = mno;
		this.researchNo = researchNo;
		this.totalAnswer = totalAnswer;
		this.researchTime = researchTime;
		this.researchDisposal = researchDisposal;
		this.rquestionNo = rquestionNo;
		this.rquestionResponse = rquestionResponse;
		this.pcCount = pcCount;
		this.targetCount = targetCount;
		this.researchOrder = researchOrder;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getResearchNo() {
		return researchNo;
	}

	public void setResearchNo(int researchNo) {
		this.researchNo = researchNo;
	}

	public String getTotalAnswer() {
		return totalAnswer;
	}

	public void setTotalAnswer(String totalAnswer) {
		this.totalAnswer = totalAnswer;
	}

	public String getResearchTime() {
		return researchTime;
	}

	public void setResearchTime(String researchTime) {
		this.researchTime = researchTime;
	}

	public String getResearchDisposal() {
		return researchDisposal;
	}

	public void setResearchDisposal(String researchDisposal) {
		this.researchDisposal = researchDisposal;
	}

	public int getRquestionNo() {
		return rquestionNo;
	}

	public void setRquestionNo(int rquestionNo) {
		this.rquestionNo = rquestionNo;
	}

	public String getRquestionResponse() {
		return rquestionResponse;
	}

	public void setRquestionResponse(String rquestionResponse) {
		this.rquestionResponse = rquestionResponse;
	}

	public int getPcCount() {
		return pcCount;
	}

	public void setPcCount(int pcCount) {
		this.pcCount = pcCount;
	}

	public int getTargetCount() {
		return targetCount;
	}

	public void setTargetCount(int targetCount) {
		this.targetCount = targetCount;
	}

	public int getResearchOrder() {
		return researchOrder;
	}

	public void setResearchOrder(int researchOrder) {
		this.researchOrder = researchOrder;
	}

	@Override
	public String toString() {
		return "InsertAnswer [mno=" + mno + ", researchNo=" + researchNo + ", totalAnswer=" + totalAnswer
				+ ", researchTime=" + researchTime + ", researchDisposal=" + researchDisposal + ", rquestionNo="
				+ rquestionNo + ", rquestionResponse=" + rquestionResponse + ", pcCount=" + pcCount + ", targetCount="
				+ targetCount + ", researchOrder=" + researchOrder + "]";
	}
	
}



