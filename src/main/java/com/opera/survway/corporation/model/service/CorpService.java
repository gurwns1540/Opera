package com.opera.survway.corporation.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.opera.survway.admin.model.exception.ResearchException;
import com.opera.survway.corporation.model.vo.Research;
import com.opera.survway.common.model.vo.ResearchState;
import com.opera.survway.common.model.vo.UploadFile;
import com.opera.survway.corporation.model.vo.CorpMember;
import com.opera.survway.corporation.model.vo.Payment;
import com.opera.survway.corporation.model.vo.ResearchQuestion;
import com.opera.survway.corporation.model.vo.SearchResearch;
import com.opera.survway.exception.LoginException;
import com.opera.survway.exception.SelectException;

@Service
public interface CorpService {

	CorpMember loginMember(CorpMember cm) throws LoginException;

	int insertCorp(CorpMember cm) throws LoginException;

	void insertResearch(Research research, ArrayList<ResearchQuestion> questionList, ArrayList<UploadFile> uploadFiles) throws ResearchException;

	List<Research> previousResearch(SearchResearch searchResearch) throws SelectException;

	int getListCountResearch(SearchResearch searchResearch) throws SelectException;

	Research previousResearchDetail(int researchNo) throws SelectException;

	int getQuestionCount(int researchNo);

	boolean priceConference(ResearchState researchstate);

	boolean researchPayment(Payment payment);
}
