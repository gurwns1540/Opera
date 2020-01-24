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

import com.opera.survway.admin.model.service.AdminService;
import com.opera.survway.admin.model.vo.SearchMember;
import com.opera.survway.common.model.vo.AllMember;
import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.common.model.vo.Pagination;
import com.opera.survway.common.model.vo.Util;
import com.opera.survway.exception.SelectException;
import com.opera.survway.panel.model.vo.PanelMember;

@Controller
public class memberManagementController {
	
	@Autowired
	private AdminService as;
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 23.
	 * @ModifyDate  : 2020. 1. 24.
	 * @Description : 패널 전체 조회 & 검색
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
	 * @Description : 패널 상세 조회 ajax
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
}
