package com.opera.survway.panel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PanelForwardController {
	
	@GetMapping("panelSignup.panel")
	public String showPanelSignup() {
		return "signPanel/panelSignUp";
	}
	
	@GetMapping("panelSignup2.panel")
	public String showPanelSignup2() {
		return "signPanel/panelSignUp2";
	}
}
