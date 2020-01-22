package com.opera.survway.common.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

public interface CommonDao {

	boolean duplicationIdCheck(SqlSessionTemplate sqlSession, String userId);

	boolean duplicationEmailCheck(SqlSessionTemplate sqlSession, String userEmail);

	int certificationMember(SqlSessionTemplate sqlSession, String userId);

}
