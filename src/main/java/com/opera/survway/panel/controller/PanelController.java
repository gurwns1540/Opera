package com.opera.survway.panel.controller;

import java.util.List;
import java.io.File;
import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.opera.survway.common.model.vo.GenerateCertPassword;
import com.opera.survway.exception.LoginException;
import com.opera.survway.panel.model.service.PanelService;
import com.opera.survway.panel.model.vo.Inquiry;
import com.opera.survway.panel.model.vo.PanelMember;

@SessionAttributes("loginUser")
@Controller
public class PanelController {
	
	@Autowired
	private PanelService ps;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private JavaMailSender mailSender; // Mail Sender
	
	/**
	 * @Author      : Ungken
	 * @CreateDate  : 2020. 1. 22.
	 * @ModifyDate  : 2020. 1. 22.
	 * @Description : 패널 회원가입
	 */
	@PostMapping("panelSignup.me")
	public String insertPanelMember(Model model, PanelMember pm, HttpServletRequest request) {
		InetAddress inet;
		String svrIp = "";
		try {
			inet = InetAddress.getLocalHost();
			svrIp = inet.getHostAddress();
		} catch (UnknownHostException e1) {
			e1.printStackTrace();
		}
		
		String referCode = new GenerateCertPassword().excuteGenerate();
		
		pm.setReferPanelCode(referCode);
		
		String encPassword =passwordEncoder.encode(pm.getUserPwd());
	    pm.setUserPwd(encPassword);
		
		try {
			ps.insertMember(pm);
			
			/*메일 전송 부분 시작*/
			String setfrom = "yychani94@gmail.com";         
		    String tomail  = pm.getUserEmail();     // 받는 사람 이메일
		    String title   = "Survway 정회원 인증메일입니다.";      // 제목
		    String content = "<form action='http://" + svrIp + ":8001/survway/signupCertification.me' method='post'> <p> 서브웨이 리서치에 가입해 주신 것을 진심으로 감사드립니다.<br> 아래의 버튼을 클릭하시면 정회원 인증이 되어 설문조사에 참여를 하실 수 있습니다. </p> <input type='hidden' name='userId' value='" + pm.getUserId() + "'><button type='submit' style='width: 370px; cursor: pointer; height: 70px; border: 0;  background: #00679A; color: white; font-size: 20pt; margin-top: 10px;'>정회원 인증하기</button> </form>";    // 내용
		   
		    try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				 
				messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
				messageHelper.setTo(tomail);     // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content);  // 메일 내용
 
				String contents = "<img src=\"cid:logo\" style='width: 420px;'>" + content; 
				messageHelper.setText(contents, true); 
				
				FileSystemResource file = new FileSystemResource(new File("C:\\images\\survwayLogo.png")); 
				messageHelper.addInline("logo", file);

				mailSender.send(message);
		    } catch(Exception e){
		      System.out.println(e);
		    }
			/*메일 전송 부분 끝*/
			
			return "redirect:panelSignup3.panel";
		} catch (LoginException e) {
			request.setAttribute("msg", e.getMessage());
			
			return "panelLogin.panel";
		}
	}
	
	//1:1문의 등록
	@PostMapping("inquirywrite.panel")
	public String insertPanelInquiry(Model model,Inquiry i) {
		
		System.out.println(i.toString());
		
		int result = ps.insertInquiry(i);
		
		model.addAttribute("success",result);
		
		return "customerCenter/panelInquiryList";
	}
	
	//1:1문의 리스트 보기
	@GetMapping("panelInquiryList.panel")
	public String showMyInquiryList(Model model, PanelMember pm) {
		
		//System.out.println("1");
		List list = (List) ps.selectAllMyInquiry(pm);
		
		System.out.println("listSize"+list.size());
		
		for(int i=0; i<list.size(); i++) {
			
			System.out.println("controller"+list.get(i).toString());
			
		}
		
		model.addAttribute("list",list);
		
		return "customerCenter/panelInquiryList";
	}
	
}












































