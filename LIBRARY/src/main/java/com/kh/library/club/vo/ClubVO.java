package com.kh.library.club.vo;

import com.kh.library.util.vo.PageVO;

public class ClubVO extends PageVO{
	private String clubCode;
	private String clubName;
	private int clubHeadCnt;
	private int clubComplitCnt;
	private String memId;
	private String memName;
	private String clubIntro;
	private String clubDate;
	private int clubNumberPeople;
	private String keyword;
	private int rowNum;
	
	public int getClubNumberPeople() {
		return clubNumberPeople;
	}
	public void setClubNumberPeople(int clubNumberPeople) {
		this.clubNumberPeople = clubNumberPeople;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getClubDate() {
		return clubDate;
	}
	public void setClubDate(String clubDate) {
		this.clubDate = clubDate;
	}
	public String getClubCode() {
		return clubCode;
	}
	public void setClubCode(String clubCode) {
		this.clubCode = clubCode;
	}
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public int getClubHeadCnt() {
		return clubHeadCnt;
	}
	public void setClubHeadCnt(int clubHeadCnt) {
		this.clubHeadCnt = clubHeadCnt;
	}
	public int getClubComplitCnt() {
		return clubComplitCnt;
	}
	public void setClubComplitCnt(int clubComplitCnt) {
		this.clubComplitCnt = clubComplitCnt;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getClubIntro() {
		return clubIntro;
	}
	public void setClubIntro(String clubIntro) {
		this.clubIntro = clubIntro;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
}