package com.opera.survway.panel.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.common.model.vo.Pagination;
import com.opera.survway.common.model.vo.Util;
import com.opera.survway.exception.InquiryException;
import com.opera.survway.panel.model.service.PanelService;
import com.opera.survway.panel.model.vo.Inquiry;
import com.opera.survway.panel.model.vo.PanelMember;

@SessionAttributes("loginUser")
@Controller
public class CustomerCenterController {
	
	@Autowired
	private PanelService ps;
		// 1:1문의 등록
		@PostMapping("inquirywrite.customerCenter")
		public String insertPanelInquiry(Model model, Inquiry i, HttpServletRequest request) {

			int category = Integer.parseInt(request.getParameter("inquiryCategoryNo"));

			i.setInquiryCategoryNo(category);

			int result;
			try {
				result = ps.insertInquiry(i);
				model.addAttribute("success", result);
			} catch (InquiryException e) {
				request.setAttribute("msg", e.getMessage());
			}

			return "redirect:panelInquiryList.customerCenter";
		}

		// 1:1문의 리스트 보기
		@RequestMapping("panelInquiryList.customerCenter")
		public String showMyInquiryList(HttpSession session, Model model, HttpServletRequest request, Inquiry iq) {
			// Post로 보낸걸 queryString이라고 한다
			String queryString = request.getQueryString();
			// 그걸 쪼개기 작업하기
			Map<String, List<String>> queryMap = null;

			int currentPage = 1;
			String inquiryTitle = "";
			int inquiryCategoryNo = 0;

			iq = new Inquiry();

			if (queryString != null) {
				queryMap = Util.splitQuery(queryString);
				if (queryMap.containsKey("currentPage")) {
					currentPage = Integer.parseInt(queryMap.get("currentPage").get(0));
				}
				if (queryMap.containsKey("inquiryTitle")) {
					inquiryTitle = queryMap.get("inquiryTitle").get(0);
					iq.setInquiryTitle(inquiryTitle);
				}
				if (queryMap.containsKey("inquiryCategoryNo")) {
					inquiryCategoryNo = Integer.parseInt(queryMap.get("inquiryCategoryNo").get(0));
					iq.setInquiryCategoryNo(inquiryCategoryNo);
				}
				System.out.println(iq);
			}

			int listCount = 0;

			PanelMember loginUser = (PanelMember) session.getAttribute("loginUser");
			int mno = loginUser.getMno();

			iq.setMno(mno);

			
			try {
				listCount = ps.getListCountInquiry(iq);
				System.out.println(listCount);
				PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
				
				iq.setPi(pi);
				
				List<Inquiry> list = ps.selectAllMyInquiry(iq);
				System.out.println("controllerList"+list);
				model.addAttribute("list", list);
				model.addAttribute("pi",pi);
			} catch (InquiryException e) {
				request.setAttribute("msg", e.getMessage());
			}

			return "panelInquiryList";
		}
		
		
		
		
}
