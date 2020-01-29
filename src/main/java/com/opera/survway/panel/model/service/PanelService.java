package com.opera.survway.panel.model.service;

import java.util.List;
import com.opera.survway.exception.InquiryException;
import com.opera.survway.exception.LoginException;
import com.opera.survway.exception.RewardException;
import com.opera.survway.panel.model.vo.Inquiry;
import com.opera.survway.panel.model.vo.PanelMember;
import com.opera.survway.panel.model.vo.Reward;



public interface PanelService {

	PanelMember loginMember(PanelMember pm) throws LoginException;

	int insertMember(PanelMember pm) throws LoginException;

	int insertInquiry(Inquiry i) throws InquiryException;

	List<Inquiry> selectAllMyInquiry(Inquiry i) throws InquiryException;

	int getListCountInquiry(Inquiry iq) throws InquiryException;

	

	int updateMemberInfo(PanelMember pm);

	int updatePassword(PanelMember pm);

	List<Reward> showMyRewardDetailSaved(Reward rd) throws RewardException;

	int getListCountRewardSaved(Reward rd) throws RewardException;

	List<Reward> showRewardDetailUsed(Reward r) throws RewardException;

	int getListCountRewardUsed(Reward r) throws RewardException;

}
