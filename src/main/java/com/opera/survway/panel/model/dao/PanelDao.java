package com.opera.survway.panel.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.exception.LoginException;
import com.opera.survway.exception.SelectException;
import com.opera.survway.exception.SurveyException;
import com.opera.survway.panel.model.vo.Inquiry;
import com.opera.survway.panel.model.vo.Notice;
import com.opera.survway.panel.model.vo.PanelMember;
import com.opera.survway.panel.model.vo.Research;
import com.opera.survway.panel.model.vo.ResearchChoice;
import com.opera.survway.panel.model.vo.ResearchQuestion;
import com.opera.survway.panel.model.vo.Reward;
import com.opera.survway.panel.model.vo.SearchNotice;

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

	int insertRewardPanel(SqlSessionTemplate sqlSession, PanelMember pm);

	int insertTernaryPanel(SqlSessionTemplate sqlSession, PanelMember pm);

	List<Inquiry> selectAllMyInquiry(SqlSessionTemplate sqlSession, Inquiry i);

	int getListCountInquiry(SqlSessionTemplate sqlSession, Inquiry iq);

	int getListCountRewardSaved(SqlSessionTemplate sqlSession, Reward rd);

	List<Reward> showMyRewardDetailSaved(SqlSessionTemplate sqlSession, Reward rd);

	List<Reward> showMyRewardDetailUsed(SqlSessionTemplate sqlSession, Reward r);

	int getListCountRewardUsed(SqlSessionTemplate sqlSession, Reward r);
	int updateLeaveMember(SqlSessionTemplate sqlSession, PanelMember pm);

	int getNoticeListCount(SqlSessionTemplate sqlSession ,SearchNotice searchNotice);

	List<Notice> selectNoticeList(SqlSessionTemplate sqlSession, SearchNotice searchNotice);

	List<Notice> selectMainNoticeList(SqlSessionTemplate sqlSession) throws SelectException;

	List<Research> selectMainResearchList(SqlSessionTemplate sqlSession, PanelMember loginUser) throws SelectException;

	Reward getPanelReward(SqlSessionTemplate sqlSession, int mno);

	int insertCashOutHistory(SqlSessionTemplate sqlSession, Reward r);

	int insertRewardHistory(SqlSessionTemplate sqlSession, Reward r);

	int updatePanelReward(SqlSessionTemplate sqlSession, Reward r);

	List<ResearchQuestion> getTsQuestionList(SqlSessionTemplate sqlSession) throws SelectException;

	List<ResearchChoice> getTsChoiceList(SqlSessionTemplate sqlSession, int rquestionNo) throws SelectException;

	int getCountMyResearch(SqlSessionTemplate sqlSession, PanelMember loginUser);

	List<Research> getMyResearchList(SqlSessionTemplate sqlSession, PanelMember loginUser, PageInfo pi);



}
