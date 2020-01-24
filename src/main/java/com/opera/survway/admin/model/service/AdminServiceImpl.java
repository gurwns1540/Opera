package com.opera.survway.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.opera.survway.admin.model.dao.AdminDao;
import com.opera.survway.admin.model.vo.PanelRewardHistory;
import com.opera.survway.admin.model.vo.SearchMember;
import com.opera.survway.common.model.vo.AllMember;
import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.exception.LoginException;
import com.opera.survway.exception.SelectException;
import com.opera.survway.panel.model.vo.PanelMember;

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

}
