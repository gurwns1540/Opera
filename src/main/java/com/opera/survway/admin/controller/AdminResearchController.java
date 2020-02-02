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
import com.opera.survway.corporation.model.vo.Research;
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
	public ModelAndView researchApproved(ModelAndView mv, String researchNoStr, String engagementGoalsStr, String qCountStr) {
		int researchNo = Integer.parseInt(researchNoStr);
		int engagementGoals = Integer.parseInt(engagementGoalsStr);
		int qCount = Integer.parseInt(qCountStr);
		
		int price = 0;
		
		if(qCount <= 10) {
			switch(engagementGoals) {
				case 100:
					price = engagementGoals * 4500;
					break;
				case 200:
					price = engagementGoals * 3800;
					break;
				case 300:
					price = engagementGoals * 3400;
					break;
				case 400:
					price = engagementGoals * 3000;
					break;
				case 500:
					price = engagementGoals * 2800;
					break;
			}
		}else if(qCount > 10 && qCount <= 30) {
			switch(engagementGoals) {
				case 100:
					price = engagementGoals * 5100;
					break;
				case 200:
					price = engagementGoals * 4500;
					break;
				case 300:
					price = engagementGoals * 3800;
					break;
				case 400:
					price = engagementGoals * 3400;
					break;
				case 500:
					price = engagementGoals * 2800;
					break;
			}
		}else if(qCount > 30 && qCount <= 50) {
			switch(engagementGoals) {
				case 100:
					price = engagementGoals * 6700;
					break;
				case 200:
					price = engagementGoals * 5500;
					break;
				case 300:
					price = engagementGoals * 4700;
					break;
				case 400:
					price = engagementGoals * 4200;
					break;
				case 500:
					price = engagementGoals * 3700;
					break;
			}
		}else if(qCount > 50 && qCount <= 70) {
			switch(engagementGoals) {
				case 100:
					price = engagementGoals * 8400;
					break;
				case 200:
					price = engagementGoals * 7000;
					break;
				case 300:
					price = engagementGoals * 6300;
					break;
				case 400:
					price = engagementGoals * 5800;
					break;
				case 500:
					price = engagementGoals * 4500;
					break;
			}
		}else if(qCount > 70) {
			switch(engagementGoals) {
				case 100:
					price = engagementGoals * 9400;
					break;
				case 200:
					price = engagementGoals * 8000;
					break;
				case 300:
					price = engagementGoals * 7300;
					break;
				case 400:
					price = engagementGoals * 6500;
					break;
				case 500:
					price = engagementGoals * 5700;
					break;
			}
		}
		
		ResearchState researchState = new ResearchState();
		researchState.setResearchNo(researchNo);
		researchState.setPrice(price);
		boolean isApproved = as.researchApproved(researchState);
		
		mv.addObject("isApproved", isApproved);
		mv.setViewName("jsonView");
		return mv;
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 2.
	 * @ModifyDate  : 2020. 2. 2.
	 * @Description : 리서치 반려
	 */
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
			
			model.addAttribute("researchReferList", researchReferList);
			model.addAttribute("pi", pi);
			return "researchReferList";
		} catch (SelectException e) {
			model.addAttribute("msg", e.getMessage());
			return "redirect:errorPage.me";
		}
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 2.
	 * @ModifyDate  : 2020. 2. 2.
	 * @Description : 리서치 반려 상세 조회
	 */
	@PostMapping("researchReferDetail.adminResearch")
	public ModelAndView researchReferDetail(ModelAndView mv, String researchNoStr) {
		int researchNo = Integer.parseInt(researchNoStr);
		
		List<Map<String, Object>> researchDetail = as.researchReferDetail(researchNo);
		
		mv.addObject("researchDetail", researchDetail);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 2.
	 * @ModifyDate  : 2020. 2. 2.
	 * @Description : 리서치 납부 대기 및 가격 협상 리스트
	 */
	@RequestMapping("researchWaitingPayment.adminResearch")
	public String researchWaitingPayment(HttpServletRequest request, Model model) {
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
			listCount = as.getListResearchWaitingPayment();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<Map<String, String>> researchWaitingPayment = as.researchWaitingPayment(pi);
			
			model.addAttribute("researchWaitingPayment", researchWaitingPayment);
			model.addAttribute("pi", pi);
			return "researchWaitingPayment";
		} catch (SelectException e) {
			model.addAttribute("msg", e.getMessage());
			return "redirect:errorPage.me";
		}
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 2.
	 * @ModifyDate  : 2020. 2. 2.
	 * @Description : 리서치 납부 대기 및 가격 협상 상세 보기
	 */
	@PostMapping("researchWaitPaymentDetail.adminResearch")
	public ModelAndView researchWaitPaymentDetail(ModelAndView mv, String researchNoStr) {
		int researchNo = Integer.parseInt(researchNoStr);
		
		List<Map<String, Object>> researchDetail = as.researchWaitPaymentDetail(researchNo);

		mv.addObject("researchDetail", researchDetail);
		mv.setViewName("jsonView");
		return mv;
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 2.
	 * @ModifyDate  : 2020. 2. 2.
	 * @Description : 가격 협상 승인
	 */
	@PostMapping("researchPaymentApproved.adminResearch")
	public ModelAndView researchPaymentApproved(ModelAndView mv, String researchNoStr, String conferencePriceStr) {
		int researchNo = Integer.parseInt(researchNoStr);
		int conferencePrice = Integer.parseInt(conferencePriceStr);
		
		ResearchState researchState = new ResearchState();
		researchState.setResearchNo(researchNo);
		researchState.setPrice(conferencePrice);
		
		boolean isApproved = as.researchApproved(researchState);

		mv.addObject("isApproved", isApproved);
		mv.setViewName("jsonView");
		return mv;
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 2.
	 * @ModifyDate  : 2020. 2. 2.
	 * @Description : 가격 협상 승인
	 */
	@PostMapping("researchPaymentRefer.adminResearch")
	public ModelAndView researchPaymentRefer(ModelAndView mv, String researchNoStr, String researchPriceStr, String referReason) {
		int researchNo = Integer.parseInt(researchNoStr);
		int researchPrice = Integer.parseInt(researchPriceStr);

		ResearchState researchState = new ResearchState();
		researchState.setResearchNo(researchNo);
		researchState.setPrice(researchPrice);
		researchState.setReferReason(referReason);
		
		boolean isRefer = as.researchPaymentRefer(researchState);
		
		mv.addObject("isRefer", isRefer);
		mv.setViewName("jsonView");
		return mv;
	}
	//협의완료
	@RequestMapping("researchConsultationCompleted.adminResearch")
	public String forwardResearchConsultationCompleted() {
		return"researchConsultationCompleted";
	}
	
}
