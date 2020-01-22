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
			throw new LoginException("로그인 실패");
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
	 * @CreateDate	:2020. 1. 22.
	 * @ModifyDate	:2020. 1. 22.
	 * @Description	: 1:1문의 리스트 보기
	 */
	@Override
	public List<Object> selectAllMyInquiry(PanelMember pm) {
		
		List<Object> list = pd.selectAllMyInquiry(sqlSession, pm);
		
		for(int i=0; i<list.size(); i++) {
			
			System.out.println("Service"+list.get(i).toString());
			
		}
		
		return list;
	}

}








































