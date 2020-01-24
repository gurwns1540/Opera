package com.opera.survway.panel.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.opera.survway.exception.LoginException;
import com.opera.survway.panel.model.vo.Inquiry;
import com.opera.survway.panel.model.vo.PanelMember;

public interface PanelService {

	PanelMember loginMember(PanelMember pm) throws LoginException;

	int insertMember(PanelMember pm) throws LoginException;

	int insertInquiry(Inquiry i);

	List selectAllMyInquiry(Inquiry i);

	List searchInquiryList(String search, int category);

	

}
