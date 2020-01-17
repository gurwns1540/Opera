package com.opera.survway.panel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PanelForwardController {
	
	// 고객센터 메뉴 페이지들
	//1. 자주 묻는 질문
	@GetMapping("faq.panel")
	public String showFaq() {
		return "customerCenter/faq";
	}
	//2. 내 1:1 문의
	@GetMapping("myOneOnOne.panel")
	public String showMyOneOnOne() {
		return "customerCenter/myOneOnOne";
	}
	//3. 1:1 문의하기
	@GetMapping("newOneOnOne.panel")
	public String showNewOneOnOne() {
		return "customerCenter/newOneOnOne";
	}
	//4. 공지사항
	@GetMapping("notice.panel")
	public String showNotice() {
		return "customerCenter/notice";
	}
	//5. 1:1문의 목록
	@GetMapping("oneOnOneList.panel")
	public String showOneOnOneList() {
		return "customerCenter/oneOnOneList";
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
	//2. 내 리워드 관리
	@GetMapping("myReward.panel")
	public String showMyReward() {
		return "myPage/myReward";
	}
	//3. 패널 탈퇴
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
	//2. 회원가입(이용약관)
	@GetMapping("panelSignup.panel")
	public String showPanelSignUp() {
		return "signPanel/panelSignUp";
	}
	//3. 회원가입(정보입력)
	@GetMapping("panelSignup2.panel")
	public String showPanelSignUp2() {
		return "signPanel/panelSignUp2";
	}
	//3. 회원가입(가입완료)
	@GetMapping("panelSignup3.panel")
	public String showPanelSignUp3() {
		return "signPanel/panelSignUp3";
	}
	
	
	
	// 서베이 메뉴 페이지들
	//1. 진행중인 설문조사 전체 목록
	@GetMapping("surveyList.panel")
	public String showSruveyList() {
		return "survey/surveyList";
	}
	//2. 설문조사 진행 페이지
	@GetMapping("surveyQuestions.panel")
	public String showSurveyQuestions() {
		return "survey/surveyQuestions";

	}
	//3. 조사참여 가이드
	@GetMapping("surveyStartGuide")
	public String showSurveyStartGuide() {
		return "survey/surveyStartGuide";
	}
	
}
