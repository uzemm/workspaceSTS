package com.kh.shop.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.shop.service.CartService;
import com.kh.shop.vo.CartVO;
import com.kh.shop.vo.MemberVO;

@Controller
@RequestMapping("/cart")
public class CartController {
	@Resource(name = "cartService")
	private CartService cartService;
	
	//장바구니에 상품 등록
	//커맨드객체는 자동으로 jsp로 데이터를 가져간다.
	@PostMapping("/insertCart")
	public String insertCart(CartVO cartVO, HttpSession session) {
		String loginId = ((MemberVO)(session.getAttribute("loginInfo"))).getMemId();
		cartVO.setMemId(loginId);
		cartService.insertCart(cartVO);
		
		return "cart/insert_result";
	}
	
	//장바구니 목록 페이지
	@GetMapping("/cartList")
	public String cartList() {
		return "cart/cart_list";
	}
}
