package com.opera.survway.admin.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.opera.survway.admin.model.vo.PanelRewardHistory;
import com.opera.survway.admin.model.vo.SearchMember;
import com.opera.survway.common.model.vo.AllMember;
import com.opera.survway.common.model.vo.PageInfo;
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
  
}
