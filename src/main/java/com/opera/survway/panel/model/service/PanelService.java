package com.opera.survway.panel.model.service;

import org.springframework.stereotype.Service;

import com.opera.survway.exception.LoginException;
import com.opera.survway.panel.model.vo.PanelMember;

@Service
public interface PanelService {

	PanelMember loginMember(PanelMember pm) throws LoginException;

}
