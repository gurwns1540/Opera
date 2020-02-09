package com.opera.survway.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.opera.survway.admin.model.exception.ResearchException;
import com.opera.survway.admin.model.service.AdminService;
import com.opera.survway.admin.model.vo.PanelThanksSurvey;
import com.opera.survway.admin.model.vo.SearchMember;
import com.opera.survway.common.model.vo.AllMember;
import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.common.model.vo.Pagination;
import com.opera.survway.common.model.vo.Util;
import com.opera.survway.exception.SelectException;
import com.opera.survway.panel.model.vo.ResearchQuestion;

@Controller
public class MemberManagementController {
	
	@Autowired
	private AdminService as;
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 23.
	 * @ModifyDate  : 2020. 1. 24.
	 * @Description : 회원 전체 조회 & 검색
	 */
	@RequestMapping("memberInfoManagement.memberManagement") 
	public String selectPanelInfoManagement(HttpServletRequest request, Model model) {
		
		String queryString = request.getQueryString();
		
		Map<String, List<String>> queryMap =  null;
		
		int currentPage = 1; 
		String userType = "";
		String panelLevel = "";
		String searchInput = "";
		
		SearchMember searchMember = new SearchMember();
		
		if(queryString != null) { 
			queryMap = Util.splitQuery(queryString);

			if(queryMap.containsKey("currentPage")) {
				currentPage = Integer.parseInt(queryMap.get("currentPage").get(0));
			}
			if(queryMap.containsKey("userType")) {
				userType = queryMap.get("userType").get(0);
				searchMember.setUserType(userType);
			}
			if(queryMap.containsKey("panelLevel")) {
				panelLevel = queryMap.get("panelLevel").get(0);
				searchMember.setPanelLevel(panelLevel);
			}
			if(queryMap.containsKey("searchInput")) {
				searchInput = queryMap.get("searchInput").get(0);
				searchMember.setSearchInput(searchInput);
			}
			System.out.println(searchMember);
		}
	  
		int listCount = 0;
		try {
			listCount = as.getListCountPanel(searchMember);
			System.out.println(listCount);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			searchMember.setPi(pi);
			
			List<AllMember> memberList = as.memberInfoManagement(searchMember); 
			
			model.addAttribute("memberList", memberList);
			model.addAttribute("pi", pi);
			
			return "memberInfoManagement";
			
		} catch (SelectException e) {
			model.addAttribute("msg", e.getMessage());
			return "redirect:errorPage.me";
		}
		
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 23.
	 * @ModifyDate  : 2020. 1. 23.
	 * @Description : 회원 상세 조회 ajax
	 */
	@PostMapping("selectMember.memberManagement")
	public ModelAndView selectMember(String mno, ModelAndView mv) {
		System.out.println(mno);
		AllMember member = null;
		try {
			member = as.selectMember(Integer.parseInt(mno));
			
			mv.addObject("member", member);
			mv.setViewName("jsonView");
		} catch (SelectException e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * @Author      : Sooo
	 * @CreateDate  : 2020. 1. 28.
	 * @ModifyDate  : 2020. 1. 28.
	 * @Description : 신규 패널 전체 조회 & 검색
	 */
	@RequestMapping("newPanelManagement.memberManagement")
	public String selectNewPanelManagement(HttpServletRequest request, Model model) {
		String queryString = request.getQueryString();
		Map<String, List<String>> queryMap = null;
		
		int currentPage = 1;
		String searchInput = "";
		SearchMember searchMember = new SearchMember();
		
		if(queryString != null) {
			queryMap = Util.splitQuery(queryString);
			if(queryMap.containsKey("currentPage")) {
				currentPage = Integer.parseInt(queryMap.get("currentPage").get(0));
			}
			if(queryMap.containsKey("searchInput")) {
				searchInput = queryMap.get("searchInput").get(0);
				searchMember.setSearchInput(searchInput);
			}
		}
		
		int listCount = 0;
		
		try {
			listCount = as.getListCountNewPanel(searchMember);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			searchMember.setPi(pi);
			
			List<AllMember> newPanelList = as.getListNewPanel(searchMember); 
			
			model.addAttribute("newPanelList", newPanelList);
			model.addAttribute("pi", pi);
			
			return "newPanelManagement";
		} catch (SelectException e) {
			model.addAttribute("msg", e.getMessage());
			return "redirect:errorPage.me";
		}
	}
	
	/**
	 * @Author      : Sooo
	 * @CreateDate  : 2020. 1. 28.
	 * @ModifyDate  : 2020. 1. 28.
	 * @Description : 신규 패널 상세보기 ajax
	 */
	@PostMapping("selectNewPanel.memberManagement")
	public ModelAndView selectNewPanel(String mno, ModelAndView mv) {
		AllMember newPanel = null;
		try {
			newPanel = as.selectNewPanelDetail(Integer.parseInt(mno));
			
			mv.addObject("newPanel", newPanel);
			mv.addObject("mno", mno);
			mv.setViewName("jsonView");
		} catch (SelectException e) {
			mv.setViewName("redirect:errorPage.me");
		}
		return mv;
	}
	
	/**
	 * @Author	:hansol
	 * @CreateDate	:2020. 2. 9.
	 * @ModifyDate	:2020. 2. 9.
	 * @Description	:패널이 작성한 ts가져오기
	 */
	@RequestMapping("selectPanelTs.memberManagement")
	public ModelAndView selectPanelTs(ModelAndView mv, String mno, PanelThanksSurvey ps) {
		ps.setMno(Integer.parseInt(mno));
		ps.setResearchNo(1);
		
		List<PanelThanksSurvey> list = as.selectPanelTs(ps);
		
		
		mv.addObject("list",list);
		mv.setViewName("jsonView");
		
		
		return mv;
	}
}
