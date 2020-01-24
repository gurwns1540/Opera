package com.opera.survway.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.opera.survway.corporation.model.service.CorpService;
import com.opera.survway.corporation.model.vo.CorpMember;
import com.opera.survway.exception.LoginException;
import com.opera.survway.panel.model.service.PanelService;
import com.opera.survway.panel.model.vo.PanelMember;

@SessionAttributes("loginUser")
@Controller
public class LoginMemberController {
	
	@Autowired
	private PanelService ps;
	@Autowired
	private CorpService cs;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	/**
	 * @Author      : Oh
	 * @CreateDate  : 2020-01-19
	 * @ModifyDate  : 2020-01-21
	 * @Description : 로그인 기능
	 */
	@PostMapping("login.me")
	public String loginCheck(PanelMember pm, CorpMember cm, @RequestParam("loginMemberType") String loginMemberType, Model model) {
		// 라디오 버튼 패널 회원 체크 시
		if(loginMemberType.equals("panelMember")) {
			try {
				PanelMember loginUser = ps.loginMember(pm);
				model.addAttribute("loginUser", loginUser);
				
				if(loginUser.getUserType().equals("관리자")) {
					return "redirect:adminMain.admin";
				}else {
					return "redirect:panelMain.panel";
				}
				
				
			} catch (LoginException e) {
				model.addAttribute("msg", e.getMessage());
				return "redirect:panelLogin.panel";
			}
			
		// 라디오 버튼 기업 회원 체크 시
		}else if(loginMemberType.equals("corpMember")) {
			
			try {
				CorpMember loginUser = cs.loginMember(cm);
				model.addAttribute("loginUser", loginUser);
				return "redirect:corpMain.corp";
			} catch (LoginException e) {
				model.addAttribute("msg", e.getMessage());
				return "redirect:panelLogin.panel";
			}
			
			//여기는 스트링리턴값 디폴트로 넣어주기위해서 그냥 만든거임
		}else {
			return "";
		}
		
	}
	
	/**
	 * @Author      : Oh
	 * @CreateDate  : 2020-01-19
	 * @ModifyDate  : 2020-01-21
	 * @Description : 로그아웃 기능
	 */
	@RequestMapping("logout.me")
	public String logout(SessionStatus status, Model model) {
		status.setComplete();
		model.addAttribute("message", "로그아웃 되셨습니다.");
		return "redirect:panelMain.panel";
	}
}






































