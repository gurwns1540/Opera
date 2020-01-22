package com.opera.survway.corporation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CorpForwardController {
	@RequestMapping("corpMain.corp")
	public String forwardCorpMain() {
		return "main/corpMain";
	}
	
	// 기업 회원가입1
	@RequestMapping("corpSignup1.corp")
	public String forwardCorpSignup1() {
		return "signCorp/corpSignup1";
	}
	
	// 기업 회원가입2
	@RequestMapping("corpSignup2.corp")
	public String forwardCorpSignup2() {
		return "signCorp/corpSignup2";
	}
	
	// 기업 회원가입3
	@RequestMapping("corpSignup3.corp")
	public String forwardCorpSignup3() {
		return "signCorp/corpSignup3";
	}

	
	// 샘플 리서치 메인
	@RequestMapping("sampleResearchMain.corp")
	public String forwardSampleResearchMain() {
		return "corpResearch/sampleResearchMain";
	}
	
	// 리서치 메인
	@RequestMapping("newResearchMain.corp")
	public String forwardNewResearchMain() {
		return "corpResearch/newResearchMain";
	}
	
	// 리서치 이력
	@RequestMapping("previousResearchMain.corp")
	public String forwardPreviousResearchMain() {
		return "corpResearch/previousResearchMain";
	}
	
	// 리서치 신청하기
	@RequestMapping("requestResearch.corp")
	public String forwardRequestResearch() {
		return "corpResearch/requestResearch";
	}
	
	// 리서치 작성하기
	@RequestMapping("writeQuestion.corp")
	public String forwardWriteQuestion() {
		return "corpResearch/writeQuestion";
	}
}
