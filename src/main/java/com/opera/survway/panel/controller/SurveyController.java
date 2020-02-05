package com.opera.survway.panel.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.core.appender.SyslogAppender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.opera.survway.common.model.vo.AllMember;
import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.common.model.vo.Pagination;
import com.opera.survway.common.model.vo.Util;
import com.opera.survway.exception.SelectException;
import com.opera.survway.exception.SurveyException;
import com.opera.survway.panel.model.service.PanelService;
import com.opera.survway.panel.model.vo.PanelMember;
import com.opera.survway.panel.model.vo.Research;
import com.opera.survway.panel.model.vo.ResearchQuestion;

@Controller
public class SurveyController {
	@Autowired
	private PanelService ps;
	
	/**
	 * @Author      : Sooo
	 * @CreateDate  : 2020. 1. 31.
	 * @ModifyDate  : 2020. 1. 31.
	 * @Description : 패널 정보에 맞는 설문조사 목록 조회 - ts조사(신규패널)는 바로 questions&choices 조회
	 */
	@RequestMapping("surveyList.survey")
	public String selectNotice(HttpServletRequest request, Model model) {
		
		//request에서 패널정보 받아오기
		PanelMember loginUser = (PanelMember)request.getSession().getAttribute("loginUser");
		
		//뷰페이지로 보낼 변수들 선언
		List<Research> researchList = null;
		List<ResearchQuestion> researchQuestionList = null;
		int qCount = 0;
		String msg = "noMessage";
		
		//페이징
		String queryString = request.getQueryString();
		Map<String, List<String>> queryMap = null;
		int listCount = 0;
		int currentPage = 1;
		PageInfo pi = null;
		if(queryString != null) {
			queryMap = Util.splitQuery(queryString);
			if(queryMap.containsKey("currentPage")) {
				currentPage = Integer.parseInt(queryMap.get("currentPage").get(0));
			}
		}
		
		try {
			
			switch(loginUser.getPanellevelNo()) {
			
			//신규회원일때 - 리서치정보조회 X, TS조사 질문들 바로 리턴
			case 1 : 
				listCount = 1;
				pi = Pagination.getPageInfo(currentPage, listCount);
				pi.setMaxPage(1);
				List<ResearchQuestion> tsQuestions = ps.getTsQuestionList();
				researchQuestionList = tsQuestions;
				qCount = tsQuestions.size();
				for(ResearchQuestion r : tsQuestions) {
					r.setProgressDataPercent((int)(Math.round((r.getResearchOrder()-1)/((double)qCount)*100)));
				}
				break;
				
			//일반 회원일때 (비활성.준활성.활성) - 설문조사 목록 구성용 조회 (각 설문조사 진행은 따로 ajax처리)
			case 2 : case 3 : case 4 :
				listCount = ps.getCountMyResearch(loginUser);
				pi = Pagination.getPageInfo(currentPage, listCount);
				List<Research> myResearches = ps.getMyResearchList(loginUser, pi);
				researchList = myResearches;
				if(listCount == 0) {
					pi.setMaxPage(1);
					msg = "현재 참여 가능한 설문조사가 없습니다.";
				}
				break;
				
			//휴면회원일때
			case 5 :
				msg = "SURVWAY를 오랫동안 이용하지 않아 회원님의 아이디가 휴면 상태로 전환되었습니다.<br>회원정보 재인증 후 이용하실 수 있습니다.";
				break;
				
			//블랙회원일때
			case 6 :
				msg = "회원님께서는 3회 불량 응답하였으므로 설문조사에 참여하실 수 없습니다.";
				break;
			
			}
			
		} catch (SelectException e) {
			e.printStackTrace();
			return "";
		}
		
		
		//신규회원용
		model.addAttribute("researchQuestionList", researchQuestionList);
		model.addAttribute("qCount", qCount);
		//일반회원용
		model.addAttribute("researchList", researchList);
		//휴면or블랙리스트회원용
		model.addAttribute("msg", msg);
		//페이징용(공통)
		model.addAttribute("pi", pi);
		
		return "tsSurveyList";
		
	}
	
	/**
	 * @Author      : Sooo
	 * @CreateDate  : 2020. 2. 3.
	 * @ModifyDate  : 2020. 2. 3.
	 * @Description : 설문조사 목록 중 선택한 설문조사에 대한 문제 및 보기 리스트 조회
	 */
	@PostMapping("selectResearchQuestions.survey")
	public ModelAndView selectNewPanel(HttpServletRequest request, String reward, String researchNo, ModelAndView mv) {
		
		//문항수
		int qCount = 0;
		//예상소요시간 (분)
		int time = 0;
		
		try {
			
			List<ResearchQuestion> researchQuestions = ps.getResearchQuestionList(researchNo);
			qCount = researchQuestions.size();
			
			if(qCount <= 10) {
				time = 5;
			}else if(qCount <=30) {
				time = 10;
			}else if(qCount <= 50) {
				time = 15;
			}else if(qCount <= 70) {
				time = 20;
			}else {
				time = qCount/2;
			}
			
			for(ResearchQuestion r : researchQuestions) {
				r.setResearchNo(Integer.parseInt(researchNo));
				r.setProgressDataPercent((int)(Math.round((r.getResearchOrder()-1)/((double)qCount)*100)));
			}
			
			System.out.println("time : " + time);
			System.out.println("qCount : " + qCount);
			
			mv.addObject("researchQuestionList", researchQuestions);
			mv.addObject("qCount", qCount);
			mv.addObject("time", time);
			mv.addObject("researchReward", reward);
			mv.setViewName("jsonView");
			
		} catch (SelectException e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
}
