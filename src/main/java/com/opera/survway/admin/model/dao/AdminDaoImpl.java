package com.opera.survway.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.opera.survway.admin.model.vo.PanelRewardHistory;
import com.opera.survway.admin.model.vo.SearchMember;
import com.opera.survway.common.model.vo.AllMember;
import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.common.model.vo.UploadFile;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Override
	public int getListCountPanel(SqlSessionTemplate sqlSession, SearchMember searchMember) {
		int listCount = 0;
		
		listCount = sqlSession.selectOne("Admin.getListCountPanel", searchMember);
		
		return listCount;
	}
	
	@Override
	public List<AllMember> memberInfoManagement(SqlSessionTemplate sqlSession, SearchMember searchMember) {
		List<AllMember> memberList = null;
		
		int offset = (searchMember.getPi().getCurrentPage() - 1) * searchMember.getPi().getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, searchMember.getPi().getLimit());
		
		memberList = sqlSession.selectList("Admin.memberInfoManagement", searchMember, rowBounds);
		
		return memberList;
	}

	@Override
	public AllMember selectMember(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("Admin.selectMember", mno);
	}

	@Override
	public int getListCountPanelCashoutApplicant(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Admin.getListCountPanelCashoutApplicant");
	}

	@Override
	public List<PanelRewardHistory> panelCashoutApplication(SqlSessionTemplate sqlSession, PageInfo pi) {
		List<PanelRewardHistory> panelRewardHistoryList = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		panelRewardHistoryList = sqlSession.selectList("Admin.panelCashoutApplication", null, rowBounds);
		
		return panelRewardHistoryList;
	}

	@Override
	public int cashoutPeople(SqlSessionTemplate sqlSession, List<String> list) {
		return sqlSession.update("Admin.cashoutPerson", list);
	}

	@Override
	public int getListCountManageCashoutComplete(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Admin.getListCountManageCashoutComplete");
	}

	@Override
	public List<PanelRewardHistory> manageCashoutComplete(SqlSessionTemplate sqlSession, PageInfo pi) {
		List<PanelRewardHistory> rewardCompleteHistoryList = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		rewardCompleteHistoryList = sqlSession.selectList("Admin.rewardCompleteHistoryList", null, rowBounds);
		
		return rewardCompleteHistoryList;
	}

	@Override
	public int getListCountNewPanel(SqlSessionTemplate sqlSession, SearchMember searchMember) {
		int listCount = 0;
		listCount = sqlSession.selectOne("Admin.getListCountNewPanel", searchMember);
		return listCount;
	}

	@Override
	public List<AllMember> getListNewPanel(SqlSessionTemplate sqlSession, SearchMember searchMember) {
		
		List<AllMember> memberList = null;

		int offset = (searchMember.getPi().getCurrentPage() - 1) * searchMember.getPi().getLimit();

		RowBounds rowBounds = new RowBounds(offset, searchMember.getPi().getLimit());

		memberList = sqlSession.selectList("Admin.selectNewPanelList", searchMember, rowBounds);

		return memberList;
	}

	@Override
	public AllMember getNewPanelDetail(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("Admin.selectOneNewPanel", mno);
	}

	@Override
	public int getListCountArrovalList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Admin.getListCountArrovalList");
	}

	@Override
	public List<Map<String, String>> researchApprovalWaitList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("Admin.researchApprovalWaitList", null, rowBounds);
	}

	@Override
	public List<Map<String, Object>> researchApprovalDetail(SqlSessionTemplate sqlSession, int researchNo) {
		return sqlSession.selectList("Admin.researchApprovalDetail", researchNo);
	}

	@Override
	public UploadFile questionImage(SqlSessionTemplate sqlSession, int questionNo) {
		return sqlSession.selectOne("Admin.questionUploadFiles", questionNo);
	}

	@Override
	public UploadFile choiceImage(SqlSessionTemplate sqlSession, int choiceNo) {
		return sqlSession.selectOne("Admin.choiceUploadFiles", choiceNo);
	}

}
