package com.opera.survway.corporation.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.opera.survway.admin.model.exception.ResearchException;
import com.opera.survway.corporation.model.vo.Research;
import com.opera.survway.common.model.vo.UploadFile;
import com.opera.survway.corporation.model.vo.CorpMember;
import com.opera.survway.corporation.model.vo.ResearchQuestion;
import com.opera.survway.exception.LoginException;

@Service
public interface CorpService {

	CorpMember loginMember(CorpMember cm) throws LoginException;

	int insertCorp(CorpMember cm) throws LoginException;

	void insertResearch(Research research, ArrayList<ResearchQuestion> questionList, ArrayList<UploadFile> uploadFiles) throws ResearchException;
}
