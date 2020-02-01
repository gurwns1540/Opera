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
	 * @Description : ts조사 질문 문항 및 보기 조회해오기 -> 그냥 설문조사 받아오는거로하고 안에서 신규패널일때는 ts조회로 아닐때는 일반설문조사들 조회로 빼라
	 */
	@RequestMapping("surveyList.survey")
	public String selectNotice(HttpServletRequest request, Model model) {
		
		//request에서 패널정보 받아오기
		PanelMember loginUser = (PanelMember)request.getSession().getAttribute("loginUser");
		
		//뷰페이지로 보낼 변수들 선언
		List<Research> researchList = null;
		List<ResearchQuestion> researchQuestionList = null;
		int qCount = 0;
		String message = "";
		
		//페이징
		String queryString = request.getQueryString();
		Map<String, List<String>> queryMap = null;
		int listCount = 0;
		int currentPage = 1;
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
				List<ResearchQuestion> tsQuestions = ps.getTsQuestionList();
				researchQuestionList = tsQuestions;
				System.out.println("tsQuestions 형식 : " + tsQuestions);
				qCount = tsQuestions.size();
				for(ResearchQuestion r : tsQuestions) {
					r.setProgressDataPercent((int)(Math.round((r.getResearchOrder()-1)/((double)qCount)*100)));
				}
				break;
//			//일반 회원일때 (비활성.준활성.활성) - 설문조사 목록 구성용 조회 (각 설문조사 진행은 따로 ajax처리)
//			case 2 : case 3 : case 4 :
//				listCount = ps.getCountResearch(loginUser);
//				PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
//				List<Research> researches = ps.getResearchList(pi);
//				researchList = researches;
//				break;
//			//휴면회원일때
//			case 5 :
//				message = "SURVWAY를 오랫동안 이용하지 않아 회원님의 아이디가 휴면 상태로 전환되었습니다. 회원정보 재인증 후 이용하실 수 있습니다.";
//				break;
//			//블랙회원일때
//			case 6 :
//				message = "회원님께서는 3회 불량 응답하였으므로 설문조사에 응하실 수 없습니다.";
//				break;
			}
			
			//신규회원용
			model.addAttribute("researchQuestionList", researchQuestionList);
			model.addAttribute("qCount", qCount);
			//일반회원용
			model.addAttribute("researchList", researchList);
			//휴면or블랙리스트회원용
			model.addAttribute("message", message);
			
			return "surveyList";
			
		} catch (SelectException e) {
			e.printStackTrace();
			return "";
		}
		
	}
	
}
