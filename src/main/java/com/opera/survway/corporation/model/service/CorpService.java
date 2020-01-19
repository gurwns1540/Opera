package com.opera.survway.corporation.model.service;

import org.springframework.stereotype.Service;

import com.opera.survway.corporation.model.vo.CorpMember;
import com.opera.survway.exception.LoginException;

@Service
public interface CorpService {

	CorpMember loginMember(CorpMember cm) throws LoginException;

}
