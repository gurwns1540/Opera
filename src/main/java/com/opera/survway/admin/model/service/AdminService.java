package com.opera.survway.admin.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.opera.survway.admin.model.vo.PanelRewardHistory;
import com.opera.survway.admin.model.vo.SearchMember;
import com.opera.survway.common.model.vo.AllMember;
import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.common.model.vo.ResearchState;
import com.opera.survway.corporation.model.vo.Research;
import com.opera.survway.corporation.model.vo.ResearchQuestion;
import com.opera.survway.exception.SelectException;

@Service
public interface AdminService {
	List<AllMember> memberInfoManagement(SearchMember searchMember) throws SelectException;

	int getListCountPanel(SearchMember searchMember) throws SelectException;

	AllMember selectMember(int mno) throws SelectException;

	int getListCountPanelCashoutApplicant() throws SelectException;

	List<PanelRewardHistory> panelCashoutApplication(PageInfo pi) throws SelectException;

	boolean cashoutPeople(List<String> cnoArr);

	int getListCountManageCashoutComplete() throws SelectException;

	List<PanelRewardHistory> manageCashoutComplete(PageInfo pi) throws SelectException;

	int getListCountNewPanel(SearchMember searchMember) throws SelectException;

	List<AllMember> getListNewPanel(SearchMember searchMember) throws SelectException;

	AllMember selectNewPanelDetail(int mno) throws SelectException;

	List<Map<String, String>> researchApprovalWaitList(PageInfo pi) throws SelectException;

	int getListCountArrovalList() throws SelectException;

	List<Map<String, Object>> researchApprovalDetail(int researchNo);

	boolean researchApproved(ResearchState researchState);

	boolean researchRefer(ResearchState researchState);

	int getListCountReferList() throws SelectException;

	List<Map<String, String>> researchReferList(PageInfo pi) throws SelectException;

	List<Map<String, Object>> researchReferDetail(int researchNo);

	int getListResearchWaitingPayment() throws SelectException;

	List<Map<String, String>> researchWaitingPayment(PageInfo pi) throws SelectException;

	List<Map<String, Object>> researchWaitPaymentDetail(int researchNo);

	boolean researchPaymentRefer(ResearchState researchState);

	int getListCountPaymentCompletedList() throws SelectException;

	List<Map<String, String>> paymentCompletedList(PageInfo pi) throws SelectException;

	List<Map<String, String>> billsDetail(int billingHistoryNo);

	int getListCountSurveyReconstructionList() throws SelectException;

	List<Map<String, String>> surveyReconstructionList(PageInfo pi) throws SelectException;

	boolean reconstruction(Research research, ArrayList<ResearchQuestion> questionList);

	List<Map<String, Object>> discriminationDetail(int researchNo);

	boolean reconstructureRefer(ResearchState researchState);

}
