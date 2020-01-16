package com.opera.survway.panel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PanelForwardController {
	
	@GetMapping("panelSignup.panel")
	public String showPanelSignup() {
		return "user/panelSignup";
	}
}
