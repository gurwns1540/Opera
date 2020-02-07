package com.opera.survway.admin.model.vo;

public class TargetMember {
	private int mno;
	private String targetEmail;
	private int age;
	private String targetGender;
	private int occupationNo;
	private int locationNo;
	
	public TargetMember() {
		super();
	}

	

	public TargetMember(int mno, String targetEmail, int age, String targetGender, int occupationNo, int locationNo) {
		super();
		this.mno = mno;
		this.targetEmail = targetEmail;
		this.age = age;
		this.targetGender = targetGender;
		this.occupationNo = occupationNo;
		this.locationNo = locationNo;
	}



	public int getMno() {
		return mno;
	}



	public void setMno(int mno) {
		this.mno = mno;
	}



	public String getTargetEmail() {
		return targetEmail;
	}



	public void setTargetEmail(String targetEmail) {
		this.targetEmail = targetEmail;
	}



	public int getAge() {
		return age;
	}



	public void setAge(int age) {
		this.age = age;
	}



	public String getTargetGender() {
		return targetGender;
	}



	public void setTargetGender(String targetGender) {
		this.targetGender = targetGender;
	}



	public int getOccupationNo() {
		return occupationNo;
	}



	public void setOccupationNo(int occupationNo) {
		this.occupationNo = occupationNo;
	}



	public int getLocationNo() {
		return locationNo;
	}



	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}



	@Override
	public String toString() {
		return "TargetMember [mno=" + mno + ", targetEmail=" + targetEmail + ", age=" + age + ", targetGender="
				+ targetGender + ", occupationNo=" + occupationNo + ", locationNo=" + locationNo + "]\n";
	}

	
	
	
}
