package com.kh.emp.vo;

public class EmpVO {
	private String empNo;
	private String eName;
	private String job;
	private String eAge;
	private String tell;
	private String deptNo;
	private String gender;
	private String dName;
	private String region;
//	private String tells[];
	
	
//	public void setTells(String[] tells) {
//		this.tells = tells;
//	}
	
	
	public String getGender() {
		return gender;
	}
	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String geteName() {
		return eName;
	}
	public void seteName(String eName) {
		this.eName = eName;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String geteAge() {
		return eAge;
	}
	public void seteAge(String eAge) {
		this.eAge = eAge;
	}
	public String getTell() {
		return tell;
	}
	public void setTell(String tell) {
		this.tell = tell;
	}
	public String getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}
}
