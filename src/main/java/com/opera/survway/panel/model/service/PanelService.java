package com.opera.survway.panel.model.service;

import java.util.List;

import com.opera.survway.exception.LoginException;
import com.opera.survway.panel.model.vo.Inquiry;
import com.opera.survway.panel.model.vo.PanelMember;

public interface PanelService {

	PanelMember loginMember(PanelMember pm) throws LoginException;

	int insertMember(PanelMember pm) throws LoginException;

	int insertInquiry(Inquiry i);

	List<Object> selectAllMyInquiry(PanelMember pm);

	int updateMemberInfo(PanelMember pm);

	int updatePassword(PanelMember pm);

}
