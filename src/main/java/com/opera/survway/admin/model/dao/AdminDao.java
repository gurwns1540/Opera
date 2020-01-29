package com.opera.survway.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.opera.survway.admin.model.vo.PanelRewardHistory;
import com.opera.survway.admin.model.vo.Research;
import com.opera.survway.admin.model.vo.SearchMember;
import com.opera.survway.common.model.vo.AllMember;
import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.common.model.vo.UploadFile;
import com.opera.survway.corporation.model.vo.ResearchChoice;
import com.opera.survway.corporation.model.vo.ResearchQuestion;
import com.opera.survway.panel.model.vo.PanelMember;

public interface AdminDao {

	List<AllMember> memberInfoManagement(SqlSessionTemplate sqlSession, SearchMember searchMember);

	int getListCountPanel(SqlSessionTemplate sqlSession, SearchMember searchMember);

	AllMember selectMember(SqlSessionTemplate sqlSession, int mno);

	int getListCountPanelCashoutApplicant(SqlSessionTemplate sqlSession);

	List<PanelRewardHistory> panelCashoutApplication(SqlSessionTemplate sqlSession, PageInfo pi);

	int cashoutPeople(SqlSessionTemplate sqlSession, List<String> cnoArr);

	int getListCountManageCashoutComplete(SqlSessionTemplate sqlSession);

	List<PanelRewardHistory> manageCashoutComplete(SqlSessionTemplate sqlSession, PageInfo pi);

}
