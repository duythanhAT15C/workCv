package com.assignment02.dto;

import com.assignment02.entity.Recruitment;
import com.assignment02.entity.User;

public class SaveJobDTO {
	private int id;
	private User user;
	private Recruitment recruitment;
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
	@Override
	public String toString() {
		return "SaveJobDTO [id=" + id + ", user=" + user + ", recruitment=" + recruitment + "]";
	}
	
}
