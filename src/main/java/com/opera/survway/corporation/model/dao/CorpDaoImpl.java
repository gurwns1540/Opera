package com.opera.survway.corporation.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.opera.survway.corporation.model.vo.CorpMember;
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

}
