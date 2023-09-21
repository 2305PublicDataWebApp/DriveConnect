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
	private String request;
	private char subsYn;
	private String scName;
	private int userNo;
	private int scNo;
	private String fileName;
	private String fileRename;
	private String filePath;
	private int fileLength;
	
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
	public int getScNo() {
		return scNo;
	}
	public void setScNo(int scNo) {
		this.scNo = scNo;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileRename() {
		return fileRename;
	}
	public void setFileRename(String fileRename) {
		this.fileRename = fileRename;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public int getFileLength() {
		return fileLength;
	}
	public void setFileLength(int fileLength) {
		this.fileLength = fileLength;
	}
	@Override
	public String toString() {
		return "Reserve [resNo=" + resNo + ", userId=" + userId + ", userName=" + userName + ", userAddress="
				+ userAddress + ", resDate=" + resDate + ", payment=" + payment + ", payway=" + payway + ", payYn="
				+ payYn + ", subsStart=" + subsStart + ", subsFinish=" + subsFinish 
				+ ", request=" + request + ", subsYn=" + subsYn + ", scName=" + scName + ", userNo=" + userNo + ", scNo=" + scNo
				+ ", fileName=" + fileName + ", fileRename=" + fileRename + ", filePath=" + filePath 
				+ ", fileLength=" + fileLength + "]";
	}
}
