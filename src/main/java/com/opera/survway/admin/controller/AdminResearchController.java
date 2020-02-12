package com.opera.survway.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.filefilter.OrFileFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.opera.survway.admin.model.exception.ResearchException;
import com.opera.survway.admin.model.service.AdminService;
import com.opera.survway.admin.model.vo.MailingList;
import com.opera.survway.common.model.vo.OperaFileNamePolicy;
import com.opera.survway.admin.model.vo.ResearchTarget;
import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.common.model.vo.Pagination;
import com.opera.survway.common.model.vo.ResearchState;
import com.opera.survway.common.model.vo.UploadFile;
import com.opera.survway.common.model.vo.Util;
import com.opera.survway.corporation.model.vo.Research;
import com.opera.survway.corporation.model.vo.ResearchChoice;
import com.opera.survway.corporation.model.vo.ResearchQuestion;
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
	 * @Description : 가격 협상 
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
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 3.
	 * @ModifyDate  : 2020. 2. 3.
	 * @Description : 결제 완료 이력
	 */
	@RequestMapping("researchConsultationCompleted.adminResearch")
	public String rResearchConsultationCompleted(Model model, HttpServletRequest request) {
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
			listCount = as.getListCountPaymentCompletedList();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<Map<String, String>> paymentList = as.paymentCompletedList(pi);
			
			model.addAttribute("paymentList", paymentList);
			model.addAttribute("pi", pi);
			return"researchConsultationCompleted";
		} catch (SelectException e) {
			model.addAttribute("msg", e.getMessage());
			return "redirect:errorPage.me";
		}
		
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 3.
	 * @ModifyDate  : 2020. 2. 3.
	 * @Description : 결제 이력 상세보기
	 */
	@PostMapping("billsDetail.adminResearch")
	public ModelAndView billsDetail(ModelAndView mv, String billingHistoryNoStr) {
		int billingHistoryNo = Integer.parseInt(billingHistoryNoStr);
		
		List<Map<String, String>> billsDetail = as.billsDetail(billingHistoryNo);
		
		mv.addObject("billsDetail", billsDetail);
		mv.setViewName("jsonView");
		return mv;
	}
	
	
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 3.
	 * @ModifyDate  : 2020. 2. 3.
	 * @Description : 리서치 재구성 대기 목록
	 */
	@RequestMapping("surveyReconstructionList.adminResearch")
	public String surveyReconstructionList(Model model, HttpServletRequest request) {
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
			listCount = as.getListCountSurveyReconstructionList();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<Map<String, String>> surveyReconstructionList = as.surveyReconstructionList(pi);
			
			model.addAttribute("surveyReconstructionList", surveyReconstructionList);
			model.addAttribute("pi", pi);
			return "surveyReconstructionList";
		} catch (SelectException e) {
			model.addAttribute("msg", e.getMessage());
			return "redirect:errorPage.me";
		}
		
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 4.
	 * @ModifyDate  : 2020. 2. 4.
	 * @Description : 리서치 문항 재구성
	 */
	@PostMapping("researchReconstruction.adminResearch")
	public ModelAndView researchReconstruction(ModelAndView mv, String[] discriminationQuestionOrder, String[] surveyQuizTitle, 
			String[] discriminationChoiceOrder, String[] choiceInput, String[] correctAnswer, 
			String researchNoStr, String[] questionOrder, String[] rquestionContext, String researchNamePanel) {
		Research research = new Research();
		research.setResearchName(researchNamePanel); // 패널에게 보여질 제목
		research.setResearchNo(Integer.parseInt(researchNoStr));
		// 기존 문항 내용 업데이트를 위한 ArrayList
		ArrayList<ResearchQuestion> questionList = new ArrayList<>();
		for(int i = 0; i < questionOrder.length; i++) {
			ResearchQuestion researchQuestion = new ResearchQuestion();
			researchQuestion.setQuestionOrder(Integer.parseInt(questionOrder[i]));
			researchQuestion.setRquestionContext(rquestionContext[i]);
			researchQuestion.setResearchNo(Integer.parseInt(researchNoStr));
			questionList.add(researchQuestion);
		}
		
		// 조사 대상자 판별 퀴즈를 위한 ArrayList
		ArrayList<ResearchQuestion> discriminationQuestionList = new ArrayList<>();
		int choiceIndex = 0;
		
		for(int i = 0; i < discriminationQuestionOrder.length; i++) {
			ArrayList<ResearchChoice> discriminationChoiceList = new ArrayList<>();
			ResearchQuestion researchQuestion = new ResearchQuestion();
			researchQuestion.setQuestionOrder(Integer.parseInt(discriminationQuestionOrder[i]));
			researchQuestion.setRquestionContext(surveyQuizTitle[i]);
			researchQuestion.setQuestionFormNo(Integer.parseInt(correctAnswer[i])); // 정답 보기를 넣기 위해 임의로..
			researchQuestion.setResearchNo(Integer.parseInt(researchNoStr));
			
			for(int j = choiceIndex; j < discriminationChoiceOrder.length; j++) {
				ResearchChoice researchChoice = new ResearchChoice();
				researchChoice.setChoiceOrder(Integer.parseInt(discriminationChoiceOrder[j]));
				researchChoice.setChoiceContext(choiceInput[j]);
				
				discriminationChoiceList.add(researchChoice);
				if(j != discriminationChoiceOrder.length - 1) {
					if(Integer.parseInt(discriminationChoiceOrder[j + 1]) == 1) {
						choiceIndex = j + 1;
						break;
					}
				}
			}
			researchQuestion.setRequestChoiceList(discriminationChoiceList);
			discriminationQuestionList.add(researchQuestion);
		}
		research.setQuestionList(discriminationQuestionList);
		
		boolean isReconstruction = as.reconstruction(research, questionList);
		
		mv.addObject("isReconstruction", isReconstruction);
		mv.setViewName("jsonView");
		return mv;
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 4.
	 * @ModifyDate  : 2020. 2. 4.
	 * @Description : 리서치 문항 재구성 상세
	 */
	@PostMapping("researchWaitingReviewDetail.adminResearch")
	public ModelAndView researchWaitingReviewDetail(ModelAndView mv, String researchNoStr) {
		int researchNo = Integer.parseInt(researchNoStr);
		
		List<Map<String, Object>> researchDetail = as.researchApprovalDetail(researchNo);
		
		List<Map<String, Object>> DiscriminationDetail = as.discriminationDetail(researchNo);
		
		mv.addObject("DiscriminationDetail", DiscriminationDetail);
		mv.addObject("researchDetail", researchDetail);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@PostMapping("reconstructureRefer.adminResearch")
	public ModelAndView reconstructureRefer(ModelAndView mv, String researchNoStr, String referReason) {
		int researchNo = Integer.parseInt(researchNoStr);
		ResearchState researchState = new ResearchState();
		researchState.setResearchNo(researchNo);
		researchState.setReferReason(referReason);
		
		boolean isRefer = as.reconstructureRefer(researchState);
		
		mv.addObject("isRefer", isRefer);
		mv.setViewName("jsonView");
		return mv;
	}
	
	//타입안정해서
	@RequestMapping("tsQaManagement.adminResearch")
	public String tsQaManagement(Model model) {
		List<Object> r = as.tsQaManagement();
		System.out.println(r);
		model.addAttribute("research", r);		
		return "tsQaManagement";
	}
	
	@PostMapping("tsQaManagementUpdate.adminResearch")
	public ModelAndView tsQaManagementUpdate(ModelAndView mv, @RequestParam(value="questionOrderArr") String[] questionOrderArr, @RequestParam(value="choiceOrderArr") String[] choiceOrderArr, @RequestParam(value="questionTitleArr") String[] questionTitleArr, @RequestParam(value="choiceTitleArr") String[] choiceTitleArr, @RequestParam(value="questionFormArr") String[] questionFormArr) {
		
		int choiceIndex = 0;
		ArrayList<ResearchQuestion> questionList = new ArrayList<>();
		
		for(int i = 0; i < questionOrderArr.length; i++) {
			ResearchQuestion researchQuestion = new ResearchQuestion();
			researchQuestion.setQuestionOrder(Integer.parseInt(questionOrderArr[i]));
			researchQuestion.setRquestionContext(questionTitleArr[i]);
			researchQuestion.setQuestionFormNo(Integer.parseInt(questionFormArr[i]));
			
			if(Integer.parseInt(questionFormArr[i]) == 1) {
				ArrayList<ResearchChoice> choiceList = new ArrayList<>();
				
				for(int j = choiceIndex; j < choiceOrderArr.length; j++) {
					ResearchChoice researchChoice = new ResearchChoice();
					researchChoice.setChoiceOrder(Integer.parseInt(choiceOrderArr[j]));
					researchChoice.setChoiceContext(choiceTitleArr[j]);
					
					choiceList.add(researchChoice);
					if(j != choiceOrderArr.length - 1) {
						if(Integer.parseInt(choiceOrderArr[j + 1]) == 1) {
							choiceIndex = j + 1;
							break;
						}
					}
				}
				researchQuestion.setRequestChoiceList(choiceList);	
			}
			questionList.add(researchQuestion);
		}
		
		System.out.println("controller");
		
		int result =as.tsQaManagementUpdate(questionList);
		mv.addObject("result",result);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping("groupMailingWaitingList.admin")
	public String forwardGroupMailingWaitingList(HttpServletRequest request, Model model) {
		// Post로 보낸걸 queryString이라고 한다
		String queryString = request.getQueryString();
		// 그걸 쪼개기 작업하기
		Map<String, List<String>> queryMap = null;
		int currentPage = 1;
		String researchName = "";
		MailingList list = new MailingList();
		if (queryString != null) {
			queryMap = Util.splitQuery(queryString);
			if (queryMap.containsKey("currentPage")) {
				currentPage = Integer.parseInt(queryMap.get("currentPage").get(0));
			}
			if (queryMap.containsKey("researchName")) {
				researchName = queryMap.get("inquiryTitle").get(0);
				list.setResearchName(researchName);
			}
		}
		
		int listCount = 0;
		
		listCount = as.getListCountMailingList(list);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		list.setPi(pi);
		List<MailingList> mailingList = as.selectMailingList(list);
		model.addAttribute("mailingList", mailingList);
		model.addAttribute("pi", pi);
		return "adminResearch/groupMailingWaitingList";
  }
	
	/**
	 * @Author      : hjheo
	 * @CreateDate  : 2020. 2. 6.
	 * @ModifyDate  : 2020. 2. 6.
	 * @Description : pc환경조사 audio
	 */
	@PostMapping("uploadFile.adminResearch")
	public ModelAndView uploadAudio(HttpServletRequest request, ModelAndView mv, MultipartFile file) {
		String root = request.getSession().getServletContext().getRealPath("resources"); //루트
		String savePath = root + "\\uploadFiles"; //저장경로
		
		String originFileName = file.getOriginalFilename(); //파일 원본이름가져오기
		String ext = originFileName.substring(originFileName.lastIndexOf(".")); //확장자
		String saveFile = OperaFileNamePolicy.getRandomString() + ext; //랜덤이름+확장자
	
		UploadFile ufo =new UploadFile();  //업로드 파일 객체 생성
		
		ufo.setChangeName(saveFile); //change이름 넣기
		ufo.setOriginName(originFileName); //오리지널 이름 넣기
		ufo.setFilePath(savePath); //파일 경로 넣기
		
		System.out.println(ufo);
		int result =0;
		result = as.uploadAudio(ufo);
		
		try { 
			file.transferTo(new File(savePath + "\\" + saveFile)); 
		} catch(IllegalStateException | IOException e) { 
			e.printStackTrace(); 
		}
		 
		mv.addObject("ufo", ufo);
		mv.setViewName("jsonView");
		
		System.out.println(originFileName);
		System.out.println(saveFile);
		return mv;
		
	}
	
	
	
	
	/**
	 * @Author      : hjheo
	 * @CreateDate  : 2020. 2. 10.
	 * @ModifyDate  : 2020. 2. 10.
	 * @Description : pc환경조사_오디오ver저장
	 */
	@PostMapping("audioEnviron.adminResearch")
	public ModelAndView audioEnviron(ModelAndView mv, @RequestParam(value="questionTitle") String questionTitle,@RequestParam(value="choiceTitleArr") String [] choiceTitleArr,@RequestParam(value="choiceOrderArr") String[] choiceOrderArr ,@RequestParam(value="titleContext") String titleContext,@RequestParam(value="questionFormNo") String questionFormNo) {
		//questionTitle,choicetitle
		System.out.println(questionTitle);
		for(int i = 0; i < choiceOrderArr.length; i++) {
			System.out.println(choiceOrderArr[i]);
		}
		for(int i = 0; i < choiceTitleArr.length; i++) {
			System.out.println(choiceTitleArr[i]);
		}
		
		
		//1.이거로 해서 delete부터
	   int result =as.audioEnviron(questionTitle,choiceTitleArr,choiceOrderArr,titleContext,questionFormNo);  
		
	   System.out.println("questionTitle"+questionTitle);
	   System.out.println("titleContext:"+titleContext);
		mv.addObject("result",result);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	/**
	 * @Author      : hjheo
	 * @CreateDate  : 2020. 2. 11.
	 * @ModifyDate  : 2020. 2. 11.
	 * @Description : 이거는 pc환경조사 select
	 */
	@RequestMapping("pcQaManagement.adminResearch")
	public String pcQaManagement(Model model) {
		ResearchQuestion question = as.pcQaManagement();
				System.out.println(question);
		//초이스리스트는 컬렉션으로		
		model.addAttribute("pcQa", question);
		return "pcQaManagement";
	}
	
	@PostMapping("video.adminResearch")
	public ModelAndView videoInsert(HttpServletRequest request,ModelAndView mv, String questionTitle,String [] choiceTitleArr,String[] choiceOrderArr,String titleContext, String questionFormNo,String videoAdress ) {
		for(int i = 0; i < choiceOrderArr.length; i++) {
			System.out.println(choiceOrderArr[i]);
		}
		for(int i = 0; i < choiceTitleArr.length; i++) {
			System.out.println(choiceTitleArr[i]);
		}
		String videoLink = (videoAdress.replace("https://", "")).replace("http://", "");
		
		System.out.println(videoLink);
		
		int result =as.videoInsert(questionTitle,choiceTitleArr,choiceOrderArr,titleContext,questionFormNo,videoLink);
		
	
		System.out.println("result:"+result);
		System.out.println("videoLink"+videoLink);
		
		
		
		mv.setViewName("jsonView");
		return mv;
	}
}
