package com.opera.survway.panel.model.service;



import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.opera.survway.common.model.vo.PageInfo;
import com.opera.survway.exception.InquiryException;
import com.opera.survway.exception.LoginException;
import com.opera.survway.exception.SelectException;
import com.opera.survway.panel.model.dao.PanelDao;
import com.opera.survway.panel.model.vo.Inquiry;
import com.opera.survway.panel.model.vo.Notice;
import com.opera.survway.panel.model.vo.PanelMember;
import com.opera.survway.panel.model.vo.SearchNotice;


@Service
public class PanelServiceImpl implements PanelService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private PanelDao pd;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private DataSourceTransactionManager transactionmanager;
	
	/**
	 * @Author      : Oh
	 * @CreateDate  : 2020-01-19
	 * @ModifyDate  : 2020-01-21
	 * @Description : 로그인 기능
	 */
	@Override
	public PanelMember loginMember(PanelMember pm) throws LoginException {
		
		PanelMember loginUser = null;
		
		String encPassword = pd.selectEncPassword(sqlSession, pm);
		if(passwordEncoder.matches(pm.getUserPwd(), encPassword)) {
			loginUser = pd.loginCheck(sqlSession, pm);
		}else {
			throw new LoginException("loginFail");
		}
		
		return loginUser;
	}

	/**
	 * @Author      : Oh
	 * @CreateDate  : 2020-01-19
	 * @ModifyDate  : 2020-01-21
	 * @Description : 회원가입 기능
	 */
	@Override
	public int insertMember(PanelMember pm) throws LoginException {
		
		int resultMemberTable=0;
		int resultPanelTable=0;
		
		resultMemberTable = pd.insertMemberTable(sqlSession, pm);
		if(resultMemberTable > 0) {
			int mno = pd.selectMno(sqlSession, pm);
			pm.setMno(mno);
			resultPanelTable = pd.insertPanelTable(sqlSession, pm);
			if(resultPanelTable > 0) {
				pd.insertTermsPanel(sqlSession, pm);
				pd.insertRewardPanel(sqlSession, pm);
				pd.insertTernaryPanel(sqlSession, pm);
			}
		}
		
		if(!(resultMemberTable>0 && resultPanelTable>0)) {
			throw new LoginException("회원가입 실패!");
		}else {
			return 0;
		}
	}

	/**
	 * @throws InquiryException 
	 * @Author	:hansol
	 * @CreateDate	:2020. 1. 22.
	 * @ModifyDate	:2020. 1. 22.
	 * @Description	: 1:1문의 등록
	 */
	@Override
	public int insertInquiry(Inquiry i) throws InquiryException {
		int result =0;
		
		result=pd.insertInquiry(sqlSession, i);
		
		if(!(result >0)) {
			throw new InquiryException("1:1문의 등록 실패");
		}
		
		return result;
	}

	/**
	 * @throws InquiryException 
	 * @Author	:hansol
	 * @CreateDate	:2020. 1. 23.
	 * @ModifyDate	:2020. 1. 23.
	 * @Description	:1:1문의  조회
	 */
	@Override
	public List<Inquiry> selectAllMyInquiry(Inquiry i) throws InquiryException {
		
		List<Inquiry> list = pd.selectAllMyInquiry(sqlSession, i); 
		
		if(list == null) {
			throw new InquiryException("1:1문의 목록 조회 실패");
		}
		
		return list;
	}

	/**
	 * @throws InquiryException 
	 * @Author	:hansol
	 * @CreateDate	:2020. 1. 24.
	 * @ModifyDate	:2020. 1. 24.
	 * @Description	:1:1문의 개수
	 */
	@Override
	public int getListCountInquiry(Inquiry iq) throws InquiryException {
		
		int listCount = pd.getListCountInquiry(sqlSession, iq);
		
		if(listCount <=0) {
			throw new InquiryException("1:1문의수 조회 실패");
		}
		return listCount;
	}
	/**
	 * @Author      : yhj
	 * @CreateDate  : 2020. 1. 22.
	 * @ModifyDate  : 2020. 1. 22.
	 * @Description : 회원정보수정(비밀번호X)
	 */
	@Override
	public int updateMemberInfo(PanelMember pm) {
		
		return pd.updateMemberInfo(sqlSession, pm);
	}

	/**
	 * @Author      : yhj
	 * @CreateDate  : 2020. 1. 24.
	 * @ModifyDate  : 2020. 1. 24.
	 * @Description : 회원정보수정(비밀번호)
	 */
	@Override
	public int updatePassword(PanelMember pm) {
		return pd.updatePassword(sqlSession, pm);
	}

	/**
	 * @Author      : yhj
	 * @CreateDate  : 2020. 1. 26.
	 * @ModifyDate  : 2020. 1. 26.
	 * @Description : 회원탈퇴
	 */
	@Override
	public int updateLeaveMember(PanelMember pm) {
		return pd.updateLeaveMember(sqlSession, pm);
	}


	/**
	 * @throws SelectException 
	 * @Author      : hjheo
	 * @CreateDate  : 2020. 1. 27.
	 * @ModifyDate  : 2020. 1. 27.
	 * @Description : 공지사항 수 조회 
	 */
	@Override
	public int getNoticeListCount(SearchNotice searchNotice) throws SelectException {
		int listCount=0;
		listCount = pd.getNoticeListCount(sqlSession,searchNotice);
		
		if(listCount<0) {
			throw new SelectException("공지사항 수 조회 실패");
		}
		return listCount;
	}

	@Override
	public List<Notice> selectNoticeList(SearchNotice searchNotice) throws SelectException {
		List<Notice> noticeList =null;
		
		noticeList = pd.selectNoticeList(sqlSession, searchNotice);
		 
		if(noticeList == null) {
			throw new SelectException("공지사항 조회 실패");
		}
		return noticeList;
	}
}
