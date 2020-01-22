package com.opera.survway.inquiry.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.opera.survway.inquiry.model.service.InquiryService;

@SessionAttributes("loginUser")
@Controller
public class InquiryController {
	@Autowired
	private InquiryService is;
}
