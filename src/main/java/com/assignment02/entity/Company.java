package com.assignment02.entity;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "company")
public class Company {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	@Column(name = "address")
	private String address;
	@Column(name = "description")
	private String description;
	@Column(name = "email")
	private String email;
	@Column(name = "logo")
	private String logo;
	@Column(name = "name_company")
	private String nameCompany;
	@Column(name = "phone_number")
	private String phoneNumber;
	@Column(name = "status")
	private int status;
//	@OneToMany(mappedBy = "userCompany", cascade = CascadeType.ALL)
//	private List<User> users;
	@Column(name = "user_id")
	private int userId;
	@OneToMany(mappedBy = "company")
    private List<Recruitment> recruitments; // Một Company có nhiều Recruitment
	@OneToMany(mappedBy = "company", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<FollowCompany> followCompanies = new HashSet<>();

	public Company() {

	}
//
//	public Company(String address, String description, String email, String logo, String nameCompany,
//			String phoneNumber, int status, List<User> users) {
//		this.address = address;
//		this.description = description;
//		this.email = email;
//		this.logo = logo;
//		this.nameCompany = nameCompany;
//		this.phoneNumber = phoneNumber;
//		this.status = status;
//		this.users = users;
//	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	public Company(String address, String description, String email, String logo, String nameCompany,
			String phoneNumber, int status, int userId) {
		super();
		this.address = address;
		this.description = description;
		this.email = email;
		this.logo = logo;
		this.nameCompany = nameCompany;
		this.phoneNumber = phoneNumber;
		this.status = status;
		this.userId = userId;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the logo
	 */
	public String getLogo() {
		return logo;
	}

	/**
	 * @param logo the logo to set
	 */
	public void setLogo(String logo) {
		this.logo = logo;
	}

	/**
	 * @return the nameCompany
	 */
	public String getNameCompany() {
		return nameCompany;
	}

	/**
	 * @param nameCompany the nameCompany to set
	 */
	public void setNameCompany(String nameCompany) {
		this.nameCompany = nameCompany;
	}

	/**
	 * @return the phoneNumber
	 */
	public String getPhoneNumber() {
		return phoneNumber;
	}

	/**
	 * @param phoneNumber the phoneNumber to set
	 */
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
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

//	/**
//	 * @return the users
//	 */
//	public List<User> getUsers() {
//		return users;
//	}
//
//	/**
//	 * @param users the users to set
//	 */
//	public void setUsers(List<User> users) {
//		this.users = users;
//	}

	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}

	/**
	 * @param userId the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}
	

	/**
	 * @return the recruitments
	 */
	public List<Recruitment> getRecruitments() {
		return recruitments;
	}

	/**
	 * @param recruitments the recruitments to set
	 */
	public void setRecruitments(List<Recruitment> recruitments) {
		this.recruitments = recruitments;
	}

	/**
	 * @return the followCompanies
	 */
	public Set<FollowCompany> getFollowCompanies() {
		return followCompanies;
	}

	/**
	 * @param followCompanies the followCompanies to set
	 */
	public void setFollowCompanies(Set<FollowCompany> followCompanies) {
		this.followCompanies = followCompanies;
	}

	@Override
	public String toString() {
		return "Company [id=" + id + ", address=" + address + ", description=" + description + ", email=" + email
				+ ", logo=" + logo + ", nameCompany=" + nameCompany + ", phoneNumber=" + phoneNumber + ", status="
				+ status + ", userId=" + userId + "]";
	}

//	@Override
//	public String toString() {
//		return "Company [id=" + id + ", address=" + address + ", description=" + description + ", email=" + email
//				+ ", logo=" + logo + ", nameCompany=" + nameCompany + ", phoneNumber=" + phoneNumber + ", status="
//				+ status + ", users=" + users + "]";
//	}
	

}
