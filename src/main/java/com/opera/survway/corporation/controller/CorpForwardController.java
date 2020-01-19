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
	
	// 샘플 리서치 메인
	@RequestMapping("previousResearchMain.corp")
	public String forwardPreviousResearchMain() {
		return "corpResearch/previousResearchMain";
	}
}
