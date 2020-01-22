package com.opera.survway.panel.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.opera.survway.exception.LoginException;
import com.opera.survway.panel.model.vo.Inquiry;
import com.opera.survway.panel.model.vo.PanelMember;

public interface PanelDao {

	PanelMember loginCheck(SqlSessionTemplate sqlSession, PanelMember pm) throws LoginException;

	int insertMemberTable(SqlSessionTemplate sqlSession, PanelMember pm);

	int insertPanelTable(SqlSessionTemplate sqlSession, PanelMember pm);

	int selectMno(SqlSessionTemplate sqlSession, PanelMember pm);

	String selectEncPassword(SqlSessionTemplate sqlSession, PanelMember pm);

	int insertInquiry(SqlSessionTemplate sqlSession, Inquiry i);

  List<Object> selectAllMyInquiry(SqlSessionTemplate sqlSession, PanelMember pm);
  
	int insertTermsPanel(SqlSessionTemplate sqlSession, PanelMember pm);

}
