package com.opera.survway.panel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.opera.survway.corporation.model.vo.CorpMember;
import com.opera.survway.exception.LoginException;
import com.opera.survway.panel.model.service.PanelService;
import com.opera.survway.panel.model.vo.PanelMember;

@SessionAttributes("loginUser")
@Controller
public class SignMemberController {
	
	@Autowired
	private PanelService ps;
//	@Autowired
//	private AdminService as;
//	@Autowired
//	private CorpService cs;
	
	
	@PostMapping("login.me")
	public String loginCheck(PanelMember pm, CorpMember cm, @RequestParam("loginMemberType") String loginMemberType, Model model) {
		
		
		if(loginMemberType.equals("panelMember")) {
			
			try {
				PanelMember loginUser = ps.loginMember(pm);
				model.addAttribute("loginUser", loginUser);
				
				if(loginUser.getMno()==1) {
					return "redirect:adminMain.admin";
				}else {
					return "redirect:panelMain.panel";
				}
				
				
			} catch (LoginException e) {
				model.addAttribute("msg", e.getMessage());
				return "redirect:panelLogin.panel";
			}
			
			
		}else if(loginMemberType.equals("corpMember")) {
			
//			CorpMember loginUser = cs.loginMember(cm);
			
			return "";
		}else {
			return "";
		}
		
	}
	
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:panelMain.panel";
	}
}






































