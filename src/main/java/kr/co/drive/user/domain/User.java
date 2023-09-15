package kr.co.drive.user.domain;

public class User {
	private String userId;
	private String userPw;
	private String userName;
	private String userEmail;
	private String userPhone;
	private String dLicense;
	
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
	
	@Override
	public String toString() {
		return "회원 [아이디=" + userId + ", 비밀번호=" + userPw + ", 이름=" + userName + ", 이메일=" + userEmail
				+ ", 전화번호=" + userPhone + ", 운전면허번호=" + dLicense + "]";
	}
	
	
}
