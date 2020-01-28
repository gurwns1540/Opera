package com.opera.survway.panel.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.opera.survway.admin.model.vo.SearchMember;
import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.common.model.vo.Pagination;
import com.opera.survway.common.model.vo.Util;
import com.opera.survway.exception.SelectException;
import com.opera.survway.panel.model.service.PanelService;
import com.opera.survway.panel.model.vo.Notice;
import com.opera.survway.panel.model.vo.SearchNotice;

@Controller
public class customerCenterController {
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
	
	

}
