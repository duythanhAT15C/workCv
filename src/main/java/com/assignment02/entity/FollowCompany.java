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
@Table(name = "follow_company")
public class FollowCompany {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	// Quan hệ Many-to-One với bảng Recruitment
    @ManyToOne
    @JoinColumn(name = "company_id", nullable = false)
    private Company company;

    // Quan hệ Many-to-One với bảng User
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

	public FollowCompany() {
		super();
	}

	public FollowCompany(Company company, User user) {
		super();
		this.company = company;
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
	 * @return the company
	 */
	public Company getCompany() {
		return company;
	}

	/**
	 * @param company the company to set
	 */
	public void setCompany(Company company) {
		this.company = company;
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
