package com.assignment02.dto;

import org.springframework.web.multipart.MultipartFile;

public class CvDTO {
	private int id;
	private String fileName;
	private MultipartFile cvFile;
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the fileName
	 */
	public String getFileName() {
		return fileName;
	}
	/**
	 * @param fileName the fileName to set
	 */
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	/**
	 * @return the cvFile
	 */
	public MultipartFile getCvFile() {
		return cvFile;
	}
	/**
	 * @param cvFile the cvFile to set
	 */
	public void setCvFile(MultipartFile cvFile) {
		this.cvFile = cvFile;
	}
	@Override
	public String toString() {
		return "CvDTO [id=" + id + ", fileName=" + fileName + ", cvFile=" + cvFile + "]";
	}
	
	
}
