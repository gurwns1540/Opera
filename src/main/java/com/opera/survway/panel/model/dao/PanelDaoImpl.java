package com.opera.survway.panel.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.opera.survway.exception.LoginException;
import com.opera.survway.panel.model.vo.Inquiry;
import com.opera.survway.panel.model.vo.PanelMember;
import com.opera.survway.panel.model.vo.SearchInquiry;



@Repository
public class PanelDaoImpl implements PanelDao{

	@Override
	public PanelMember loginCheck(SqlSessionTemplate sqlSession, PanelMember pm) throws LoginException {
		
		PanelMember loginUser = sqlSession.selectOne("Panel.loginCheck", pm);
		
		if(loginUser==null) {
			throw new LoginException("로그인 정보가 존재하지 않습니다.");
		}
		
		return loginUser;
	}
	
	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, PanelMember pm) {
		return sqlSession.selectOne("Panel.selectPwd", pm.getUserId());
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
	public int insertTermsPanel(SqlSessionTemplate sqlSession, PanelMember pm) {
		return sqlSession.insert("Panel.insertTermsPanel", pm);
	}



}
=======
package com.opera.survway.panel.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.opera.survway.exception.LoginException;
import com.opera.survway.panel.model.vo.Inquiry;
import com.opera.survway.panel.model.vo.PanelMember;


@Repository
public class PanelDaoImpl implements PanelDao{

	@Override
	public PanelMember loginCheck(SqlSessionTemplate sqlSession, PanelMember pm) throws LoginException {
		
		PanelMember loginUser = sqlSession.selectOne("Panel.loginCheck", pm);
		
		if(loginUser==null) {
			throw new LoginException("로그인 정보가 존재하지 않습니다.");
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
	public List selectAllMyInquiry(SqlSessionTemplate sqlSession, Inquiry i) {
		List list = null;
		
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
	public int insertRewordPanel(SqlSessionTemplate sqlSession, PanelMember pm) {
		return sqlSession.insert("Panel.insertRewordPanel", pm);
	}

	@Override
	public int insertTernaryPanel(SqlSessionTemplate sqlSession, PanelMember pm) {
		return sqlSession.insert("Panel.insertTernaryPanel", pm);
	}

}
