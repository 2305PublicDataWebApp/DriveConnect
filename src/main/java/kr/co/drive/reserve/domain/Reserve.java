package kr.co.drive.reserve.domain;

import java.sql.Timestamp;

public class Reserve {
	
	private int resNo;
	private String userId;
	private String userName;
	private String userAddress;
	private Timestamp resDate;
	private int payment;
	private String payway;
	private char payYn;
	private Timestamp subsStart;
	private Timestamp subsFinish;
	private String userPhone;
	private String userEmail;
	private String request;
	private char subsYn;
	private String scName;
	private int userNo;
	
	public int getResNo() {
		return resNo;
	}
	public void setResNo(int resNo) {
		this.resNo = resNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public Timestamp getResDate() {
		return resDate;
	}
	public void setResDate(Timestamp resDate) {
		this.resDate = resDate;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public String getPayway() {
		return payway;
	}
	public void setPayway(String payway) {
		this.payway = payway;
	}
	public char getPayYn() {
		return payYn;
	}
	public void setPayYn(char payYn) {
		this.payYn = payYn;
	}
	public Timestamp getSubsStart() {
		return subsStart;
	}
	public void setSubsStart(Timestamp subsStart) {
		this.subsStart = subsStart;
	}
	public Timestamp getSubsFinish() {
		return subsFinish;
	}
	public void setSubsFinish(Timestamp subsFinish) {
		this.subsFinish = subsFinish;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public char getSubsYn() {
		return subsYn;
	}
	public void setSubsYn(char subsYn) {
		this.subsYn = subsYn;
	}
	public String getScName() {
		return scName;
	}
	public void setScName(String scName) {
		this.scName = scName;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	
}
