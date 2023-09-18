package kr.co.drive.subs.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class SubsFiles {
	
	private String fileName;
	private String fileRename;
	private String filePath;
	private long fileLength;
	private int scNo;
	private Date sCreateDate;
	private Date sUpdateDate;
	
    private MultipartFile file;

	
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
	public long getFileLength() {
		return fileLength;
	}
	public void setFileLength(long fileLength) {
		this.fileLength = fileLength;
	}
	public int getScNo() {
		return scNo;
	}
	public void setScNo(int scNo) {
		this.scNo = scNo;
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
	
    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
	
	
}
