package com.opera.survway.panel.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.common.model.vo.UploadFile;
import com.opera.survway.exception.LoginException;
import com.opera.survway.exception.SelectException;
import com.opera.survway.panel.model.vo.AttemptInsert;
import com.opera.survway.panel.model.vo.Faq;
import com.opera.survway.exception.SurveyException;
import com.opera.survway.panel.model.vo.Inquiry;
import com.opera.survway.panel.model.vo.Notice;
import com.opera.survway.panel.model.vo.PanelMember;
import com.opera.survway.panel.model.vo.PanelSurvey;
import com.opera.survway.panel.model.vo.PanelSurveyChoice;
import com.opera.survway.panel.model.vo.Research;
import com.opera.survway.panel.model.vo.ResearchChoice;
import com.opera.survway.panel.model.vo.ResearchQuestion;
import com.opera.survway.panel.model.vo.Reward;
import com.opera.survway.panel.model.vo.SearchNotice;
import com.opera.survway.panel.model.vo.SearchSurvey;
import com.opera.survway.panel.model.vo.Vote;

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

	int insertFaq(SqlSessionTemplate sqlSession, Faq faq);

	int getListCountFaq(SqlSessionTemplate sqlSession, Faq f);

	List<Faq> selectAllFaq(SqlSessionTemplate sqlSession, Faq f);

	int deleteFaq(SqlSessionTemplate sqlSession, Faq f);

	int updateFaq(SqlSessionTemplate sqlSession, Faq f);

	int answerInquiry(SqlSessionTemplate sqlSession, Inquiry i);

	int deleteAnswerInquiry(SqlSessionTemplate sqlSession, Inquiry i);

	int getCountMyResearch(SqlSessionTemplate sqlSession, PanelMember loginUser);

	List<Research> getMyResearchList(SqlSessionTemplate sqlSession, PanelMember loginUser, PageInfo pi);

	List<ResearchQuestion> getResearchQuestionList(SqlSessionTemplate sqlSession, String researchNo) throws SelectException;

	List<ResearchChoice> getResearchChoiceList(SqlSessionTemplate sqlSession, int rquestionNo) throws SelectException;

	Research getResearchInfo(SqlSessionTemplate sqlSession, String researchNo) throws SelectException;

	int insert(String string, Notice n, SqlSessionTemplate session);

	Notice selectNotice(int noticeNo, SqlSessionTemplate sqlSession);

	int updateNotice(SqlSessionTemplate sqlSession, Notice n);

	int noticeDelete(int noticeNo, SqlSessionTemplate sqlSession);

	int useRewardList(SqlSessionTemplate sqlSession, Reward r);

	int nowMyReward(SqlSessionTemplate sqlSession, Reward r);

	int insertAttemptParticipant(SqlSessionTemplate sqlSession, AttemptInsert attempt);

	int updateNomineeReward(SqlSessionTemplate sqlSession, String nominee);

	int updateUserReward(SqlSessionTemplate sqlSession, PanelMember pm);

	int insertRewardNomineeHistory(SqlSessionTemplate sqlSession, String nominee);

	int insertRewardUserHistory(SqlSessionTemplate sqlSession, PanelMember pm);

	int uploadSurvey(SqlSessionTemplate sqlSession, PanelSurvey panelSurvey);

	int uploadSurveyChoice(SqlSessionTemplate sqlSession, PanelSurveyChoice panelSurveyChoice);

	int uploadSurveyChoiceImage(SqlSessionTemplate sqlSession, UploadFile uploadFile);

	int getPanelSurveyList(SqlSessionTemplate sqlSession);

	List<Map<String, Object>> panelSurveyList(SqlSessionTemplate sqlSession, SearchSurvey searchSurvey);

	List<Integer> likeCheck(SqlSessionTemplate sqlSession, int mno);

	int minusLikeCount(SqlSessionTemplate sqlSession, int surveyNo);

	int plusLikeCount(SqlSessionTemplate sqlSession, int surveyNo);

	int deleteLikeHistory(SqlSessionTemplate sqlSession, PanelSurvey panelSurvey);

	int addLikeHistory(SqlSessionTemplate sqlSession, PanelSurvey panelSurvey);

	List<Map<String, Object>> statisticList(SqlSessionTemplate sqlSession, int surveyNo);

	List<Map<String, Object>> replyList(SqlSessionTemplate sqlSession, int surveyNo);

	int voteCheck(SqlSessionTemplate sqlSession, Vote vote);

	int voteSurvey(SqlSessionTemplate sqlSession, Vote vote);

}
