package com.opera.survway.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.opera.survway.admin.model.dao.AdminDao;
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
	 * @Description : 패널 전체 조회시 패널 수
	 */
	@Override
	public int getListCountPanel() throws SelectException {
		
		int listCount = ad.getListCountPanel(sqlSession);
		
		if(listCount <= 0) {
			throw new SelectException("패널 수 조회 실패!!");
		}
		return listCount;
	}
	
	/**
	 * @throws SelectException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 23.
	 * @ModifyDate  : 2020. 1. 23.
	 * @Description : 패널 전체 조회
	 */
	@Override
	public List<PanelMember> memberInfoManagement(PageInfo pi) throws SelectException {
		
		List<PanelMember> memberList = ad.memberInfoManagement(sqlSession, pi);
		
		if(memberList == null) {
			throw new SelectException("패널 조회 실패!!");
		}
		return memberList;
	}


}
