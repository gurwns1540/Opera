package com.opera.survway.panel.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.opera.survway.exception.LoginException;
import com.opera.survway.exception.SelectException;
import com.opera.survway.panel.model.vo.Inquiry;
import com.opera.survway.panel.model.vo.Notice;
import com.opera.survway.panel.model.vo.PanelMember;
import com.opera.survway.panel.model.vo.Research;
import com.opera.survway.panel.model.vo.Reward;
import com.opera.survway.panel.model.vo.SearchNotice;


@Repository
public class PanelDaoImpl implements PanelDao{

	@Override
	public PanelMember loginCheck(SqlSessionTemplate sqlSession, PanelMember pm) throws LoginException {
		
		PanelMember loginUser = sqlSession.selectOne("Panel.loginCheck", pm);
		
		if(loginUser==null) {
			throw new LoginException("로그인 정보가 일치하지 않습니다");
		}
		
		return loginUser;
	}
	
	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, PanelMember pm) {
		return sqlSession.selectOne("Panel.selectPwd", pm.getUserId());
	}
	
	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("Panel.selectPwd", userId);
	}

	@Override
	public int insertMemberTable(SqlSessionTemplate sqlSession, PanelMember pm) {
		return sqlSession.insert("Panel.insertMemberTable", pm);
	}

	@Override
	public int insertPanelTable(SqlSessionTemplate sqlSession, PanelMember pm) {
		return sqlSession.insert("Panel.insertPanelTable", pm);
	}

	@Override
	public int selectMno(SqlSessionTemplate sqlSession, PanelMember pm) {
		return sqlSession.selectOne("Panel.selectMno", pm);
	}

	@Override
	public int insertInquiry(SqlSessionTemplate sqlSession, Inquiry i) {
		
		return sqlSession.insert("Inquiry.insertInquiry", i);
	}

	@Override
	public List<Inquiry> selectAllMyInquiry(SqlSessionTemplate sqlSession, Inquiry i) {
		List<Inquiry> list = null;
		
		int offset = (i.getPi().getCurrentPage() -1)* i.getPi().getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, i.getPi().getLimit());
		
		list = sqlSession.selectList("Inquiry.selectAllMyInquiry", i,rowBounds);
		
		return list;
	}

	@Override
	public int getListCountInquiry(SqlSessionTemplate sqlSession, Inquiry iq) {
		int listCount =0;
		
		listCount = sqlSession.selectOne("Inquiry.getListCountInquiry",iq);
		return listCount;
	}

	@Override
	public int insertTermsPanel(SqlSessionTemplate sqlSession, PanelMember pm) {
		ArrayList<Integer> indexArr = new ArrayList<Integer>();
		for(int i = 1; i <= 5; i++) {
			indexArr.add(i);
		}
		pm.setIndexArr(indexArr);
		return sqlSession.insert("Panel.insertTermsPanel", pm);
	}
	
	/**
	 * @Author      : yhj
	 * @CreateDate  : 2020. 1. 22.
	 * @ModifyDate  : 2020. 1. 22.
	 * @Description : 회원정보수정(비밀번호X)
	 */
	@Override
	public int updateMemberInfo(SqlSessionTemplate sqlSession, PanelMember pm) {
		return sqlSession.update("Panel.updateMemberInfo", pm);
	}

	/**
	 * @Author      : yhj
	 * @CreateDate  : 2020. 1. 24.
	 * @ModifyDate  : 2020. 1. 24.
	 * @Description : 회원비밀번호수정
	 */
	@Override
	public int updatePassword(SqlSessionTemplate sqlSession, PanelMember pm) {
		return sqlSession.update("Panel.updatePassword", pm);
	}

  @Override
	public int insertRewardPanel(SqlSessionTemplate sqlSession, PanelMember pm) {
		return sqlSession.insert("Panel.insertRewardPanel", pm);
	}

	@Override
	public int insertTernaryPanel(SqlSessionTemplate sqlSession, PanelMember pm) {
		return sqlSession.insert("Panel.insertTernaryPanel", pm);
	}

	/**
	 * @Author	:hansol
	 * @CreateDate	:2020. 1. 27.
	 * @ModifyDate	:2020. 1. 27.
	 * @Description	:리워드 적립내역 listcount 조회
	 */
	@Override
	public int getListCountRewardSaved(SqlSessionTemplate sqlSession, Reward rd) {
		return sqlSession.selectOne("Panel.getListCountRewardSaved",rd);
	}

	/**
	 * @Author	:hansol
	 * @CreateDate	:2020. 1. 27.
	 * @ModifyDate	:2020. 1. 27.
	 * @Description	:리워드 적립내역 조회
	 */
	@Override
	public List<Reward> showMyRewardDetailSaved(SqlSessionTemplate sqlSession, Reward rd) {
		
		List<Reward> list = null;
		
		int offset = (rd.getPi().getCurrentPage() -1)* rd.getPi().getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, rd.getPi().getLimit());
		
		list = sqlSession.selectList("Panel.showMyRewardDetailSaved", rd,rowBounds);
		
		return list;
		
	}

	/**
	 * @Author	:hansol
	 * @CreateDate	:2020. 1. 28.
	 * @ModifyDate	:2020. 1. 28.
	 * @Description	:리워드 사용 내역 조회
	 */
	@Override
	public List<Reward> showMyRewardDetailUsed(SqlSessionTemplate sqlSession, Reward r) {
		List<Reward> list = null;
		
		int offset = (r.getPi().getCurrentPage() -1)* r.getPi().getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, r.getPi().getLimit());
		
		list = sqlSession.selectList("Panel.showMyRewardDetailUsed", r,rowBounds);
		
		return list;
	}

	/**
	 * @Author	:hansol
	 * @CreateDate	:2020. 1. 28.
	 * @ModifyDate	:2020. 1. 28.
	 * @Description	:리워드 사용내역 listCount
	 */
	@Override
	public int getListCountRewardUsed(SqlSessionTemplate sqlSession, Reward r) {
		
		return sqlSession.selectOne("Panel.getListCountRewardUsed",r);
	}

	/*
	 * @Author      : yhj
	 * @CreateDate  : 2020. 1. 26.
	 * @ModifyDate  : 2020. 1. 26.
	 * @Description : 회원탈퇴
	 */
	@Override
	public int updateLeaveMember(SqlSessionTemplate sqlSession, PanelMember pm) {
		return sqlSession.update("Panel.updateLeaveMember", pm);
	}

	@Override
	public int getNoticeListCount(SqlSessionTemplate sqlSession, SearchNotice searchNotice) {
		return sqlSession.selectOne("Panel.getNoticeListCount",searchNotice);
	}

	@Override
	public List<Notice> selectNoticeList(SqlSessionTemplate sqlSession, SearchNotice searchNotice) {
		int offset = (searchNotice.getPi().getCurrentPage() -1)* searchNotice.getPi().getLimit();
		RowBounds rowBounds = new RowBounds(offset,searchNotice.getPi().getLimit());
    
		return sqlSession.selectList("Panel.selectNoticeList", searchNotice, rowBounds);
  }
  
  /**
	 * @throws SelectException 
	 * @Author      : yhj
	 * @CreateDate  : 2020. 1. 28.
	 * @ModifyDate  : 2020. 1. 28.
	 * @Description : 메인페이지에서 공지사항 조회
	 */
	@Override
	public List<Notice> selectMainNoticeList(SqlSessionTemplate sqlSession) throws SelectException {
		RowBounds rowBounds = new RowBounds(0, 5);
		List<Notice> noticeList = sqlSession.selectList("Panel.selectMainNoticeList", null, rowBounds);
		if(noticeList == null) {
			sqlSession.close();
			throw new SelectException("메인페이지 공지사항 불러오기 실패");
		}
		return noticeList;
	}

	/**
	 * @throws SelectException 
	 * @Author      : yhj
	 * @CreateDate  : 2020. 1. 28.
	 * @ModifyDate  : 2020. 1. 28.
	 * @Description : 메인페이지에서 리서치 조회
	 */
	@Override
	public List<Research> selectMainResearchList(SqlSessionTemplate sqlSession, PanelMember loginUser) throws SelectException {
		List<Research> researchList = null;
		RowBounds rowBounds = new RowBounds(0, 4);
		researchList = sqlSession.selectList("Panel.selectMainResearchList", null, rowBounds);
		
		if(researchList == null) {
			sqlSession.close();
			throw new SelectException("메인페이지에서 리서치 불러오기 실패");
		}
		return researchList;
	}
	
}
