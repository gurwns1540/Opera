package com.opera.survway.common.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.opera.survway.panel.model.vo.PanelMember;

public interface CommonDao {

	boolean duplicationIdCheck(SqlSessionTemplate sqlSession, String userId);

	boolean duplicationEmailCheck(SqlSessionTemplate sqlSession, String userEmail);

	int certificationMember(SqlSessionTemplate sqlSession, String userId);

	String selectEncPassword(SqlSessionTemplate sqlSession, String userId);

	int updateAccount(SqlSessionTemplate sqlSession, PanelMember loginUser);

}
