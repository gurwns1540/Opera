package com.opera.survway.corporation.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.opera.survway.corporation.model.vo.CorpMember;
import com.opera.survway.exception.LoginException;

public interface CorpDao {

	CorpMember loginCheck(SqlSessionTemplate sqlSession, CorpMember cm) throws LoginException;

	int insertMemberTable(SqlSessionTemplate sqlSession, CorpMember cm);

	int insertCorpTable(SqlSessionTemplate sqlSession, CorpMember cm);

	String selectEncPassword(SqlSessionTemplate sqlSession, CorpMember cm);

	int insertTermsCorp(SqlSessionTemplate sqlSession, CorpMember cm);

}
