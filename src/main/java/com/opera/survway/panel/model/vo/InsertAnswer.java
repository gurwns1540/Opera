/**
 * 
 */
package com.opera.survway.panel.model.vo;

/**
 * @author Sooo
 *
 */
public class InsertAnswer {
	
	private String mno;
	private String researchNo;
	private String totalAnswer;
	private String surveyTime;
	private String finalReward;
	
	public InsertAnswer() {}

	public InsertAnswer(String mno, String researchNo, String totalAnswer, String surveyTime, String finalReward) {
		super();
		this.mno = mno;
		this.researchNo = researchNo;
		this.totalAnswer = totalAnswer;
		this.surveyTime = surveyTime;
		this.finalReward = finalReward;
	}

	public String getMno() {
		return mno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public String getResearchNo() {
		return researchNo;
	}

	public void setResearchNo(String researchNo) {
		this.researchNo = researchNo;
	}

	public String getTotalAnswer() {
		return totalAnswer;
	}

	public void setTotalAnswer(String totalAnswer) {
		this.totalAnswer = totalAnswer;
	}

	public String getSurveyTime() {
		return surveyTime;
	}

	public void setSurveyTime(String surveyTime) {
		this.surveyTime = surveyTime;
	}

	public String getFinalReward() {
		return finalReward;
	}

	public void setFinalReward(String finalReward) {
		this.finalReward = finalReward;
	}

	@Override
	public String toString() {
		return "InsertAnswer [mno=" + mno + ", researchNo=" + researchNo + ", totalAnswer=" + totalAnswer
				+ ", surveyTime=" + surveyTime + ", finalReward=" + finalReward + "]";
	}
	
}



