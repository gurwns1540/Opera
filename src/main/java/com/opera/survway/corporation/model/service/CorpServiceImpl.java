package com.opera.survway.corporation.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
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
	private DataSourceTransactionManager transactionmanager;
	
	@Override
	public CorpMember loginMember(CorpMember cm) throws LoginException {
		
		CorpMember loginUser = null;
		loginUser = cd.loginCheck(sqlSession, cm);
		
		
		return null;
	}

}

