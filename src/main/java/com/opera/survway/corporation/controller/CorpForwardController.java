package com.opera.survway.corporation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CorpForwardController {
	@RequestMapping("corpMain.corp")
	public String forwardCorpMain() {
		return "main/corpMain";
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
