package com.opera.survway.corporation.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.opera.survway.corporation.model.service.CorpService;
import com.opera.survway.corporation.model.vo.CorpMember;

@Controller
public class CorpController {
	@Autowired
	private CorpService cs;
	
	@PostMapping("corpSignup.me")
	public String corpSignup(Model model, CorpMember cm, HttpServletRequest request) {
		InetAddress inet;
		String svrIp = "";
		try {
			inet = InetAddress.getLocalHost();
			svrIp = inet.getHostAddress();
		} catch (UnknownHostException e1) {
			e1.printStackTrace();
		}
		
		System.out.println(cm);
		return "";
	}
}
