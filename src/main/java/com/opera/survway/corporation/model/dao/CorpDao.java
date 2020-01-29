package com.opera.survway.corporation.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.opera.survway.corporation.model.vo.Research;
import com.opera.survway.common.model.vo.UploadFile;
import com.opera.survway.corporation.model.vo.CorpMember;
import com.opera.survway.corporation.model.vo.ResearchChoice;
import com.opera.survway.corporation.model.vo.ResearchQuestion;
import com.opera.survway.exception.LoginException;

public interface CorpDao {

	CorpMember loginCheck(SqlSessionTemplate sqlSession, CorpMember cm) throws LoginException;

	int insertMemberTable(SqlSessionTemplate sqlSession, CorpMember cm);

	int insertCorpTable(SqlSessionTemplate sqlSession, CorpMember cm);

	String selectEncPassword(SqlSessionTemplate sqlSession, CorpMember cm);

	int insertTermsCorp(SqlSessionTemplate sqlSession, CorpMember cm);

	int insertResearch(SqlSessionTemplate sqlSession, Research research);

	int insertQuestion(SqlSessionTemplate sqlSession, ResearchQuestion question);

	int insertChoice(SqlSessionTemplate sqlSession, ResearchChoice choice);

	int insertImage(SqlSessionTemplate sqlSession, UploadFile uploadFile);

	int insertTarger(SqlSessionTemplate sqlSession, Research research);

	int insertResearchState(SqlSessionTemplate sqlSession, Research research);
}
