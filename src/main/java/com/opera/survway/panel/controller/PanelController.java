package com.opera.survway.panel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PanelController {
	
	/**
	 * @Author      : yhj
	 * @Date        : 2020. 1. 15.
	 * @Description : 회원가입페이지로 매핑해주는 컨트롤러
	 */
	@GetMapping("panelSignup.panel")
	public String showPanelSignup() {
		return "user/panelSignup";
	}
	
	/**
	 * @Author      : yhj
	 * @Date        : 2020. 1. 15.
	 * @Description : 패널메인페이지로 매핑해주는 컨트롤러
	 */
	@GetMapping("panelMain.panel")
	public String showPanelMain() {
		return "main/panelMain";
	}
	
	/**
	 * @Author      : yhj
	 * @Date        : 2020. 1. 15.
	 * @Description : 패널로그인페이지로 매핑해주는 컨트롤러
	 */
	@GetMapping("panelLogin.panel")
	public String showPanelLogin() {
		return "user/panelLogin";
	}
}
