package com.opera.survway.panel.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.common.model.vo.Pagination;
import com.opera.survway.exception.RewardException;
import com.opera.survway.panel.model.service.PanelService;
import com.opera.survway.panel.model.vo.PanelMember;
import com.opera.survway.panel.model.vo.Reward;

@SessionAttributes("loginUser")
@Controller
public class RewardController {
	
	@Autowired
	private PanelService ps;
	
	/**
	 * @Author	:hansol
	 * @CreateDate	:2020. 1. 27.
	 * @ModifyDate	:2020. 1. 27.
	 * @Description	:리워드 적립내역
	 */
	@RequestMapping("myRewardDetail_saved.rewardHistory")
	public String showMyRewardDetail_saved(HttpSession session, Model model,Reward rd) {
		PanelMember panelMember = (PanelMember)session.getAttribute("loginUser");
		int mno = panelMember.getMno();
		rd.setMno(mno);
		System.out.println(panelMember);
		int listCount = 0;
		int currentPage =1;
		
		try {
			listCount = ps.getListCountRewardSaved(rd);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			rd.setPi(pi);
			List<Reward> list = ps.showMyRewardDetailSaved(rd);
			
			System.out.println(list);
			
			model.addAttribute("list",list);
			model.addAttribute("pi",pi);
		} catch (RewardException e) {
			session.setAttribute("msg", e.getMessage());
		}
		
		
		return "myRewardDetail_saved";
	}
	
	/**
	 * @Author	:hansol
	 * @CreateDate	:2020. 1. 28.
	 * @ModifyDate	:2020. 1. 28.
	 * @Description	:리워드 사용내역
	 */
	@RequestMapping("myRewardDetail_used.rewardHistory")
	public String showMyRewardDetail_used(HttpSession session, Model model, Reward r) {
		PanelMember panelMember = (PanelMember)session.getAttribute("loginUser");
		int mno = panelMember.getMno();
		int listCount = 0;
		int currentPage =1;
		System.out.println("mno : "+mno);
		r.setMno(mno);
		try {
			listCount = ps.getListCountRewardUsed(r);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			r.setPi(pi);
			
			List<Reward> list = ps.showRewardDetailUsed(r);
			
			model.addAttribute("list", list);
			model.addAttribute("pi",pi);
		} catch (RewardException e) {
			session.setAttribute("msg", e.getMessage());
		}
		
		return "myRewardDetail_used";
	}
	
	
	@RequestMapping("myRewardCashOut.rewardHistory")
	public String applyRewardCashOut(HttpSession session, Model model, Reward r) {
		PanelMember panelMember = (PanelMember) session.getAttribute("loginUser");
		int mno = panelMember.getMno();
		System.out.println("cashout mno : "+ mno);
		
		return "myRewardCashOut";
	}
}






