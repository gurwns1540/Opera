package com.opera.survway.panel.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.opera.survway.exception.SelectException;
import com.opera.survway.panel.model.service.PanelService;
import com.opera.survway.panel.model.vo.PanelMember;
import com.opera.survway.panel.model.vo.ResearchQuestion;

@Controller
public class SurveyController {
	@Autowired
	private PanelService ps;
	
	/**
	 * @Author      : Sooo
	 * @CreateDate  : 2020. 1. 31.
	 * @ModifyDate  : 2020. 1. 31.
	 * @Description : ts조사 질문 문항 및 보기 조회해오기 -> 그냥 설문조사 받아오는거로하고 안에서 신규패널일때는 ts조회로 아닐때는 일반설문조사들 조회로 빼라
	 */
	@RequestMapping("surveyList.survey")
	public String selectNotice(HttpServletRequest request, Model model) {
		
		//request에서 패널레벨 받아오기
		int panellevelNo = Integer.parseInt(((PanelMember)request.getSession().getAttribute("loginUser")).getPanellevelNo());
		
		//신규일땐 ts조사
		if(panellevelNo == 1) {
			
			try {
				List<ResearchQuestion> tsQuestions = ps.getTsQuestionList();
				model.addAttribute("tsQuestions", tsQuestions);
				return "surveyList";
			} catch (SelectException e) {
				e.printStackTrace();
				return "";
			}
			
		}else {
			return "";
		}
		
		
		
	}

}




































