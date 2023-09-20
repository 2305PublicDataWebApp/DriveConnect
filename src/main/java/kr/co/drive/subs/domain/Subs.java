package kr.co.drive.subs.domain;

import java.sql.Date;

public class Subs {
	
	private int scNo;
	private String scName;
	private String scBrand;
	private String scColor;
	private char scGrade;
	private String scSpec;
	private int resNo;
	private Date sCreateDate;
	private Date sUpdateDate;
    private SubsFiles subsFiles;

	public int getScNo() {
		return scNo;
	}
	public void setScNo(int scNo) {
		this.scNo = scNo;
	}
	public String getScName() {
		return scName;
	}
	public void setScName(String scName) {
		this.scName = scName;
	}
	public String getScBrand() {
		return scBrand;
	}
	public void setScBrand(String scBrand) {
		this.scBrand = scBrand;
	}
	public String getScColor() {
		return scColor;
	}
	public void setScColor(String scColor) {
		this.scColor = scColor;
	}
	public char getScGrade() {
		return scGrade;
	}
	public void setScGrade(char scGrade) {
		this.scGrade = scGrade;
	}
	public String getScSpec() {
		return scSpec;
	}
	public void setScSpec(String scSpec) {
		this.scSpec = scSpec;
	}
	public int getResNo() {
		return resNo;
	}
	public void setResNo(int resNo) {
		this.resNo = resNo;
	}
	
    public Date getsCreateDate() {
		return sCreateDate;
	}
	public void setsCreateDate(Date sCreateDate) {
		this.sCreateDate = sCreateDate;
	}
	public Date getsUpdateDate() {
		return sUpdateDate;
	}
	public void setsUpdateDate(Date sUpdateDate) {
		this.sUpdateDate = sUpdateDate;
	}
	public SubsFiles getSubsFiles() {
        return subsFiles;
    }

    public void setSubsFiles(SubsFiles subsFiles) {
        this.subsFiles = subsFiles;
    }
	
	
}
