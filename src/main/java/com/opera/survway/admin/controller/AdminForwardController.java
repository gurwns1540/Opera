package com.opera.survway.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminForwardController {

	@RequestMapping("researchApprovalWaitList.admin")
	public String forwardResearchApprovalWaitList() {
		return "adminResearch/researchApprovalWaitList";
	}
	
	@RequestMapping("adminMain.admin")
	public String forwardMain() {
		return "main/adminMain";
	}
}
