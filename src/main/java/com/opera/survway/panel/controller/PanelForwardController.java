package com.opera.survway.panel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PanelForwardController {
	
	
	//메인페이지
	@GetMapping("panelMain.panel")
	public String showPanelMain() {
		return "main/panelMain";
	}
	
	
	
	// 고객센터 메뉴 페이지들
	//1. 자주 묻는 질문
	@GetMapping("faq.panel")
	public String showFaq() {
		return "customerCenter/faq";
	}
	
	//3. 1:1 문의하기
	@GetMapping("panelNewInquiry.panel")
	public String showPanelNewInquiry() {
		return "customerCenter/panelNewInquiry";
	}
	//4. 공지사항
	@GetMapping("notice.panel")
	public String showNotice() {
		return "customerCenter/notice";
	}
	//5. 패널 1:1문의 목록
	@GetMapping("panelInquiryList.panel")
	public String showPanelInquiryList() {
		return "customerCenter/panelInquiryList";
	}
	//5-1. 패널 1:1문의 상세보기
	@GetMapping("panelInquiryDetail.panel")
	public String showPanelInquiryDetail() {
		return "customerCenter/panelInquiryDetail";
	}
	
	
	// 안내 메뉴 페이지들
	//1. 혜택 안내
	@GetMapping("benefitInfo.panel")
	public String showBenefitInfo() {
		return "info/benefitInfo";
	}
	//2. 조사 참여 안내
	@GetMapping("surveyGuide.panel")
	public String showSurveyGuide() {
		return "info/surveyGuide";
	}
	
	
	
	// 마이페이지 메뉴 페이지들
	//1. 내 정보 관리
	@GetMapping("myInfo.panel")
	public String showMyInfo() {
		return "myPage/myInfo";
	}
	//1-1. 내 정보 상세보기
	@GetMapping("myInfoDetail.panel")
	public String showMyInfoDetail() {
		return "myPage/myInfoDetail";
	}
	//2. 내 1:1 문의 목록
	@GetMapping("myInquiryList.panel")
	public String showMyInquiryList() {
		return "myPage/myInquiryList";
	}
	//2-1. 내 1:1문의 상세보기
	@GetMapping("myInquiryDetail.panel")
	public String showMyInquiryDetail() {
		return "myPage/myInquiryDetail";
	}
	//2-2. 1:1 문의하기
	@GetMapping("myNewInquiry.panel")
	public String showNewInquiry() {
		return "myPage/myNewInquiry";
	}
	//3. 내 리워드 관리
	@GetMapping("myRewardMain.panel")
	public String showMyRewardMain() {
		return "myPage/myRewardMain";
	}
	//3-1. 내 리워드 상세내역
	@GetMapping("myRewardDetail.panel")
	public String showMyRewardDetail() {
		return "myPage/myRewardDetail";
	}
	//3-2. 리워드 캐시아웃
	@GetMapping("myRewardCashOut.panel")
	public String showMyRewardCashOut() {
		return "myPage/myRewardCashOut";
	}
	//4. 패널 탈퇴
	@GetMapping("panelDrop.panel")
	public String showPanelDrop() {
		return "myPage/panelDrop";
	}
	
	
	
	// 로그인, 회원가입 페이지들
	//1. 로그인
	@GetMapping("panelLogin.panel")
	public String showPanelLogin() {
		return "signPanel/panelLogin";
	}
	//2. 회원가입(패널 또는 기업)
	@GetMapping("panelSignup.panel")
	public String showPanelSignup() {
		return "signPanel/panelSignup";
	}
	//2. 회원가입(이용약관)
	@GetMapping("panelSignup1.panel")
	public String showPanelSignup1() {
		return "signPanel/panelSignup1";
	}
	//3. 회원가입(정보입력)
	@GetMapping("panelSignup2.panel")
	public String showPanelSignup2() {
		return "signPanel/panelSignup2";
	}
	//3. 회원가입(가입완료)
	@GetMapping("panelSignup3.panel")
	public String showPanelSignup3() {
		return "signPanel/panelSignup3";
	}
	
	
	
	// 서베이 메뉴 페이지들
	//1. 진행중인 설문조사 전체 목록
	@GetMapping("surveyList.panel")
	public String showSruveyList() {
		return "survey/surveyList";
	}
	//2. 참여한 설문조사 목록
	@GetMapping("mySurveyList.panel")
	public String showMySurveyList() {
		return "survey/mySurveyList";
	}
	//3. 패널서베이
	@GetMapping("panelSurvey.panel")
	public String showPanelSurvey() {
		return "survey/panelSurvey";
	}
}































