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
import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.common.model.vo.Pagination;
import com.opera.survway.common.model.vo.ResearchState;
import com.opera.survway.common.model.vo.Util;
import com.opera.survway.exception.SelectException;

@Controller
public class AdminResearchController {

	@Autowired
	AdminService as;
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 31.
	 * @ModifyDate  : 2020. 1. 31.
	 * @Description : 리서치 승인 대기 목록 조회
	 */
	@RequestMapping("researchApprovalWaitList.adminResearch")
	public String researchApprovalWaitList(HttpServletRequest request, Model model) {
		String queryString = request.getQueryString();
		
		Map<String, List<String>> queryMap =  null;
		
		int currentPage = 1; 
		
		if(queryString != null) { 
			queryMap = Util.splitQuery(queryString);
			if(queryMap.containsKey("currentPage")) {
				currentPage = Integer.parseInt(queryMap.get("currentPage").get(0));
			}
		}
	  
		int listCount = 0;
		try {
			listCount = as.getListCountArrovalList();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<Map<String, String>> researchApprovalWaitList = as.researchApprovalWaitList(pi);
			
			model.addAttribute("researchApprovalWaitList", researchApprovalWaitList);
			model.addAttribute("pi", pi);
			return "researchApprovalWaitList";
		} catch (SelectException e) {
			model.addAttribute("msg", e.getMessage());
			return "redirect:errorPage.me";
		}
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 1.
	 * @ModifyDate  : 2020. 2. 1.
	 * @Description : 신청 리서치 상세 보기
	 */
	@PostMapping("researchApprovalDetail.adminResearch")
	public ModelAndView researchApprovalDetail(ModelAndView mv, String researchNoStr) {
		int researchNo = Integer.parseInt(researchNoStr);
		
		List<Map<String, Object>> researchDetail = as.researchApprovalDetail(researchNo);
		
		mv.addObject("researchDetail", researchDetail);
		mv.setViewName("jsonView");
		
		return mv;
	}
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 1.
	 * @ModifyDate  : 2020. 2. 1.
	 * @Description : 리서치 승인
	 */
	@PostMapping("researchApproved.adminResearch")
	public ModelAndView researchApproved(ModelAndView mv, String researchNoStr) {
		int researchNo = Integer.parseInt(researchNoStr);
		
		boolean isApproved = as.researchApproved(researchNo);
		
		mv.addObject("isApproved", isApproved);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@PostMapping("researchRefer.adminResearch")
	public ModelAndView researchRefer(ModelAndView mv, String researchNoStr, String referReason) {
		int researchNo = Integer.parseInt(researchNoStr);
		
		ResearchState researchState = new ResearchState();
		researchState.setReferReason(referReason);
		researchState.setResearchNo(researchNo);
		
		boolean isRefer = as.researchRefer(researchState);
		
		mv.addObject("isRefer", isRefer);
		mv.setViewName("jsonView");
		return mv;
	}
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 1.
	 * @ModifyDate  : 2020. 2. 1.
	 * @Description : 리서치 반려 목록
	 */
	@RequestMapping("researchReferList.adminResearch")
	public String researchReferList(HttpServletRequest request, Model model) {
		String queryString = request.getQueryString();
		
		Map<String, List<String>> queryMap =  null;
		
		int currentPage = 1; 
		
		if(queryString != null) { 
			queryMap = Util.splitQuery(queryString);
			if(queryMap.containsKey("currentPage")) {
				currentPage = Integer.parseInt(queryMap.get("currentPage").get(0));
			}
		}
	  
		int listCount = 0;
		try {
			listCount = as.getListCountReferList();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<Map<String, String>> researchReferList = as.researchReferList(pi);
			System.out.println(researchReferList);
			model.addAttribute("researchReferList", researchReferList);
			model.addAttribute("pi", pi);
			return "researchReferList";
		} catch (SelectException e) {
			model.addAttribute("msg", e.getMessage());
			return "redirect:errorPage.me";
		}
	}
	
	@PostMapping("researchReferDetail.adminResearch")
	public ModelAndView researchReferDetail(ModelAndView mv, String researchNoStr) {
		int researchNo = Integer.parseInt(researchNoStr);
		
		List<Map<String, Object>> researchDetail = as.researchReferDetail(researchNo);
		
		mv.addObject("researchDetail", researchDetail);
		mv.setViewName("jsonView");
		
		return mv;
	}
}
