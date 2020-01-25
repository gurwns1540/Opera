package com.opera.survway.corporation.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.opera.survway.corporation.model.dao.CorpDao;
import com.opera.survway.corporation.model.vo.CorpMember;
import com.opera.survway.exception.LoginException;

@Service
public class CorpServiceImpl implements CorpService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CorpDao cd;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private DataSourceTransactionManager transactionmanager;
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 23.
	 * @ModifyDate  : 2020. 1. 23.
	 * @Description : 기업 로그인
	 */
	@Override
	public CorpMember loginMember(CorpMember cm) throws LoginException {
		
		CorpMember loginUser = null;
		String encPassword = cd.selectEncPassword(sqlSession, cm);
		
		if(passwordEncoder.matches(cm.getUserPwd(), encPassword)) {
			loginUser = cd.loginCheck(sqlSession, cm);
		}else {
			throw new LoginException("기업 로그인 실패");
		}
		
		return loginUser;
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 23.
	 * @ModifyDate  : 2020. 1. 23.
	 * @Description : 기업 회원가입
	 */
	@Override
	public int insertCorp(CorpMember cm) throws LoginException {

		int resultMemberTable = cd.insertMemberTable(sqlSession, cm);
		int resultCorpTable = 0;
		if(resultMemberTable > 0) {
			resultCorpTable = cd.insertCorpTable(sqlSession, cm);
			cd.insertTermsCorp(sqlSession, cm);
		}
		
		if(!(resultMemberTable > 0 && resultCorpTable > 0)) {
			throw new LoginException("회원가입 실패!");
		}else {
			return 0;
		}
		
	}

}

