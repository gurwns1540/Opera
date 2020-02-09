package com.opera.survway.admin.model.vo;

public class PanelThanksSurvey {
	private int mno;	//해당 패널의 번호
	private int researchNo;		//리서치 번호 예) researchNo =1 이면 thanks서베이
	private int rquestionNo; 	//문제 번호 리서치 문항 보기 번호 예)thanksSurvey의 문항 번호들 66~79
	private String rquestionResponse;	//패널이 응답한 번호
	private int researchOrder;		//문제 번호
	private String rquestionContext;//문제
	private int rchoiceNo;	//문제 보기문항 고유값
	private String rchoiceContext;	//리서치 보개 내용
	private int rchoiceOrder;	//보기 번호
	
	public PanelThanksSurvey() {}

	public PanelThanksSurvey(int mno, int researchNo, int rquestionNo, String rquestionResponse, int researchOrder,
			String rquestionContext, int rchoiceNo, String rchoiceContext, int rchoiceOrder) {
		super();
		this.mno = mno;
		this.researchNo = researchNo;
		this.rquestionNo = rquestionNo;
		this.rquestionResponse = rquestionResponse;
		this.researchOrder = researchOrder;
		this.rquestionContext = rquestionContext;
		this.rchoiceNo = rchoiceNo;
		this.rchoiceContext = rchoiceContext;
		this.rchoiceOrder = rchoiceOrder;
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

	public int getResearchOrder() {
		return researchOrder;
	}

	public void setResearchOrder(int researchOrder) {
		this.researchOrder = researchOrder;
	}

	public String getRquestionContext() {
		return rquestionContext;
	}

	public void setRquestionContext(String rquestionContext) {
		this.rquestionContext = rquestionContext;
	}

	public int getRchoiceNo() {
		return rchoiceNo;
	}

	public void setRchoiceNo(int rchoiceNo) {
		this.rchoiceNo = rchoiceNo;
	}

	public String getRchoiceContext() {
		return rchoiceContext;
	}

	public void setRchoiceContext(String rchoiceContext) {
		this.rchoiceContext = rchoiceContext;
	}

	public int getRchoiceOrder() {
		return rchoiceOrder;
	}

	public void setRchoiceOrder(int rchoiceOrder) {
		this.rchoiceOrder = rchoiceOrder;
	}

	@Override
	public String toString() {
		return "PanelThanksSurvey [mno=" + mno + ", researchNo=" + researchNo + ", rquestionNo=" + rquestionNo
				+ ", rquestionResponse=" + rquestionResponse + ", researchOrder=" + researchOrder
				+ ", rquestionContext=" + rquestionContext + ", rchoiceNo=" + rchoiceNo + ", rchoiceContext="
				+ rchoiceContext + ", rchoiceOrder=" + rchoiceOrder + "]";
	}
	
	
	
	
	
}
