package com.opera.survway.corporation.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.opera.survway.admin.model.exception.ResearchException;
import com.opera.survway.admin.model.vo.Research;
import com.opera.survway.common.model.vo.UploadFile;
import com.opera.survway.corporation.model.dao.CorpDao;
import com.opera.survway.corporation.model.vo.CorpMember;
import com.opera.survway.corporation.model.vo.ResearchChoice;
import com.opera.survway.corporation.model.vo.ResearchQuestion;
import com.opera.survway.exception.LoginException;

@Service
public class CorpServiceImpl implements CorpService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CorpDao cd;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private DataSourceTransactionManager transactionmanager;
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 23.
	 * @ModifyDate  : 2020. 1. 23.
	 * @Description : 기업 로그인
	 */
	@Override
	public CorpMember loginMember(CorpMember cm) throws LoginException {
		
		CorpMember loginUser = null;
		String encPassword = cd.selectEncPassword(sqlSession, cm);
		
		if(passwordEncoder.matches(cm.getUserPwd(), encPassword)) {
			loginUser = cd.loginCheck(sqlSession, cm);
		}else {
			throw new LoginException("기업 로그인 실패");
		}
		
		return loginUser;
	}
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 23.
	 * @ModifyDate  : 2020. 1. 23.
	 * @Description : 기업 회원가입
	 */
	@Override
	public int insertCorp(CorpMember cm) throws LoginException {

		int resultMemberTable = cd.insertMemberTable(sqlSession, cm);
		int resultCorpTable = 0;
		if(resultMemberTable > 0) {
			resultCorpTable = cd.insertCorpTable(sqlSession, cm);
			cd.insertTermsCorp(sqlSession, cm);
		}
		
		if(!(resultMemberTable > 0 && resultCorpTable > 0)) {
			throw new LoginException("회원가입 실패!");
		}else {
			return 0;
		}
		
	}
	
	/**
	 * @throws ResearchException 
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 29.
	 * @ModifyDate  : 2020. 1. 29.
	 * @Description : 기업 리서치 정보 문항 작성
	 */
	@Override
	public void insertResearch(Research research, ArrayList<ResearchQuestion> questionList,
			ArrayList<UploadFile> uploadFiles) throws ResearchException {
		int result = 0;
		int result1 = cd.insertResearch(sqlSession, research);
		if(result1 > 0 ) {
			int result2 = cd.insertTarger(sqlSession, research);
			for(int i = 0; i < questionList.size(); i++) {
				questionList.get(i).setResearchNo(research.getResearchNo());
			}
			int result3 = 0;
			for(int i = 0; i < questionList.size(); i++) {
				result3 += cd.insertQuestion(sqlSession, questionList.get(i));
			}
			if(result3 == questionList.size()) {
				for(int i = 0; i < questionList.size(); i++) {
					for(int j = 0; j < questionList.get(i).getRequestChoiceList().size(); j++) {
						questionList.get(i).getRequestChoiceList().get(j).setRquestionNo(questionList.get(i).getQuestionNo());
					}
				}
				ArrayList<ResearchChoice> choiceList = new ArrayList<>();
				for(int i = 0; i < questionList.size(); i++) {
					for(int j = 0; j < questionList.get(i).getRequestChoiceList().size(); j++) {
						choiceList.add(questionList.get(i).getRequestChoiceList().get(j));
					}
				}
				int result4 = 0;
				for(int i = 0; i < choiceList.size(); i++) {
					result4 += cd.insertChoice(sqlSession, choiceList.get(i));
				}
				if(result4 == choiceList.size()) {
					for(int i = 0; i < uploadFiles.size(); i++) {
						for(int j = 0; j < questionList.size(); j++) {
							if(uploadFiles.get(i).getRquestionNo() == questionList.get(j).getQuestionOrder()) {
								uploadFiles.get(i).setResearchNo(questionList.get(j).getResearchNo());
							}
						}
						for(int j = 0; j < choiceList.size(); j++) {
							if(uploadFiles.get(i).getRchoiceNo() == choiceList.get(j).getChoiceOrder()) {
								uploadFiles.get(i).setRchoiceNo(choiceList.get(j).getChoiceNo());
							}
						}
					}
					int result5 = 0;
					for(int i = 0; i < uploadFiles.size(); i++) {
						result5 += cd.insertImage(sqlSession, uploadFiles.get(i));
					}
					if(result5 == uploadFiles.size()) {
						int result6 = cd.insertResearchState(sqlSession, research);
						if(result6 > 0) {
							result = 1;
						}
					}
				}
			}
		}
		
		if(!(result > 0)){
			throw new ResearchException("리서치 작성 오류");
		}
	}

}

