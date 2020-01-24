package com.opera.survway.admin.controller;

import javax.xml.ws.RequestWrapper;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminForwardController {
	@RequestMapping("adminMain.admin")
	public String forwardMain() {
		return "common/adminMain";
	}
	
	// 신규 패널 관리
	@RequestMapping("newPanelManagement.admin")
	public String forwardNewPanelManagement() {
		return "memberManagement/newPanelManagement";
	}
	
	// 리서치 승인 대기중
	@RequestMapping("researchApprovalWaitList.admin")
	public String forwardResearchApprovalWaitList() {
		return "adminResearch/researchApprovalWaitList";
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
	public String forwardResearchConsultationCompleted() {
		return"adminResearch/researchConsultationCompleted";
	}
	
	//서베이 문항 재구성 대기문항
	@RequestMapping("serveyReconstructionList.admin")
	public String forwardSurveyReconstructionList() {
		return "adminResearch/surveyReconstructionList";
	}
	
	//단체 메일링 대기 목록
	@RequestMapping("groupMailingWaitingList.admin")
	public String forwardGroupMailingWaitingList() {
		return "adminResearch/groupMailingWaitingList";
	}

	//폐기응답목록
	@RequestMapping("disposalResponseManagement.admin")
	public String forwardDisposalResponseManagement() {
		return "adminResearch/disposalResponseManagement";
	}
	//불량응답목록
	@RequestMapping("poorResponseList.admin")
	public String forwardPoorResponseList() {
		return "adminResearch/poorResponseList";
	}
	
	//불량응답이의신청관리
	@RequestMapping("applicationForDefectiveResponse.admin")
	public String forwardApplicationForDefectiveResponse() {
		return "adminResearch/applicationForDefectiveResponse";
	}
	
	//불량응답이의신청 처리완료
	@RequestMapping("poorResponseComplete.admin")
	public String forwardPoorResponseComplete() {
		return "adminResearch/poorResponseComplete";
	}
	
	//리서치 보고서 작성 대기 목록-통계처리
	@RequestMapping("researchReportStandbyList.admin")
	public String forwardResearchReportStandbyList() {
		return "adminResearch/researchReportStandbyList";
	}
	
	//리서치 보고서 작성 대기 목록-보고서 작성 목록
	@RequestMapping("researchReportWriteList.admin")
	public String forwardResearchReportWriteList() {
		return "adminResearch/researchReportWriteList";
	}

	//리서치 보고서 작성 대기 목록-결과 전송 목록
	@RequestMapping("researchReportSendList.admin")
	public String forwardResearchReportSendList() {
		return "adminResearch/researchReportSendList";
	}
	
	//완료된 리서치 목록
	@RequestMapping("researchCompletedProcessingList.admin")
	public String forwardResearchCompletedProcessingList() {
		return "adminResearch/researchCompletedProcessingList";
	}
	
	//ts질문관리
	@RequestMapping("tsQaManagement.admin")
	public String forwardTsQaManagement() {
		return "adminResearch/tsQaManagement";
	}
	
	// 패널 리워드 완료 목록
	@RequestMapping("manageCashoutComplete.admin")
	public String forwardManageCashoutComplete() {
		return "panelReward/manageCashoutComplete";
	}
	
}
