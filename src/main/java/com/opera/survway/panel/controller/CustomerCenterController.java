package com.opera.survway.panel.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.common.model.vo.Pagination;
import com.opera.survway.common.model.vo.Util;
import com.opera.survway.exception.InquiryException;
import com.opera.survway.exception.SelectException;
import com.opera.survway.panel.model.service.PanelService;
import com.opera.survway.panel.model.vo.Inquiry;
import com.opera.survway.panel.model.vo.Notice;
import com.opera.survway.panel.model.vo.PanelMember;
import com.opera.survway.panel.model.vo.SearchNotice;

@Controller
public class CustomerCenterController {
	@Autowired
	private PanelService ps;
	
	
	/**
	 * @Author      : hjheo
	 * @CreateDate  : 2020. 1. 27.
	 * @ModifyDate  : 2020. 1. 27.
	 * @Description : 공지사항 목록 리스트& 검색
	 */
	@RequestMapping("notice.customerCenter")
	public String selectNotice(HttpServletRequest request, Model model) {
		String queryString = request.getQueryString();
		
		Map<String, List<String>> queryMap =  null;
		
		int currentPage = 1; 
		
		String searchValue="";
		
		SearchNotice searchNotice =new SearchNotice();
		
		if(queryString != null) { 
			queryMap = Util.splitQuery(queryString);
			if(queryMap.containsKey("currentPage")) {
				currentPage = Integer.parseInt(queryMap.get("currentPage").get(0));
			}
			if(queryMap.containsKey("searchValue")) {
				searchValue=queryMap.get("searchValue").get(0);
				searchNotice.setSearchValue(searchValue);
				
				System.out.println(searchValue);
			}
		}
		int listCount =0;
		try {
			listCount = ps.getNoticeListCount(searchNotice);
			System.out.println(listCount);
			
			PageInfo pi =Pagination.getPageInfo(currentPage, listCount);
			
			searchNotice.setPi(pi);
			
			List<Notice> noticeList = ps.selectNoticeList(searchNotice);
			
			System.out.println(noticeList);
			model.addAttribute("noticeList",noticeList);
			model.addAttribute("pi",pi);
			return "notice";
			
		} catch (SelectException e) {
			model.addAttribute("msg", e.getMessage());
			return "redirect:errorPage.me";
		}
	}
	
	/**
	 * @Author      : hansol
	 * @CreateDate  : 2020. 1. 25.
	 * @ModifyDate  : 2020. 1. 25.
	 * @Description : 1:1문의 등록
	 */
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

    /**
	 * @Author      : hansol
	 * @CreateDate  : 2020. 1. 25.
	 * @ModifyDate  : 2020. 1. 25.
	 * @Description : 1:1문의 리스트 보기
	 */
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
         
       }

       int listCount = 0;

       PanelMember loginUser = (PanelMember) session.getAttribute("loginUser");
       int mno = loginUser.getMno();

       iq.setMno(mno);


       try {
          listCount = ps.getListCountInquiry(iq);
          
          PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

          iq.setPi(pi);

          List<Inquiry> list = ps.selectAllMyInquiry(iq);
         
          model.addAttribute("list", list);
          model.addAttribute("pi",pi);
       } catch (InquiryException e) {
          request.setAttribute("msg", e.getMessage());
       }

       return "panelInquiryList";
    }

}
