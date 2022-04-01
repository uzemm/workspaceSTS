package com.kh.shop.service;

import java.util.List;

import com.kh.shop.vo.BuyVO;
import com.kh.shop.vo.CartVO;

public interface BuyService {
	int selectNextBuyNum();
	
	void insertBuyItem(BuyVO buyVO, CartVO cartVO);
}
