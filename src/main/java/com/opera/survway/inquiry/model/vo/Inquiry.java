package com.opera.survway.inquiry.model.vo;

import java.sql.Date;

public class Inquiry {
	private int inquiryNo;
	private String inquiryTitle;
	private String inquiryContext;
	private String inquiryAnswer;
	private int mno;
	private int inquiryCategoryNo;
	private Date inquiryDate;
	private Date inquiryAnswerDate;
	
	public Inquiry() {}
	
	public Inquiry(int inquiryNo, String inquiryTitle, String inquiryContext, String inquiryAnswer, int mno,
			int inquiryCategoryNo, Date inquiryDate, Date inquiryAnswerDate) {
		super();
		this.inquiryNo = inquiryNo;
		this.inquiryTitle = inquiryTitle;
		this.inquiryContext = inquiryContext;
		this.inquiryAnswer = inquiryAnswer;
		this.mno = mno;
		this.inquiryCategoryNo = inquiryCategoryNo;
		this.inquiryDate = inquiryDate;
		this.inquiryAnswerDate = inquiryAnswerDate;
	}

	public int getInquiryNo() {
		return inquiryNo;
	}

	public void setInquiryNo(int inquiryNo) {
		this.inquiryNo = inquiryNo;
	}

	public String getInquiryTitle() {
		return inquiryTitle;
	}

	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}

	public String getInquiryContext() {
		return inquiryContext;
	}

	public void setInquiryContext(String inquiryContext) {
		this.inquiryContext = inquiryContext;
	}

	public String getInquiryAnswer() {
		return inquiryAnswer;
	}

	public void setInquiryAnswer(String inquiryAnswer) {
		this.inquiryAnswer = inquiryAnswer;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getInquiryCategoryNo() {
		return inquiryCategoryNo;
	}

	public void setInquiryCategoryNo(int inquiryCategoryNo) {
		this.inquiryCategoryNo = inquiryCategoryNo;
	}

	public Date getInquiryDate() {
		return inquiryDate;
	}

	public void setInquiryDate(Date inquiryDate) {
		this.inquiryDate = inquiryDate;
	}

	public Date getInquiryAnswerDate() {
		return inquiryAnswerDate;
	}

	public void setInquiryAnswerDate(Date inquiryAnswerDate) {
		this.inquiryAnswerDate = inquiryAnswerDate;
	}

	@Override
	public String toString() {
		return "Inquiry [inquiryNo=" + inquiryNo + ", inquiryTitle=" + inquiryTitle + ", inquiryContext="
				+ inquiryContext + ", inquiryAnswer=" + inquiryAnswer + ", mno=" + mno + ", inquiryCategoryNo="
				+ inquiryCategoryNo + ", inquiryDate=" + inquiryDate + ", inquiryAnswerDate=" + inquiryAnswerDate + "]";
	}
	
	
	
	
	
	
}
