package com.opera.survway.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.opera.survway.common.model.vo.AllMember;
import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.panel.model.vo.PanelMember;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Override
	public int getListCountPanel(SqlSessionTemplate sqlSession) {
		int listCount = 0;
		
		listCount = sqlSession.selectOne("Admin.getListCountPanel");
		
		return listCount;
	}
	
	@Override
	public List<AllMember> memberInfoManagement(SqlSessionTemplate sqlSession, PageInfo pi) {
		List<AllMember> memberList = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		memberList = sqlSession.selectList("Admin.memberInfoManagement", null, rowBounds);
		
		return memberList;
	}

	@Override
	public AllMember selectMember(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("Admin.selectMember", mno);
	}


}
