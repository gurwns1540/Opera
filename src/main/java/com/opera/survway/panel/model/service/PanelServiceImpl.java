package com.opera.survway.panel.model.service;



import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.opera.survway.exception.LoginException;
import com.opera.survway.panel.model.dao.PanelDao;
import com.opera.survway.panel.model.vo.Inquiry;
import com.opera.survway.panel.model.vo.PanelMember;


@Service
public class PanelServiceImpl implements PanelService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private PanelDao pd;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private DataSourceTransactionManager transactionmanager;
	
	/**
	 * @Author      : Oh
	 * @CreateDate  : 2020-01-19
	 * @ModifyDate  : 2020-01-21
	 * @Description : 로그인 기능
	 */
	@Override
	public PanelMember loginMember(PanelMember pm) throws LoginException {
		
		PanelMember loginUser = null;
		
		String encPassword = pd.selectEncPassword(sqlSession, pm);
		if(passwordEncoder.matches(pm.getUserPwd(), encPassword)) {
			loginUser = pd.loginCheck(sqlSession, pm);
		}else {
			throw new LoginException("loginFail");
		}
		
		return loginUser;
	}

	/**
	 * @Author      : Oh
	 * @CreateDate  : 2020-01-19
	 * @ModifyDate  : 2020-01-21
	 * @Description : 회원가입 기능
	 */
	@Override
	public int insertMember(PanelMember pm) throws LoginException {
		
		int resultMemberTable=0;
		int resultPanelTable=0;
		
		resultMemberTable = pd.insertMemberTable(sqlSession, pm);
		if(resultMemberTable > 0) {
			int mno = pd.selectMno(sqlSession, pm);
			pm.setMno(mno);
			resultPanelTable = pd.insertPanelTable(sqlSession, pm);
			if(resultPanelTable > 0) {
				pd.insertTermsPanel(sqlSession, pm);
				pd.insertRewordPanel(sqlSession, pm);
				pd.insertTernaryPanel(sqlSession, pm);
			}
		}
		
		if(!(resultMemberTable>0 && resultPanelTable>0)) {
			throw new LoginException("회원가입 실패!");
		}else {
			return 0;
		}
	}

	/**
	 * @Author	:hansol
	 * @CreateDate	:2020. 1. 22.
	 * @ModifyDate	:2020. 1. 22.
	 * @Description	: 1:1문의 등록
	 */
	@Override
	public int insertInquiry(Inquiry i) {
		int result =0;
		
		result=pd.insertInquiry(sqlSession, i);
		
		return result;
	}

	/**
	 * @Author	:hansol
	 * @CreateDate	:2020. 1. 23.
	 * @ModifyDate	:2020. 1. 23.
	 * @Description	:1:1문의 전체 조회
	 */
	@Override
	public List selectAllMyInquiry(Inquiry i) {
		
		List list = pd.selectAllMyInquiry(sqlSession, i); 
		
		return list;
	}

	/**
	 * @Author	:hansol
	 * @CreateDate	:2020. 1. 24.
	 * @ModifyDate	:2020. 1. 24.
	 * @Description	:1:1문의 검색기능
	 */
	@Override
	public List searchInquiryList(String search, int category) {
		
		List list = pd.searchInquiryList(sqlSession, search, category);
		
		return list;
	}
	/**
	 * @Author      : yhj
	 * @CreateDate  : 2020. 1. 22.
	 * @ModifyDate  : 2020. 1. 22.
	 * @Description : 회원정보수정(비밀번호X)
	 */
	@Override
	public int updateMemberInfo(PanelMember pm) {
		
		return pd.updateMemberInfo(sqlSession, pm);
	}

	/**
	 * @Author      : yhj
	 * @CreateDate  : 2020. 1. 24.
	 * @ModifyDate  : 2020. 1. 24.
	 * @Description : 회원정보수정(비밀번호)
	 */
	@Override
	public int updatePassword(PanelMember pm) {
		return pd.updatePassword(sqlSession, pm);
	}

	/**
	 * @Author      : yhj
	 * @CreateDate  : 2020. 1. 26.
	 * @ModifyDate  : 2020. 1. 26.
	 * @Description : 회원탈퇴
	 */
	@Override
	public int updateLeaveMember(PanelMember pm) {
		return pd.updateLeaveMember(sqlSession, pm);
	}
}

