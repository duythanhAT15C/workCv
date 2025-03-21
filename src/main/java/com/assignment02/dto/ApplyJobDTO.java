package com.assignment02.dto;


import com.assignment02.entity.Recruitment;
import com.assignment02.entity.User;

public class ApplyJobDTO {
	private int id;
	private String createdAt;
	private String nameCv;
	private int status;
	private String text;
    private Recruitment recruitment;
    private User user;
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
	 * @return the createdAt
	 */
	public String getCreatedAt() {
		return createdAt;
	}
	/**
	 * @param createdAt the createdAt to set
	 */
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	/**
	 * @return the nameCv
	 */
	public String getNameCv() {
		return nameCv;
	}
	/**
	 * @param nameCv the nameCv to set
	 */
	public void setNameCv(String nameCv) {
		this.nameCv = nameCv;
	}
	/**
	 * @return the status
	 */
	public int getStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(int status) {
		this.status = status;
	}
	/**
	 * @return the text
	 */
	public String getText() {
		return text;
	}
	/**
	 * @param text the text to set
	 */
	public void setText(String text) {
		this.text = text;
	}
	/**
	 * @return the recruitment
	 */
	public Recruitment getRecruitment() {
		return recruitment;
	}
	/**
	 * @param recruitment the recruitment to set
	 */
	public void setRecruitment(Recruitment recruitment) {
		this.recruitment = recruitment;
	}
	/**
	 * @return the user
	 */
	public User getUser() {
		return user;
	}
	/**
	 * @param user the user to set
	 */
	public void setUser(User user) {
		this.user = user;
	}
    
}
