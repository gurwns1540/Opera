package com.opera.survway.common.model.vo;

import java.sql.Date;

public class ResearchState {
	private int researchHistoryNo;
	private int researchNo;
	private int researchStateNo;
	private Date changeDate;
	private String referReason;
	public ResearchState() {}
	public ResearchState(int researchHistoryNo, int researchNo, int researchStateNo, Date changeDate,
			String referReason) {
		super();
		this.researchHistoryNo = researchHistoryNo;
		this.researchNo = researchNo;
		this.researchStateNo = researchStateNo;
		this.changeDate = changeDate;
		this.referReason = referReason;
	}
	public int getResearchHistoryNo() {
		return researchHistoryNo;
	}
	public void setResearchHistoryNo(int researchHistoryNo) {
		this.researchHistoryNo = researchHistoryNo;
	}
	public int getResearchNo() {
		return researchNo;
	}
	public void setResearchNo(int researchNo) {
		this.researchNo = researchNo;
	}
	public int getResearchStateNo() {
		return researchStateNo;
	}
	public void setResearchStateNo(int researchStateNo) {
		this.researchStateNo = researchStateNo;
	}
	public Date getChangeDate() {
		return changeDate;
	}
	public void setChangeDate(Date changeDate) {
		this.changeDate = changeDate;
	}
	public String getReferReason() {
		return referReason;
	}
	public void setReferReason(String referReason) {
		this.referReason = referReason;
	}
	@Override
	public String toString() {
		return "ResearchState [researchHistoryNo=" + researchHistoryNo + ", researchNo=" + researchNo
				+ ", researchStateNo=" + researchStateNo + ", changeDate=" + changeDate + ", referReason=" + referReason
				+ "]";
	}
	
}
