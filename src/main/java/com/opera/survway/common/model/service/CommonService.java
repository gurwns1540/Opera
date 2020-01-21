package com.opera.survway.common.model.service;

public interface CommonService {

	boolean duplicationIdCheck(String userId);

	boolean duplicationEmailCheck(String userEmail);

}
