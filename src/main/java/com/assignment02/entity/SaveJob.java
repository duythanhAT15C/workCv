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
@Table(name = "save_job")
public class SaveJob {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	// Quan hệ Many-to-One với bảng Recruitment
    @ManyToOne
    @JoinColumn(name = "recruitment_id", nullable = false)
    private Recruitment recruitment;

    // Quan hệ Many-to-One với bảng User
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

	public SaveJob() {
		super();
	}

	public SaveJob(Recruitment recruitment, User user) {
		super();
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

	@Override
	public String toString() {
		return "SaveJob [id=" + id + ", recruitment=" + recruitment + ", user=" + user + "]";
	}
    
    
}
