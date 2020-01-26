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
	String selectEncPassword(SqlSessionTemplate sqlSession, String userId);

	int insertInquiry(SqlSessionTemplate sqlSession, Inquiry i);
  
	int insertTermsPanel(SqlSessionTemplate sqlSession, PanelMember pm);

	int updateMemberInfo(SqlSessionTemplate sqlSession, PanelMember pm);

	int updatePassword(SqlSessionTemplate sqlSession, PanelMember pm);

	int insertRewordPanel(SqlSessionTemplate sqlSession, PanelMember pm);

	int insertTernaryPanel(SqlSessionTemplate sqlSession, PanelMember pm);

	List selectAllMyInquiry(SqlSessionTemplate sqlSession, Inquiry i);

	List searchInquiryList(SqlSessionTemplate sqlSession, String search, int category);

	int updateLeaveMember(SqlSessionTemplate sqlSession, PanelMember pm);

}
