package com.opera.survway.admin.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.opera.survway.admin.model.dao.AdminDao;
import com.opera.survway.admin.model.vo.PanelRewardHistory;
import com.opera.survway.admin.model.vo.SearchMember;
import com.opera.survway.common.model.vo.AllMember;
import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.common.model.vo.ResearchState;
import com.opera.survway.common.model.vo.UploadFile;
import com.opera.survway.corporation.model.vo.ResearchChoice;
import com.opera.survway.corporation.model.vo.ResearchQuestion;
import com.opera.survway.exception.SelectException;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired 
	private AdminDao ad;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * @throws SelectException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 23.
	 * @ModifyDate  : 2020. 1. 23.
	 * @Description : 회원 조회시 회원 수
	 */
	@Override
	public int getListCountPanel(SearchMember searchMember) throws SelectException {
		
		int listCount = ad.getListCountPanel(sqlSession, searchMember);
		
		if(listCount <= 0) {
			throw new SelectException("회원 수 조회 실패");
		}
		return listCount;
	}
	
	/**
	 * @throws SelectException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 23.
	 * @ModifyDate  : 2020. 1. 23.
	 * @Description : 회원 전체 조회
	 */
	@Override
	public List<AllMember> memberInfoManagement(SearchMember searchMember) throws SelectException {
		
		List<AllMember> memberList = ad.memberInfoManagement(sqlSession, searchMember);
		
		if(memberList == null) {
			throw new SelectException("회원 조회 실패");
		}
		return memberList;
	}

	/**
	 * @throws SelectException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 23.
	 * @ModifyDate  : 2020. 1. 23.
	 * @Description : 회원 상세 조회
	 */
	@Override
	public AllMember selectMember(int mno) throws SelectException {
		AllMember member = ad.selectMember(sqlSession, mno);
		
		if(member == null) {
			throw new SelectException("회원 상세 조회 실패");
		}
		return member;
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 24.
	 * @ModifyDate  : 2020. 1. 24.
	 * @Description : 패널 캐시아웃 신청 이력 수
	 */
	@Override
	public int getListCountPanelCashoutApplicant() throws SelectException {
		
		int listCount = ad.getListCountPanelCashoutApplicant(sqlSession);
		
		if(listCount <= 0) {
			throw new SelectException("캐시아웃 신청 이력 수 조회 실패");
		}
		return listCount;
	}

	/**
	 * @throws SelectException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 24.
	 * @ModifyDate  : 2020. 1. 24.
	 * @Description : 패널 캐시아웃 신청 이력
	 */
	@Override
	public List<PanelRewardHistory> panelCashoutApplication(PageInfo pi) throws SelectException {
		List<PanelRewardHistory> panelRewardHistoryList = ad.panelCashoutApplication(sqlSession, pi);
		
		if(panelRewardHistoryList == null) {
			throw new SelectException("캐시아웃 신청 이력 조회 실패");
		}
		return panelRewardHistoryList;
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 25.
	 * @ModifyDate  : 2020. 1. 25.
	 * @Description : 회원 1인, 다수 캐시아웃 확인완료 ajax
	 */
	@Override
	public boolean cashoutPeople(List<String> cnoArr) {
		
		int result = ad.cashoutPeople(sqlSession, cnoArr);
		
		if(result > 0) {
			return true;
		}else {
			return false;
		}
	}

	/**
	 * @throws SelectException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 25.
	 * @ModifyDate  : 2020. 1. 25.
	 * @Description : 패널 캐시아웃 완료 이력 수
	 */
	@Override
	public int getListCountManageCashoutComplete() throws SelectException {
		int listCount = ad.getListCountManageCashoutComplete(sqlSession);
		
		if(listCount <= 0) {
			throw new SelectException("캐시아웃 완료 이력 수 조회 실패");
		}
		return listCount;
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 29.
	 * @ModifyDate  : 2020. 1. 29.
	 * @Description : 캐시아웃 완료 이력 조회
	 */
	@Override
	public List<PanelRewardHistory> manageCashoutComplete(PageInfo pi) throws SelectException {
		List<PanelRewardHistory> rewardCompleteHistoryList = ad.manageCashoutComplete(sqlSession, pi);
		
		if(rewardCompleteHistoryList == null) {
			throw new SelectException("캐시아웃 완료 이력 조회 실패");
		}
		return rewardCompleteHistoryList;
	}

	/**
	 * @throws SelectException 
	 * @Author      : Sooo
	 * @CreateDate  : 2020. 1. 28.
	 * @ModifyDate  : 2020. 1. 28.
	 * @Description : 신규회원관리페이지 페이징을 위해 전체 신규회원리스트 갯수 가져오기
	 */
	@Override
	public int getListCountNewPanel(SearchMember searchMember) throws SelectException {
		int listCount = ad.getListCountNewPanel(sqlSession, searchMember);

		if(listCount <= 0) {
			throw new SelectException("신규회원 수 조회 실패");
		}
		
		return listCount;
	}

	/**
	 * @throws SelectException 
	 * @Author      : Sooo
	 * @CreateDate  : 2020. 1. 28.
	 * @ModifyDate  : 2020. 1. 28.
	 * @Description : 신규회원관리페이지 회원정보목록 조회해서 가져오기
	 */
	@Override
	public List<AllMember> getListNewPanel(SearchMember searchMember) throws SelectException {

		List<AllMember> memberList = ad.getListNewPanel(sqlSession, searchMember);

		if(memberList == null) {
			throw new SelectException("신규회원 조회 실패");
		}
		return memberList;
	}

	/**
	 * @throws SelectException 
	 * @Author      : Sooo
	 * @CreateDate  : 2020. 1. 28.
	 * @ModifyDate  : 2020. 1. 28.
	 * @Description : 신규회원관리페이지 신규회원정보 상세보기 모달창에 띄울 정보 조회해서 가져오기
	 */
	@Override
	public AllMember selectNewPanelDetail(int mno) throws SelectException {
		AllMember newPanelDetail = ad.getNewPanelDetail(sqlSession, mno);
		if(newPanelDetail == null) {
			throw new SelectException("신규회원 상세보기 조회 실패");
		}
		return newPanelDetail;
	}

	/**
	 * @throws SelectException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 31.
	 * @ModifyDate  : 2020. 1. 31.
	 * @Description : 리서치 신청 수 
	 */
	@Override
	public int getListCountArrovalList() throws SelectException {
		int listCount = ad.getListCountArrovalList(sqlSession);
		if(listCount < 0) {
			throw new SelectException("리서치 신청 수 조회 실패");
		}
		return listCount;
	}
	
	/**
	 * @throws SelectException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 31.
	 * @ModifyDate  : 2020. 1. 31.
	 * @Description : 리서치 신청 리스트
	 */
	@Override
	public List<Map<String, String>> researchApprovalWaitList(PageInfo pi) throws SelectException {
		List<Map<String, String>> researchApprovalWaitList = ad.researchApprovalWaitList(sqlSession, pi);
		if(researchApprovalWaitList == null) {
			throw new SelectException("리서치 신청 리스트 조회 실패");
		}
		return researchApprovalWaitList;
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 31.
	 * @ModifyDate  : 2020. 1. 31.
	 * @Description : 리서치 신청 상세 보기
	 */
	@Override
	public List<Map<String, Object>> researchApprovalDetail(int researchNo) {
		List<Map<String, Object>> researchApprovalDetail = ad.researchApprovalDetail(sqlSession, researchNo);
		ArrayList<ResearchQuestion> questionList = ((ArrayList<ResearchQuestion>)researchApprovalDetail.get(0).get("questionList"));
		for(int i = 0; i < questionList.size(); i++) {
			UploadFile questionImage = ad.questionImage(sqlSession, questionList.get(i).getQuestionNo());
			
			((ArrayList<ResearchQuestion>)researchApprovalDetail.get(0).get("questionList")).get(i).setImage(questionImage);
			
			ArrayList<ResearchChoice> choiceList = questionList.get(i).getRequestChoiceList();
			for(int j = 0; j < choiceList.size(); j++) {
				UploadFile choiceImage = ad.choiceImage(sqlSession, choiceList.get(j).getChoiceNo());
				
				((ArrayList<ResearchQuestion>)researchApprovalDetail.get(0).get("questionList")).get(i).getRequestChoiceList().get(j).setChoiceImage(choiceImage);
			}
		}
		return researchApprovalDetail;
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 1.
	 * @ModifyDate  : 2020. 2. 1.
	 * @Description : 리서치 신청 승인
	 */
	@Override
	public boolean researchApproved(ResearchState researchState) {
		boolean isApproved = false;
		int result1 = ad.researchApproved(sqlSession, researchState);
		
		int result2 = ad.insertConferenceHistory(sqlSession, researchState);
		
		int result3 = ad.updateResearchPrice(sqlSession, researchState);
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			isApproved = true;
		}
		return isApproved;
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 1.
	 * @ModifyDate  : 2020. 2. 1.
	 * @Description : 리서치 반려
	 */
	@Override
	public boolean researchRefer(ResearchState researchState) {
		boolean isRefer = false;
		int result = ad.researchRefer(sqlSession, researchState);
		if(result > 0) {
			isRefer = true;
		}
		return isRefer;
	}

	/**
	 * @throws SelectException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 1.
	 * @ModifyDate  : 2020. 2. 1.
	 * @Description : 리서치 반려 목록 수
	 */
	@Override
	public int getListCountReferList() throws SelectException {
		int listCount = ad.getListCountReferList(sqlSession);
		if(listCount < 0) {
			throw new SelectException("리서치 반려 수 조회 실패");
		}
		return listCount;
	}

	/**
	 * @throws SelectException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 1.
	 * @ModifyDate  : 2020. 2. 1.
	 * @Description : 리서치 반려 목록 조회
	 */
	@Override
	public List<Map<String, String>> researchReferList(PageInfo pi) throws SelectException {
		List<Map<String, String>> researchReferList = ad.researchReferList(sqlSession, pi);
		if(researchReferList == null) {
			throw new SelectException("리서치 신청 리스트 조회 실패");
		}
		return researchReferList;
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 1.
	 * @ModifyDate  : 2020. 2. 1.
	 * @Description : 리서치 반려 상세 조회 
	 */
	@Override
	public List<Map<String, Object>> researchReferDetail(int researchNo) {
		return ad.researchReferDetail(sqlSession, researchNo);
	}

	/**
	 * @throws SelectException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 2.
	 * @ModifyDate  : 2020. 2. 2.
	 * @Description : 리서치 납부 대기 및 가격 협상 리스트 수
	 */
	@Override
	public int getListResearchWaitingPayment() throws SelectException {
		int listCount = ad.getListResearchWaitingPayment(sqlSession);
		if(listCount < 0) {
			throw new SelectException("리서치 납부 대기 및 가격 협상 리스트 수 조회 실패");
		}
		return listCount;
	}

	/**
	 * @throws SelectException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 2.
	 * @ModifyDate  : 2020. 2. 2.
	 * @Description : 리서치 납부 대기 및 가격 협상 리스트
	 */
	@Override
	public List<Map<String, String>> researchWaitingPayment(PageInfo pi) throws SelectException {
		List<Map<String, String>> researchWaitingPayment = ad.researchWaitingPayment(sqlSession, pi);
		if(researchWaitingPayment == null) {
			throw new SelectException("리서치 납부 대기 및 가격 협상 리스트 조회 실패");
		}
		return researchWaitingPayment;
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 2. 2.
	 * @ModifyDate  : 2020. 2. 2.
	 * @Description : 리서치 납부 대기 및 가격 협상 상세 보기
	 */
	@Override
	public List<Map<String, Object>> researchWaitPaymentDetail(int researchNo) {
		return ad.researchWaitPaymentDetail(sqlSession, researchNo);
	}

}
