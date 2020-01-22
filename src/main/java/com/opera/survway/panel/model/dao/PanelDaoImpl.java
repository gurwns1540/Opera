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
	public List<Object> selectAllMyInquiry(SqlSessionTemplate sqlSession, PanelMember pm) {
		
		List<Object> list =  sqlSession.selectList("Inquiry.selectAllMyInquiry", pm);
		
		for(int i=0; i<list.size(); i++) {
			
			System.out.println("Dao"+list.get(i).toString());
			
		}
		
		return list;
		//return sqlSession.selectList("Inquiry.selectAllMyInquiry", pm);
	}

	@Override
	public int insertTermsPanel(SqlSessionTemplate sqlSession, PanelMember pm) {
		return sqlSession.insert("Panel.insertTermsPanel", pm);
	}

}
