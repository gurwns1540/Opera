package com.opera.survway.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.opera.survway.common.model.vo.AllMember;
import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.panel.model.vo.PanelMember;

public interface AdminDao {

	List<AllMember> memberInfoManagement(SqlSessionTemplate sqlSession, PageInfo pi);

	int getListCountPanel(SqlSessionTemplate sqlSession);

	AllMember selectMember(SqlSessionTemplate sqlSession, int mno);

}
