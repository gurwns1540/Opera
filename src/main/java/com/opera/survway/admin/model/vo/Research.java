package com.opera.survway.admin.model.vo;

public class Research {
	private int researchNo;					// 리서치 번호
	private String researchName;			// 리서치 명
	private int researchEngagementGoals;	// 리서치 목표 인원
	private String researchPeriod;			// 리서치 기간
	private int mno;						// 리서치 작성 기업
	private String researchPerpose;			// 리서치 목적
	
	private int targetNo;					// 조사 대상자 번호
	private String targetGender;			// 조사 대상자 성별
	private String targetAgeRange;			// 조사 대상자 연령
	private String targetLocation;			// 조사 대상자 지역
	private String occupationNo;			// 조사 대상자 직업군
	private String additionaltEtc;			// 조사 기타사항
	
	public Research() {}

	public Research(int researchNo, String researchName, int researchEngagementGoals, String researchPeriod, int mno,
			String researchPerpose, int targetNo, String targetGender, String targetAgeRange, String targetLocation,
			String occupationNo, String additionaltEtc) {
		super();
		this.researchNo = researchNo;
		this.researchName = researchName;
		this.researchEngagementGoals = researchEngagementGoals;
		this.researchPeriod = researchPeriod;
		this.mno = mno;
		this.researchPerpose = researchPerpose;
		this.targetNo = targetNo;
		this.targetGender = targetGender;
		this.targetAgeRange = targetAgeRange;
		this.targetLocation = targetLocation;
		this.occupationNo = occupationNo;
		this.additionaltEtc = additionaltEtc;
	}

	public int getResearchNo() {
		return researchNo;
	}

	public void setResearchNo(int researchNo) {
		this.researchNo = researchNo;
	}

	public String getResearchName() {
		return researchName;
	}

	public void setResearchName(String researchName) {
		this.researchName = researchName;
	}

	public int getResearchEngagementGoals() {
		return researchEngagementGoals;
	}

	public void setResearchEngagementGoals(int researchEngagementGoals) {
		this.researchEngagementGoals = researchEngagementGoals;
	}

	public String getResearchPeriod() {
		return researchPeriod;
	}

	public void setResearchPeriod(String researchPeriod) {
		this.researchPeriod = researchPeriod;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getResearchPerpose() {
		return researchPerpose;
	}

	public void setResearchPerpose(String researchPerpose) {
		this.researchPerpose = researchPerpose;
	}

	public int getTargetNo() {
		return targetNo;
	}

	public void setTargetNo(int targetNo) {
		this.targetNo = targetNo;
	}

	public String getTargetGender() {
		return targetGender;
	}

	public void setTargetGender(String targetGender) {
		this.targetGender = targetGender;
	}

	public String getTargetAgeRange() {
		return targetAgeRange;
	}

	public void setTargetAgeRange(String targetAgeRange) {
		this.targetAgeRange = targetAgeRange;
	}

	public String getTargetLocation() {
		return targetLocation;
	}

	public void setTargetLocation(String targetLocation) {
		this.targetLocation = targetLocation;
	}

	public String getOccupationNo() {
		return occupationNo;
	}

	public void setOccupationNo(String occupationNo) {
		this.occupationNo = occupationNo;
	}

	public String getAdditionaltEtc() {
		return additionaltEtc;
	}

	public void setAdditionaltEtc(String additionaltEtc) {
		this.additionaltEtc = additionaltEtc;
	}

	@Override
	public String toString() {
		return "Research [researchNo=" + researchNo + ", researchName=" + researchName + ", researchEngagementGoals="
				+ researchEngagementGoals + ", researchPeriod=" + researchPeriod + ", mno=" + mno + ", researchPerpose="
				+ researchPerpose + ", targetNo=" + targetNo + ", targetGender=" + targetGender + ", targetAgeRange="
				+ targetAgeRange + ", targetLocation=" + targetLocation + ", occupationNo=" + occupationNo
				+ ", additionaltEtc=" + additionaltEtc + "]";
	}

}