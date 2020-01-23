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
	 * @ModifyDate  : 2020. 1. 23.
	 * @Description : 패널 전체 조회
	 */
	@RequestMapping("memberInfoManagement.memberManagement") 
	public String forwardPanelInfoManagement(HttpServletRequest request, Model model) {
		
		String queryString = request.getQueryString();
		
//		System.out.println( Util.splitQuery(queryString) );
		Map<String, List<String>> queryMap =  null;
		
		  int currentPage = 1; 
		  
		  if(queryString != null) { 
			  queryMap = Util.splitQuery(queryString);
//			  System.out.println(queryMap.get("currentPage").get(0));
			  if(queryMap.containsKey("currentPage")) {
				  currentPage = Integer.parseInt(queryMap.get("currentPage").get(0));
			  }
		  }
	  
		int listCount = 0;
		try {
			listCount = as.getListCountPanel();
			//System.out.println(listCount);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<AllMember> memberList = as.memberInfoManagement(pi); 
			//System.out.println(memberList);
			
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
