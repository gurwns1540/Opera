package com.opera.survway.panel.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.opera.survway.exception.LoginException;
import com.opera.survway.panel.model.vo.PanelMember;

public interface PanelDao {

	PanelMember loginCheck(SqlSessionTemplate sqlSession, PanelMember pm) throws LoginException;


}
