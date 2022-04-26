package com.kh.library.book.controller;

import java.io.IOException;
import java.io.File;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.library.admin.service.BookAdminService;
import com.kh.library.book.service.BookService;
import com.kh.library.book.vo.BookImgVO;
import com.kh.library.book.vo.BookVO;
import com.kh.library.book.vo.HopeBookVO;

@Controller
@RequestMapping("/book")
public class BookController {
	
	@Resource(name="bookService")
	private BookService bookService;
	

	@Resource(name = "bookAdminService")
	private BookAdminService bookAdminService;
	
	@GetMapping("/list")
	public String firstList() {
		return "book/list";
	}
	
	//책 등록페이지
	@GetMapping("/regBookForm")
	public String regBookForm(Model model) {
			model.addAttribute("cateList",bookService.selectBookCategory());
			return "book/reg_book";
	}
	
	// 책 등록 
		@PostMapping("/regBook")
		public String regBook(BookVO bookVO, MultipartHttpServletRequest multi) {
			
			  //이미지 저장 공간
		      String nextBookCode = bookAdminService.selectNextBookCode();
		      int nextBookImgCode = bookAdminService.selectNextBookImgCode();
		      
		      bookVO.setBookCode(nextBookCode);
		      
		      MultipartFile file = multi.getFile("file");
		      if(!file.getOriginalFilename().equals("")) {
		    	  String uploadPath = "D:\\git\\spring-study\\LIBRARY\\src\\main\\webapp\\resources\\images\\book\\";
		    	  
		    	  try {
		    		  
		    		  String bkOriginName = file.getOriginalFilename();
		    		  String bkAtName = System.currentTimeMillis()+"_"+file.getOriginalFilename();
		    		  file.transferTo(new File(uploadPath+bkAtName));
		    		  BookImgVO vo = new BookImgVO();
		    		  vo.setBkImgCode(nextBookImgCode++);
		    		  vo.setBkOriginName(bkOriginName);
		    		  vo.setBkAtName(bkAtName);
		    		  vo.setBookCode(bookVO.getBookCode());
		    		  
		    		  //책 insert
		    		  bookVO.setBkImg(bkAtName);
				      bookAdminService.insertBook(bookVO, vo);
				      
		    			  } catch(IllegalStateException e) {
		    				  e.printStackTrace();
		    			  } catch(IOException e) {
		    				  e.printStackTrace();
		    			  }
		    		  }
		    	
		   
		      
			return "redirect:/book/bookList";
		
		}
	
	//전체도서 목록 페이지
	@GetMapping("/bookList")
	public String bookList(Model model) {
		//도서 목록 조회
		model.addAttribute("bookList", bookService.selectBookList());
		
		return "book/book_list";
	}
	
	//도서 검색
	@RequestMapping("/searchBook")
	public String searchBook(BookVO bookVO, Model model) {
		
		model.addAttribute("searchList", bookService.selectSearchList(bookVO));		
   
		return "book/search_book";
	}
	//도서 상세보기
	@GetMapping("/bookDetail")
	public String bookDetail(Model model, BookVO bookVO) {
		model.addAttribute("bookDetail", bookService.selectBookDetail(bookVO));
		
		return "book/book_detail";
	}
	
	//도서 추천
	@GetMapping("/rcdBook")
	public String rcdBook(Model model, BookVO bookVO) {
		bookService.updateRcdCnt(bookVO);
		model.addAttribute("bookDetail", bookService.selectBookDetail(bookVO));
		
		return "book/book_detail";
	}
	
	//추천도서 랭킹
	@GetMapping("/selectRcdBook")
	public String selectRcdBook(Model model) {
		model.addAttribute("bookList", bookService.selectRcdBook());
		
		return "manage/home";
	}
	//희망도서 신청 폼 
	@GetMapping("/hopeBookForm")
	public String hopeBookForm() {
		
		return "book/reg_hope_book";
	}
	
	//희망도서  등록
	@PostMapping("/regHopeBook")
	public String regHopeBook(Model model, HopeBookVO hbVO) {
		bookService.insertHopeBook(hbVO);
		return "book/fin_hope_book";
	}

}
