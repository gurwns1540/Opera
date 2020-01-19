package com.opera.survway.panel.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.opera.survway.exception.LoginException;
import com.opera.survway.panel.model.dao.PanelDao;
import com.opera.survway.panel.model.vo.PanelMember;

@Service
public class PanelServiceImpl implements PanelService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private PanelDao pd;
	@Autowired
	private DataSourceTransactionManager transactionmanager;
	

	@Override
	public PanelMember loginMember(PanelMember pm) throws LoginException {
		
		PanelMember loginUser = null;
		
		loginUser = pd.loginCheck(sqlSession, pm);
		
		return loginUser;
	}

}








































