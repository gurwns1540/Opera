package com.opera.survway.panel.model.vo;

import java.sql.Date;

public class Notice {
   private int noticeNo;			//공지사항 번호
   private String noticeTitle;		//공지사항 제목
   private String noticeContext;	//공지사항 내용
   private Date noticeDate;			//공지사항 작성날짜
   private int noticeViewCount;		//공지사항 조회수
   private int mno;					//공지사항 작성자
   private String noticeStatus;		//공지사항 상태
   
   public Notice() {}

   public Notice(int noticeNo, String noticeTitle, String noticeContext, Date noticeDate, int noticeViewCount, int mno,
         String noticeStatus) {
      super();
      this.noticeNo = noticeNo;
      this.noticeTitle = noticeTitle;
      this.noticeContext = noticeContext;
      this.noticeDate = noticeDate;
      this.noticeViewCount = noticeViewCount;
      this.mno = mno;
      this.noticeStatus = noticeStatus;
   }

   public int getNoticeNo() {
      return noticeNo;
   }

   public void setNoticeNo(int noticeNo) {
      this.noticeNo = noticeNo;
   }

   public String getNoticeTitle() {
      return noticeTitle;
   }

   public void setNoticeTitle(String noticeTitle) {
      this.noticeTitle = noticeTitle;
   }

   public String getNoticeContext() {
      return noticeContext;
   }

   public void setNoticeContext(String noticeContext) {
      this.noticeContext = noticeContext;
   }

   public Date getNoticeDate() {
      return noticeDate;
   }

   public void setNoticeDate(Date noticeDate) {
      this.noticeDate = noticeDate;
   }

   public int getNoticeViewCount() {
      return noticeViewCount;
   }

   public void setNoticeViewCount(int noticeViewCount) {
      this.noticeViewCount = noticeViewCount;
   }

   public int getMno() {
      return mno;
   }

   public void setMno(int mno) {
      this.mno = mno;
   }

   public String getNoticeStatus() {
      return noticeStatus;
   }

   public void setNoticeStatus(String noticeStatus) {
      this.noticeStatus = noticeStatus;
   }

   @Override
   public String toString() {
      return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContext=" + noticeContext
            + ", noticeDate=" + noticeDate + ", noticeViewCount=" + noticeViewCount + ", mno=" + mno
            + ", noticeStatus=" + noticeStatus + "]";
   }
    
}