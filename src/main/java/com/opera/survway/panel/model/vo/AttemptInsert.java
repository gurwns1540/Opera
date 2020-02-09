/**
 * 
 */
package com.opera.survway.panel.model.vo;

/**
 * @author Sooo
 *
 */
public class AttemptInsert {
	private String mno;
	private String researchNo;
	
	public AttemptInsert() {}

	public AttemptInsert(String mno, String researchNo) {
		super();
		this.mno = mno;
		this.researchNo = researchNo;
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

	@Override
	public String toString() {
		return "AttemptInsert [mno=" + mno + ", researchNo=" + researchNo + "]";
	}
	
}
