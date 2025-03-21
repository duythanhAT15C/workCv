package com.assignment02.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "apply_post")
public class ApplyJob {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	@Column(name = "created_at")
	private String createdAt;
	@Column(name = "name_cv")
	private String nameCv;
	@Column(name = "status")
	private int status;
	@Column(name = "text")
	private String text;
	@ManyToOne
    @JoinColumn(name = "recruitment_id", nullable = false)
    private Recruitment recruitment;

    // Quan hệ Many-to-One với bảng User
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

	public ApplyJob() {
		super();
	}

	public ApplyJob(String createdAt, String nameCv, int status, String text, Recruitment recruitment, User user) {
		super();
		this.createdAt = createdAt;
		this.nameCv = nameCv;
		this.status = status;
		this.text = text;
		this.recruitment = recruitment;
		this.user = user;
	}

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
