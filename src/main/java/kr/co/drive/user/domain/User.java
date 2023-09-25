package kr.co.drive.user.domain;

import java.sql.Timestamp;

public class User {
	private int userNo; 
	private String userId;
	private String userPw;
	private String userName;
	private String userEmail;
	private String userPhone;
	private String dLicense;
	private char subsYn;
	private char userYn;
	private String userAddress;
	private Timestamp uDate;
	private char adminYn;
	
	
	public User() {}
	
	
	
	public User(int userNo, String userName, String dLicense, String userAddress) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.dLicense = dLicense;
		this.userAddress = userAddress;
	}



	public User(String userId) {
		super();
		this.userId = userId;
	}



	public User(String userId, String userPw, String userName, String userEmail, String userPhone, String dLicense) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.dLicense = dLicense;
	}

	
	public User(String userId, String userName, char adminYn) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.adminYn = adminYn;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPw() {
		return userPw;
	}


	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public String getUserPhone() {
		return userPhone;
	}


	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}


	public String getdLicense() {
		return dLicense;
	}


	public void setdLicense(String dLicense) {
		this.dLicense = dLicense;
	}


	public char getSubsYn() {
		return subsYn;
	}


	public void setSubsYn(char subsYn) {
		this.subsYn = subsYn;
	}


	public char getUserYn() {
		return userYn;
	}


	public void setUserYn(char userYn) {
		this.userYn = userYn;
	}


	public String getUserAddress() {
		return userAddress;
	}


	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}


	public Timestamp getuDate() {
		return uDate;
	}


	public void setuDate(Timestamp uDate) {
		this.uDate = uDate;
	}


	public char getAdminYn() {
		return adminYn;
	}


	public void setAdminYn(char adminYn) {
		this.adminYn = adminYn;
	}


	@Override
	public String toString() {
		return "회원 [회원번호=" + userNo + ", 회원아이디=" + userId + ", 비밀번호=" + userPw + ", 이름=" + userName
				+ ", 이메일=" + userEmail + ", 전화번호=" + userPhone + ", 운전면허=" + dLicense + ", 구독여부="
				+ subsYn + ", 회원여부=" + userYn + ", 배송주소=" + userAddress + ", 가입날짜=" + uDate + ", 관리자여부=" + adminYn + "]";
	}
	
	
	
}
