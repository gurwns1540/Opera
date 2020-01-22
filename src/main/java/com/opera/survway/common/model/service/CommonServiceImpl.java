package com.opera.survway.common.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.opera.survway.common.model.dao.CommonDao;

@Service
public class CommonServiceImpl implements CommonService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CommonDao cd;
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 21.
	 * @ModifyDate  : 2020. 1. 21.
	 * @Description : 아이디 중복확인 기능
	 */
	@Override
	public boolean duplicationIdCheck(String userId) {
		return cd.duplicationIdCheck(sqlSession, userId);
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 21.
	 * @ModifyDate  : 2020. 1. 21.
	 * @Description : 이메일 중복확인 기능
	 */
	@Override
	public boolean duplicationEmailCheck(String userEmail) {
		return cd.duplicationEmailCheck(sqlSession, userEmail);
	}

	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 22.
	 * @ModifyDate  : 2020. 1. 22.
	 * @Description : 정회원 인증 기능
	 */
	@Override
	public int certificationMember(String userId) {
		return cd.certificationMember(sqlSession, userId);
	}

}
