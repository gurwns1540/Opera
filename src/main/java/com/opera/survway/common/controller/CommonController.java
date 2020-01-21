package com.opera.survway.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.opera.survway.common.model.service.CommonService;

@Controller
public class CommonController {
	@Autowired
	private CommonService cs;
	
	@PostMapping("duplicationIdCheck.me")
	public ModelAndView duplicationIdCheck(String userId, ModelAndView mv) {
		
		boolean isDuplicated = cs.duplicationIdCheck(userId);
		
		mv.addObject("isDuplicated", isDuplicated);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@PostMapping("duplicationEmailCheck.me")
	public ModelAndView duplicationEmailCheck(String userEmail, ModelAndView mv) {
		
		boolean isDuplicated = cs.duplicationEmailCheck(userEmail);
		
		mv.addObject("isDuplicated", isDuplicated);
		mv.setViewName("jsonView");
		
		return mv;
	}
}
