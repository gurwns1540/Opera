package com.opera.survway.corp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CorpForwardController {
	@RequestMapping("corpMain.corp")
	public String forwardCorpMain() {
		return "main/corpMain";
	}
}
