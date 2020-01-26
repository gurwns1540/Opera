package com.opera.survway.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.opera.survway.admin.model.service.AdminService;
import com.opera.survway.admin.model.vo.Research;

@Controller
public class CorpResearchController {
	@Autowired
	private AdminService as;
	
	@PostMapping("requestResearch.corpResearch")
	public String requestResearch(Research research, String targetAgeRangeAmount, String mno, String companyNo, String startDate, String endDate, Model model) {
		
		research.setResearchPeriod(startDate + "/" + endDate);
		research.setMno(Integer.parseInt(companyNo));
		
		if(research.getTargetAgeRange().equals("config")) {
			research.setTargetAgeRange(targetAgeRangeAmount);
		}
		if(research.getAdditionaltEtc().equals("")) {
			research.setAdditionaltEtc(null);
		}
		
		model.addAttribute("research", research);
		return "writeQuestion";
	}
}
