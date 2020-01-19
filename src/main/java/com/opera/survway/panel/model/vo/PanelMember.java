package com.opera.survway.panel.model.vo;

import java.sql.Date;

public class PanelMember {
	
	private int mno;
	private String userId;
	private String userPwd;
	private String userName;
	private String userAddress;
	private String userPhone;
	private String userEmail;
	private String userType;
	private Date leaveDate;
	private Date entDate;
	private Date modifyDate;
	private int panelBirthday;
	private char panelGender;
	private String referPanelCode;
	private String nominee;
	private String panelLevel;
	private String occupationNo;
	private String withdrawAccount;
	
	public PanelMember() {}

	public PanelMember(int mno, String userId, String userPwd, String userName, String userAddress, String userPhone,
			String userEmail, String userType, Date leaveDate, Date entDate, Date modifyDate, int panelBirthday,
			char panelGender, String referPanelCode, String nominee, String panelLevel, String occupationNo,
			String withdrawAccount) {
		super();
		this.mno = mno;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userAddress = userAddress;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userType = userType;
		this.leaveDate = leaveDate;
		this.entDate = entDate;
		this.modifyDate = modifyDate;
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

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
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

	public int getPanelBirthday() {
		return panelBirthday;
	}

	public void setPanelBirthday(int panelBirthday) {
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
				+ ", userAddress=" + userAddress + ", userPhone=" + userPhone + ", userEmail=" + userEmail
				+ ", userType=" + userType + ", leaveDate=" + leaveDate + ", entDate=" + entDate + ", modifyDate="
				+ modifyDate + ", panelBirthday=" + panelBirthday + ", panelGender=" + panelGender + ", referPanelCode="
				+ referPanelCode + ", nominee=" + nominee + ", panelLevel=" + panelLevel + ", occupationNo="
				+ occupationNo + ", withdrawAccount=" + withdrawAccount + "]";
	}
	
	
	
}































