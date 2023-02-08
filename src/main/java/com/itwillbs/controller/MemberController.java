package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;

@Controller
public class MemberController {
	
	@Inject
	private MemberService memberService;

	@RequestMapping(value = "/member/insert", method = RequestMethod.GET)
	public String insert() {
		return "member/join"; // 폴더명/파일이름
	} // insert 메서드
	
	@RequestMapping(value = "/member/insertPro", method = RequestMethod.POST)
	public String insertPro(MemberDTO memberDTO) {
		memberService.insertMember(memberDTO);
		return "redirect:/member/login";
	} // insertPro 메서드
	
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login() {
		return "member/login"; 
	} 
	
	@RequestMapping(value = "/member/loginPro", method = RequestMethod.POST)
	public String loginPro(MemberDTO memberDTO, HttpSession session) {
		MemberDTO memberDTO2=memberService.userCheck(memberDTO);
		if(memberDTO2!=null) {
			session.setAttribute("id", memberDTO2.getId());
			return "redirect:/main/main";
		} else {
			return"member/msg";
		}
	}
	
	@RequestMapping(value = "/main/main", method = RequestMethod.GET)
	public String main() {
		return "main/main";
	} 
	
	@RequestMapping(value = "/main/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main/main";
	} 
	
	@RequestMapping(value = "/member/update", method = RequestMethod.GET)
	public String update(HttpSession session, Model model) {
		String id=(String)session.getAttribute("id");
		MemberDTO memberDTO=memberService.getMember(id);
		model.addAttribute("memberDTO", memberDTO);
		return "/member/update"; 
	}
	
	@RequestMapping(value = "/member/updatePro", method = RequestMethod.POST)
	public String updatePro(MemberDTO memberDTO) {
		System.out.println("Membercontroller updatePro()");
		
		MemberDTO memberDTO2=memberService.userCheck(memberDTO);
		if(memberDTO2!=null) {
			memberService.updateMember(memberDTO);
			return "redirect:/main/main";
		} else {
			return "member/msg";
		}
			
	} // updatePro 메서드
	
}
