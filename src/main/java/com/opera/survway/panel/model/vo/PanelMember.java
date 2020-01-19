package com.opera.survway.panel.model.vo;

import java.sql.Date;

public class PanelMember {
	
	private int mno;
	private String userId;
	private String userPwd;
	private String userName;
	private String post;
	private String address;
	private String detailAddress;
	private String userAddress;
	private String phone1;
	private String phone2;
	private String phone3;
	private String userPhone;
	private String userEmail;
	private String userType;
	private Date leaveDate;
	private Date entDate;
	private Date modifyDate;
	private String year;
	private String month;
	private String day;
	private String panelBirthday;
	private char panelGender;
	private String referPanelCode;
	private String nominee;
	private String panelLevel;
	private String occupationNo;
	private String withdrawAccount;
	
	public PanelMember() {}

	public PanelMember(int mno, String userId, String userPwd, String userName, String post, String address,
			String detailAddress, String userAddress, String phone1, String phone2, String phone3, String userPhone,
			String userEmail, String userType, Date leaveDate, Date entDate, Date modifyDate, String year, String month,
			String day, String panelBirthday, char panelGender, String referPanelCode, String nominee,
			String panelLevel, String occupationNo, String withdrawAccount) {
		super();
		this.mno = mno;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.post = post;
		this.address = address;
		this.detailAddress = detailAddress;
		this.userAddress = userAddress;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userType = userType;
		this.leaveDate = leaveDate;
		this.entDate = entDate;
		this.modifyDate = modifyDate;
		this.year = year;
		this.month = month;
		this.day = day;
		this.panelBirthday = panelBirthday;
		this.panelGender = panelGender;
		this.referPanelCode = referPanelCode;
		this.nominee = nominee;
		this.panelLevel = panelLevel;
		this.occupationNo = occupationNo;
		this.withdrawAccount = withdrawAccount;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public Date getLeaveDate() {
		return leaveDate;
	}

	public void setLeaveDate(Date leaveDate) {
		this.leaveDate = leaveDate;
	}

	public Date getEntDate() {
		return entDate;
	}

	public void setEntDate(Date entDate) {
		this.entDate = entDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getPanelBirthday() {
		return panelBirthday;
	}

	public void setPanelBirthday(String panelBirthday) {
		this.panelBirthday = panelBirthday;
	}

	public char getPanelGender() {
		return panelGender;
	}

	public void setPanelGender(char panelGender) {
		this.panelGender = panelGender;
	}

	public String getReferPanelCode() {
		return referPanelCode;
	}

	public void setReferPanelCode(String referPanelCode) {
		this.referPanelCode = referPanelCode;
	}

	public String getNominee() {
		return nominee;
	}

	public void setNominee(String nominee) {
		this.nominee = nominee;
	}

	public String getPanelLevel() {
		return panelLevel;
	}

	public void setPanelLevel(String panelLevel) {
		this.panelLevel = panelLevel;
	}

	public String getOccupationNo() {
		return occupationNo;
	}

	public void setOccupationNo(String occupationNo) {
		this.occupationNo = occupationNo;
	}

	public String getWithdrawAccount() {
		return withdrawAccount;
	}

	public void setWithdrawAccount(String withdrawAccount) {
		this.withdrawAccount = withdrawAccount;
	}

	@Override
	public String toString() {
		return "PanelMember [mno=" + mno + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", post=" + post + ", address=" + address + ", detailAddress=" + detailAddress + ", userAddress="
				+ userAddress + ", phone1=" + phone1 + ", phone2=" + phone2 + ", phone3=" + phone3 + ", userPhone="
				+ userPhone + ", userEmail=" + userEmail + ", userType=" + userType + ", leaveDate=" + leaveDate
				+ ", entDate=" + entDate + ", modifyDate=" + modifyDate + ", year=" + year + ", month=" + month
				+ ", day=" + day + ", panelBirthday=" + panelBirthday + ", panelGender=" + panelGender
				+ ", referPanelCode=" + referPanelCode + ", nominee=" + nominee + ", panelLevel=" + panelLevel
				+ ", occupationNo=" + occupationNo + ", withdrawAccount=" + withdrawAccount + "]";
	}

	
}































