package com.opera.survway.corporation.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.opera.survway.corporation.model.vo.Research;
import com.opera.survway.common.model.vo.UploadFile;
import com.opera.survway.corporation.model.vo.CorpMember;
import com.opera.survway.corporation.model.vo.ResearchChoice;
import com.opera.survway.corporation.model.vo.ResearchQuestion;
import com.opera.survway.exception.LoginException;

@Repository
public class CorpDaoImpl implements CorpDao {

	@Override
	public CorpMember loginCheck(SqlSessionTemplate sqlSession, CorpMember cm) throws LoginException {
		
		CorpMember loginUser = sqlSession.selectOne("Corp.loginCheck", cm);

		if(loginUser==null) {
			throw new LoginException("로그인 정보가 존재하지 않습니다.");
		}

		return loginUser;
	}

	@Override
	public int insertMemberTable(SqlSessionTemplate sqlSession, CorpMember cm) {
		return sqlSession.insert("Corp.insertMember", cm);
	}

	@Override
	public int insertCorpTable(SqlSessionTemplate sqlSession, CorpMember cm) {
		return sqlSession.insert("Corp.insertCorp", cm);
	}

	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, CorpMember cm) {
		return sqlSession.selectOne("Corp.selectPwd", cm.getUserId());
	}

	@Override
	public int insertTermsCorp(SqlSessionTemplate sqlSession, CorpMember cm) {
		return sqlSession.insert("Corp.insertTermsCorp", cm);
	}

	@Override
	public int insertResearch(SqlSessionTemplate sqlSession, Research research) {
		return sqlSession.insert("Corp.insertResearch", research);
	}

	@Override
	public int insertTarger(SqlSessionTemplate sqlSession, Research research) {
		return sqlSession.insert("Corp.insertTarget", research);
	}
	
	@Override
	public int insertQuestion(SqlSessionTemplate sqlSession, ResearchQuestion question) {
		return sqlSession.insert("Corp.insertQuestion", question);
	}

	@Override
	public int insertChoice(SqlSessionTemplate sqlSession, ResearchChoice choice) {
		return sqlSession.insert("Corp.insertChoice", choice);
	}

	@Override
	public int insertImage(SqlSessionTemplate sqlSession, UploadFile uploadFile) {
		if(uploadFile.getFileType().equals("리서치 문항")) {
			return sqlSession.insert("Corp.insertImage", uploadFile);
		}else if(uploadFile.getFileType().equals("리서치 보기")) {
			return sqlSession.insert("Corp.insertChoiceImage", uploadFile);
		}
		return 0;
	}

	@Override
	public int insertResearchState(SqlSessionTemplate sqlSession, Research research) {
		return sqlSession.insert("Corp.insertResearchState", research);
	}
}
