package com.opera.survway.common.model.service;

public interface CommonService {

	boolean duplicationIdCheck(String userId);

	boolean duplicationEmailCheck(String userEmail);

	int certificationMember(String userId);

	boolean checkPasswordModal(String userId, String ajaxPwd);

}
