package com.kh.shop.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.shop.service.BuyService;
import com.kh.shop.service.CartService;
import com.kh.shop.vo.BuyVO;
import com.kh.shop.vo.CartVO;
import com.kh.shop.vo.MemberVO;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/buy")
public class BuyController {
	@Resource(name = "buyService")
	private BuyService buyService;
	@Resource(name = "cartService")
	private CartService cartService;
	
	@ResponseBody
	@PostMapping("/buyItem")
	public void buyItem(String data, HttpSession session) {
		
		System.out.println(data);
		String memId = ((MemberVO)session.getAttribute("loginInfo")).getMemId();
		
		//SHOP_BUY 테이블에 저장된 가장 큰 BUY_NUM + 1 값을 조회
		int nextBuyNum = buyService.selectNextBuyNum();
		
		List<Map<String, String>> list = JSONArray.fromObject(data);
		//itemCode가 담길 배열
		String[] itemCodeArr = new String[list.size()];
		int index = 0; //배열의 index
		
		List<BuyVO> buyList = new ArrayList<BuyVO>();
		BuyVO buyVO = new BuyVO();
		
		for(Map<String, String> map : list) {
			System.out.println("itemCode : " + map.get("itemCode") + " / itemCnt=" + map.get("itemCnt"));
			
			BuyVO vo = new BuyVO();
			vo.setItemCode(map.get("itemCode"));
			vo.setItemCnt(Integer.parseInt(map.get("itemCnt")));
			vo.setMemId(memId);
			vo.setBuyNum(nextBuyNum++);
			vo.setOrderNum(getNowDateTimeToString() + "_" + memId);
			
			buyList.add(vo);
			
			itemCodeArr[index++] = map.get("itemCode");
		}
		buyVO.setBuyList(buyList);
		
		//구매한 상품 장바구니 삭제
		CartVO cartVO = new CartVO(); //memId, itemCode들
		cartVO.setMemId(memId);
		cartVO.setItemCodeArr(itemCodeArr);
		
		buyService.insertBuyItem(buyVO, cartVO);
		
		
	}
	
	public String getNowDateTimeToString() {
		//싱글턴 패턴
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;// 0~11
		int date = cal.get(Calendar.DATE);
		int hour = cal.get(Calendar.HOUR);
		int minute = cal.get(Calendar.MINUTE);
		int second = cal.get(Calendar.SECOND);
		//20220401101010
		
		String nowDateTime = "" + year + month + date + hour + minute + second;
		
		return nowDateTime;
	}
}










