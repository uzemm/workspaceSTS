package com.kh.library.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.library.admin.service.ItemAdminService;
import com.kh.library.admin.service.MemberAdminService;
import com.kh.library.admin.vo.MessageVO;
import com.kh.library.book.service.BookAdminService;
import com.kh.library.book.service.BookService;
import com.kh.library.book.vo.ReserveVO;
import com.kh.library.book.vo.BorrowVO;
import com.kh.library.item.service.ItemService;
import com.kh.library.member.vo.MemberVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	  
	   
		
	@Resource(name = "itemAdminService") 
	private ItemAdminService itemAdminService;
		  
	@Resource(name = "itemService") 
	private ItemService itemService;
	
	@Resource(name = "memberAdminService") 
	private MemberAdminService memberAdminService;
	
	@Resource(name="bookService")
	private BookService bookService;
	
		 
	@Resource(name="bookAdminService")
	private BookAdminService bookAdminService;
   
   //메인페이지, 연체일 확인, 연체제한 업데이트
   @GetMapping("/test") 
   public String test() { 
      
      bookAdminService.updateOverdue();
      bookAdminService.clearLimitDate();
       
      return "manage/home"; 
   }
		
   //관리자 메뉴
   @GetMapping("/adminMenu")
	public String goAdminMenu() {
		return "admin/go_menu";
	}

	//도서 예약
	@RequestMapping("/reserveBook")
	public String reserveBook(ReserveVO reserveVO) {
		return "redirect:/admin/reserveList";
	}
	
	//------------------------------회원관리------------------------------//
	//회원관리 페이지
	@RequestMapping("/memberManage")
	public String memberManage(Model model, MemberVO memberVO, HttpServletRequest request, String memId) {
		
		//-----------------페이징 정보 세팅
		//1.전체 데이터의 개수 조회
		int listCnt = memberAdminService.selectAllMemberCount(memberVO);
		memberVO.setTotalCnt(listCnt);
		
		//2.페이징 처리를 위한 세팅 메소드 호출
		memberVO.setPageInfo();
		
		model.addAttribute("memList", memberAdminService.selectMemberList(memberVO));
				
		return "admin/member_list1";
	}
	
	//회원 검색
	@PostMapping("/searchMember")
	public String searchMember(Model model, MemberVO memberVO) {
		model.addAttribute("memList", memberAdminService.selectSearchMember(memberVO));
		return "admin/member_list";
	}
	
	//알림 전송
	@PostMapping("/sendMessage")
	public String sendMessage(MessageVO messageVO) {
		memberAdminService.insertSendMessage(messageVO);
		return "redirect:/admin/memberManage";
	}
	
	//대여정보 
	@GetMapping("/borrowInfo")
	public String borrowInfo(HttpServletRequest request, Model model, BorrowVO borrowVO) {
		String memId = request.getParameter("memId");
		model.addAttribute("borrowList", memberAdminService.selectBorrowBookInfo(memId));
		model.addAttribute("reserveList", memberAdminService.selectReserveBookInfo(memId));
		return "admin/member_borrow_info";
	}
	
	@ResponseBody
	@PostMapping("/sendMsgList")
	public List<MessageVO> sendMsgList(Model model) {
		return memberAdminService.selectSendMessageList();
	}
	
	@ResponseBody
	@PostMapping("/sendMsgDetail")
	public MessageVO sendMsgList(MessageVO messageVO, String msgCode) {
		//String msgCode = messageVO.getMsgCode();
		return memberAdminService.selectSendMessageDetail(msgCode);
	}
	
}
