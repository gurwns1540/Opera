package com.opera.survway.corporation.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.opera.survway.admin.model.service.AdminService;
import com.opera.survway.admin.model.vo.Research;
import com.opera.survway.common.model.vo.OperaFileNamePolicy;
import com.opera.survway.common.model.vo.UploadFile;
import com.opera.survway.corporation.model.vo.ResearchChoice;
import com.opera.survway.corporation.model.vo.ResearchQuestion;

@Controller
public class CorpResearchController {
	@Autowired
	private AdminService as;
	
	@PostMapping("requestResearch.corpResearch")
	public String requestResearch(Research research, String targetAgeRangeAmount, String mno, String companyNo, String startDate, String endDate, Model model) {
		
		research.setResearchPeriod(startDate + "/" + endDate);
		research.setMno(Integer.parseInt(companyNo));
		
		if(research.getTargetAgeRange().equals("config")) {
			research.setTargetAgeRange(targetAgeRangeAmount);
		}
		if(research.getAdditionaltEtc().equals("")) {
			research.setAdditionaltEtc(null);
		}
		
		model.addAttribute("research", research);
		return "writeQuestion";
	}
	
	@PostMapping("insertResearch.corpResearch")
	public String insertResearch(HttpServletRequest request, Research research, String[] questionFormNo, String[] rquestionContext, MultipartFile[] uploadImage, @RequestParam("imageChoiceUpload") MultipartFile[] imageChoiceUpload, String[] mediaExist, String[] questionVideoLink, String[] mediaExplain, String[] questionOrder, String[] choiceContext, String[] choiceNo) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		System.out.println(root);
		
		ArrayList<String> saveFiles = new ArrayList<>();
		ArrayList<String> originFiles = new ArrayList<>();
		ArrayList<String> exts = new ArrayList<>();
		
		for(int i = 0; i < choiceNo.length; i++) {
			System.out.println(choiceNo[i]);
		}
		
 		for(MultipartFile file : uploadImage) {
 			String saveFile = OperaFileNamePolicy.getRandomString();
 			String originFileName = file.getOriginalFilename();
 			String ext = originFileName.substring(originFileName.lastIndexOf("."));
			saveFiles.add(saveFile);
			originFiles.add(originFileName);
			exts.add(ext);
//			try {
//				file.transferTo(new File(savePath + "\\" + saveFile + ext));
//			} catch (IllegalStateException | IOException e) {
//				e.printStackTrace();
//			}
		}
 		int uploadFileIndex = 0;
 		int uploadChoiceFileIndex = 0;
 		
 		ArrayList<UploadFile> uploadFiles = new ArrayList<>();
 		
		int mediaIndex = 0;
		int videoIndex = 0;
		int choiceIndex = 0;
		
		ArrayList<ResearchQuestion> questionList = new ArrayList<>();
		
		for(int i = 0; i < questionOrder.length; i++) {
			ArrayList<ResearchChoice> choiceList = new ArrayList<>();
			
			ResearchQuestion researchQuestion = new ResearchQuestion();
			researchQuestion.setRquestionContext(rquestionContext[i]);
			researchQuestion.setQuestionOrder(Integer.parseInt(questionOrder[i]));
			researchQuestion.setQuestionFormNo(Integer.parseInt(questionFormNo[i]));
			researchQuestion.setMediaExist(mediaExist[i]);
			if(!mediaExist[i].equals("false")) {
				researchQuestion.setMediaExplain(mediaExplain[mediaIndex++]);
				if(mediaExist[i].equals("image")) {
					
					UploadFile uploadfile = new UploadFile();
					uploadfile.setFilePath(savePath);
					uploadfile.setOriginName(originFiles.get(uploadFileIndex));
					uploadfile.setChangeName(saveFiles.get(uploadFileIndex++));
					uploadfile.setFileType("리서치 문항");
					uploadfile.setRquestionNo(Integer.parseInt(questionOrder[i])); //나중에 select키로 문항에 대한 시퀀스 가져와야함
					uploadFiles.add(uploadfile);
					
				}else if(mediaExist[i].equals("video")) {
					researchQuestion.setQuestionVideoLink(questionVideoLink[videoIndex++]);
				}
			}
			if(Integer.parseInt(questionFormNo[i]) != 2 && Integer.parseInt(questionFormNo[i]) != 4){
				System.out.println("Integer.parseInt(questionFormNo[i]) : " + Integer.parseInt(questionFormNo[i]));
				for(int j = choiceIndex; j < choiceNo.length; j++) {
					ResearchChoice researchChoice = new ResearchChoice();
					researchChoice.setChoiceOrder(Integer.parseInt(choiceNo[j]));
					researchChoice.setChoiceContext(choiceContext[j]);
					//System.out.println(researchChoice);
					choiceList.add(researchChoice);
					if(j != choiceNo.length - 1) {
						if(Integer.parseInt(choiceNo[j + 1]) == 1) {
							choiceIndex = j + 1;
							break;
						}
					}
				}
			}
			researchQuestion.setRequestChoiceList(choiceList);
			questionList.add(researchQuestion);
		}
		System.out.println(questionList);
		System.out.println(uploadFiles);
		
		return "";
	}
}
