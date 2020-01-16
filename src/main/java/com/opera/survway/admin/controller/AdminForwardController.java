package com.opera.survway.admin.controller;

import javax.xml.ws.RequestWrapper;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminForwardController {

	@RequestMapping("researchApprovalWaitList.admin")
	public String forwardResearchApprovalWaitList() {
		return "adminResearch/researchApprovalWaitList";
	}
	
	@RequestMapping("adminMain.admin")
	public String forwardMain() {
		return "common/adminMain";
	}
	
	//반려
	@RequestMapping("researchReferList.admin")
	public String forwardResearchReferList() {
		return "adminResearch/researchReferList";
	}
	//협의중
	@RequestMapping("researchWaitingPayment.admin")
	public String forwardResearchWaitingPayment() {
		return "adminResearch/researchWaitingPayment";
	}
	//협의완료
	@RequestMapping("researchConsultationCompleted.admin")
	public String forwardresearchConsultationCompleted() {
		return"adminResearch/researchConsultationCompleted";
	}
	
	
	//서베이 문항 재구성 대기문항
	@RequestMapping("serveyReconstructionList.admin")
		public String forwardserveyReconstructionList() {
			return "adminResearch/serveyReconstructionList";
		}
	
	
	//단체 메일링 대기 목록
	@RequestMapping("groupMailingWaitingList.admin")
		public String forwardgroupMailingWaitingList() {
		return "adminResearch/groupMailingWaitingList";
	}

	//폐기응답목록
	@RequestMapping("disposalResponseManagement.admin")
		public String forwarddisposalResponseManagement() {
		return "adminResearch/disposalResponseManagement";
	}
	//불량응답목록
	@RequestMapping("poorResponseList.admin")
	public String forwardPoorResponseList() {
		return "adminResearch/poorResponseList";
	}
	
	//불량응답이의신청관리
	@RequestMapping("applicationForDefectiveResponse")
		public String forwardapplicationForDefectiveResponse() {
		return "adminResearch/applicationForDefectiveResponse";
	}
	//리서치 보고서 작성 대기 목록-통계처리
	@RequestMapping("researchReportStandbyList")
		public String forwardresearchReportStandbyList() {
			return "adminResearch/researchReportStandbyList";
	}
	
	//완료된 리서치 목록
	@RequestMapping("researchCompletedProcessingList")
		public String forwardresearchCompletedProcessingList() {
			return "adminResearch/researchCompletedProcessingList";
	}
	
	//ts질문관리
	@RequestMapping("tsQaManagement")
		public String forwardtsQaManagement() {
			return "adminResearch/tsQaManagement";
	}
		}
