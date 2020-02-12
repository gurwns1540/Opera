package com.opera.survway.panel.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.common.model.vo.Pagination;
import com.opera.survway.common.model.vo.Util;
import com.opera.survway.exception.InquiryException;
import com.opera.survway.exception.SelectException;
import com.opera.survway.panel.model.service.PanelService;
import com.opera.survway.panel.model.vo.AttemptInsert;
import com.opera.survway.panel.model.vo.Faq;
import com.opera.survway.panel.model.vo.InsertAnswer;
import com.opera.survway.panel.model.vo.PanelMember;
import com.opera.survway.panel.model.vo.PanelResearchList;
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
	public String selectSurveyList(HttpServletRequest request, Model model) {
		
		//request에서 패널정보 받아오기
		PanelMember loginUser = (PanelMember)request.getSession().getAttribute("loginUser");
		
		//뷰페이지로 보낼 변수들 선언
		List<Research> researchList = null;
		String msg = "noMessage";
		//리턴경로
		String path = "";
		
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
		
		switch(loginUser.getPanellevelNo()) {
		
		//신규회원일때 - 리서치정보조회 X, TS조사 질문들 바로 리턴
		case 1 : 
			path = "surveyList";
			break;
			
		//일반 회원일때 (비활성.준활성.활성) - 설문조사 목록 구성용 조회 (각 설문조사 진행은 따로 ajax처리)
		case 2 : case 3 : case 4 :
			listCount = ps.getCountMyResearch(loginUser);
			pi = Pagination.getPageInfo(currentPage, listCount);
			List<Research> myResearches = ps.getMyResearchList(loginUser, pi);
			researchList = myResearches;
			if(listCount == 0) {
				msg = "현재 참여 가능한 설문조사가 없습니다.";
			}
			path = "surveyList";
			break;
			
		//휴면회원일때
		case 5 :
			msg = "SURVWAY를 오랫동안 이용하지 않아 회원님의 아이디가 휴면 상태로 전환되었습니다.<br>회원정보 재인증 후 이용하실 수 있습니다.";
			path = "surveyList";
			break;
			
		//블랙회원일때
		case 6 :
			msg = "회원님께서는 3회 불량 응답하였으므로 설문조사에 참여하실 수 없습니다.";
			path = "surveyList";
			break;
		
		default : return "";
		
		}
		
		
		//신규 및 일반회원용
		model.addAttribute("researchList", researchList);
		System.out.println("pi.getMaxPage : " + pi.getMaxPage());
		model.addAttribute("pi", pi);
		//휴면or블랙리스트회원용
		model.addAttribute("msg", msg);
		
		return path;
	}
	
	/**
	 * @Author      : Sooo
	 * @CreateDate  : 2020. 2. 3.
	 * @ModifyDate  : 2020. 2. 3.
	 * @Description : 설문조사 목록 중 선택한 설문조사에 대한 문제 및 보기 리스트 조회
	 */
	@PostMapping("selectResearchQuestions.survey")
	public ModelAndView selectResearchQuestionList(String reward, String researchNo, String userName, String panellevelNo, ModelAndView mv) {
		
		//문항수
		int qCount = 0;
		//예상소요시간 (분)
		int time = 0;
		int minTime = 0;
		int maxTime = 0;
		
		
		try {
			Research researchInfo = ps.getResearchInfo(researchNo);
			System.out.println("researchInfo : " + researchInfo);
			List<ResearchQuestion> researchQuestions = ps.getResearchQuestionList(researchNo);
			System.out.println("researchQuestons : " + researchQuestions);
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
			
			minTime = time/2;
			maxTime = time*2;
			
			for(ResearchQuestion r : researchQuestions) {
				r.setResearchNo(Integer.parseInt(researchNo));
				r.setProgressDataPercent((int)(Math.round((r.getResearchOrder()-1)/((double)qCount)*100)));
			}
			
			System.out.println("time : " + time);
			System.out.println("qCount : " + qCount);
			
			mv.addObject("researchInfo", researchInfo);
			mv.addObject("researchQuestionList", researchQuestions);
			mv.addObject("questionCount", qCount);
			mv.addObject("time", time);
			mv.addObject("minTime", minTime);
			mv.addObject("maxTime", maxTime);
			mv.addObject("userName", userName);
			mv.addObject("panellevelNo", panellevelNo);
			mv.addObject("researchReward", reward);
			mv.setViewName("jsonView");
			
		} catch (SelectException e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	
	/**
	 * @Author      : Sooo
	 * @CreateDate  : 2020. 2. 9.
	 * @ModifyDate  : 2020. 2. 9.
	 * @Description : 설문조사 시도 테이블 인서트
	 */
	@PostMapping("insertResearchTry.survey")
	public ModelAndView insertResearchTry(String mno, String researchNo, ModelAndView mv) {
		
		System.out.println("조사시도 mno : " + mno);
		System.out.println("조사시도 researchNo : " + researchNo);
		
		AttemptInsert attempt = new AttemptInsert();
		attempt.setMno(mno);
		attempt.setResearchNo(researchNo);
		
//		int insertResult = ps.insertResearchTry(attempt);
		
		return mv;
	}
	
	
	/**
	 * @Author      : Sooo
	 * @CreateDate  : 2020. 2. 8.
	 * @ModifyDate  : 2020. 2. 8.
	 * @Description : 설문조사 응답 값 인서트
	 */
	@PostMapping("insertResearchAnswers.survey")
	public ModelAndView insertResearchAnswerList(String mno, String researchNo, String totalAnswer, String surveyTime, String minTime, String maxTime, String reward, String answerCheck, ModelAndView mv) {
		
		double surveyT = Double.parseDouble(surveyTime);
		int minT = Integer.parseInt(minTime);
		int maxT = Integer.parseInt(maxTime);
		String[] splitReward = (reward.split("P")[0]).split("~");
		String minReward = splitReward[0];
		String maxReward = splitReward[1];
		int check = Integer.parseInt(answerCheck);
		
		//일단 최고reward로 초기화한 후 아래 조건들에 걸리면 최저로 변경
		String finalReward = maxReward;
		//시간제한
		if(surveyT<minT || surveyT>maxT) {
			finalReward = minReward;
		}
		//정규식거른결과 1이면 자모음 또는 특수문자 입력
		if(check==1) {
			finalReward = minReward;
		}
		
		InsertAnswer answer = new InsertAnswer();
		answer.setMno(mno);
		answer.setResearchNo(researchNo);
		answer.setTotalAnswer(totalAnswer);
		answer.setSurveyTime(surveyTime);
		answer.setFinalReward(finalReward);
		
//		int insertResult = ps.insertAnswer(answer);
		
		mv.setViewName("jsonView");
		return mv;
	}
	
	/**
	 * @Author	:hansol
	 * @CreateDate	:2020. 2. 12.
	 * @ModifyDate	:2020. 2. 12.
	 * @Description	:참여 완료한 리서치 목록 검색 및 조회
	 */
	@RequestMapping("mySurveyList_complete.survey")
	public String showMySurveyList_complete(HttpSession session,HttpServletRequest request, PanelResearchList rl,
												Model model) {
		PanelMember panelMember = (PanelMember) session.getAttribute("loginUser");
		int mno = panelMember.getMno();
		String queryString = request.getQueryString();

		Map<String, List<String>> queryMap = null;

		int currentPage = 1;
		String researchTitle = "";
		

		rl = new PanelResearchList();
		rl.setMno(mno);
		if (queryString != null) {

			queryMap = Util.splitQuery(queryString);
			if (queryMap.containsKey("currentPage")) {
				currentPage = Integer.parseInt(queryMap.get("currentPage").get(0));
			}
			if (queryMap.containsKey("searchResearch")) {
				researchTitle = queryMap.get("searchResearch").get(0);
				rl.setResearchName(researchTitle);
			}
			
		}
		int listCount = 0;

		try {
			listCount = ps.getListCountPanelResearch(rl);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			rl.setPi(pi);
			List<PanelResearchList> list = ps.selectAllPanelResearchList(rl);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
		} catch (InquiryException e) {
			request.setAttribute("msg", e.getMessage());
		}
		
		
		return "mySurveyList_complete";
	}
	
	
	/**
	 * @Author	:hansol
	 * @CreateDate	:2020. 2. 13.
	 * @ModifyDate	:2020. 2. 13.
	 * @Description	:참여시도한 조사
	 */
	@RequestMapping("mySurveyList_retry.survey")
	public String showMySurveyList_retry(HttpSession session,HttpServletRequest request, PanelResearchList rl,
											Model model) {
		PanelMember panelMember = (PanelMember) session.getAttribute("loginUser");
		int mno = panelMember.getMno();
		String queryString = request.getQueryString();

		Map<String, List<String>> queryMap = null;

		int currentPage = 1;
		String researchTitle = "";
		

		rl = new PanelResearchList();
		rl.setMno(mno);
		if (queryString != null) {

			queryMap = Util.splitQuery(queryString);
			if (queryMap.containsKey("currentPage")) {
				currentPage = Integer.parseInt(queryMap.get("currentPage").get(0));
			}
			if (queryMap.containsKey("searchResearch")) {
				researchTitle = queryMap.get("searchResearch").get(0);
				rl.setResearchName(researchTitle);
			}
			
		}
		int listCount = 0;

		try {
			listCount = ps.getListCountPanelResearchRetry(rl);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			rl.setPi(pi);
			List<PanelResearchList> list = ps.selectAllPanelResearchRetryList(rl);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
		} catch (InquiryException e) {
			request.setAttribute("msg", e.getMessage());
		}
		return "mySurveyList_retry";
	}
}
































