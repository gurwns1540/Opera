package com.opera.survway.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.opera.survway.common.model.vo.AllMember;
import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.exception.SelectException;
import com.opera.survway.panel.model.vo.PanelMember;

@Service
public interface AdminService {
	List<AllMember> memberInfoManagement(PageInfo pi) throws SelectException;

	int getListCountPanel() throws SelectException;

	AllMember selectMember(int mno) throws SelectException;
}
