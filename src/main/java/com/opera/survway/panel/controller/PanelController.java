package com.opera.survway.panel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.opera.survway.common.model.vo.GenerateCertPassword;
import com.opera.survway.exception.LoginException;
import com.opera.survway.panel.model.service.PanelService;
import com.opera.survway.panel.model.vo.Inquiry;
import com.opera.survway.panel.model.vo.PanelMember;

@SessionAttributes("loginUser")
@Controller
public class PanelController {
	
	@Autowired
	private PanelService ps;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	@PostMapping("panelSignup.me")
	public String insertPanelMember(Model model, PanelMember pm) {
		String referCode = new GenerateCertPassword().excuteGenerate();
		
		pm.setReferPanelCode(referCode);
		
		String encPassword =passwordEncoder.encode(pm.getUserPwd());
	    pm.setUserPwd(encPassword);
		System.out.println(pm);
		
		try {
			ps.insertMember(pm);
			
			return "redirect:panelSignup3.panel";
		} catch (LoginException e) {
			model.addAttribute("msg", e.getMessage());
			
			return "panelSignup.panel";
		}
	}
	
	//1:1문의 등록
	@PostMapping("inquirywrite.panel")
	public String insertPanelInquiry(Model model,Inquiry i) {
		
		System.out.println(i.toString());
		
		int result = ps.insertInquiry(i);
		
		model.addAttribute("success",result);
		
		return "customerCenter/panelInquiryList";
	}
	
}












































