package com.assignment02.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class User {
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
	@Column(name = "full_name")
	private String fullName;
	@Column(name = "image")
	private String image;
	@Column(name = "password")
	private String password;
	@Column(name = "phone_number")
	private String phoneNumber;
	@Column(name = "status")
	private int status;
	@Column(name = "verification_token")
	private String verificationToken;
//	@ManyToOne(cascade = CascadeType.ALL)
//	@JoinColumn(name = "role_id")
//	private Role role;
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "cv_id")
	private Cv cv;
	@ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH}, 
				fetch = FetchType.EAGER)
    @JoinTable(
            name = "users_roles",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id")
            )
    private Set<Role> roles = new HashSet<>();
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<SaveJob> saveJobs = new HashSet<>();
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<FollowCompany> followCompanies = new HashSet<>();
	
	public User() {
	}

	

	public User(String address, String description, String email, String fullName, String image, String password,
			String phoneNumber, int status, String verificationToken, Cv cv, Set<Role> roles, Set<SaveJob> saveJobs,
			Set<FollowCompany> followCompanies) {
		super();
		this.address = address;
		this.description = description;
		this.email = email;
		this.fullName = fullName;
		this.image = image;
		this.password = password;
		this.phoneNumber = phoneNumber;
		this.status = status;
		this.verificationToken = verificationToken;
		this.cv = cv;
		this.roles = roles;
		this.saveJobs = saveJobs;
		this.followCompanies = followCompanies;
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
	 * @return the fullName
	 */
	public String getFullName() {
		return fullName;
	}
	/**
	 * @param fullName the fullName to set
	 */
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	/**
	 * @return the image
	 */
	public String getImage() {
		return image;
	}
	/**
	 * @param image the image to set
	 */
	public void setImage(String image) {
		this.image = image;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
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
//	 * @return the role
//	 */
//	public Role getRole() {
//		return role;
//	}
//	/**
//	 * @param role the role to set
//	 */
//	public void setRole(Role role) {
//		this.role = role;
//	}

	
	/**
	 * @return the roles
	 */
	public Set<Role> getRoles() {
		return roles;
	}
	/**
	 * @return the cv
	 */
	public Cv getCv() {
		return cv;
	}

	/**
	 * @param cv the cv to set
	 */
	public void setCv(Cv cv) {
		this.cv = cv;
	}

	/**
	 * @param roles the roles to set
	 */
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	/**
	 * @return the saveJobs
	 */
	public Set<SaveJob> getSaveJobs() {
		return saveJobs;
	}

	/**
	 * @param saveJobs the saveJobs to set
	 */
	public void setSaveJobs(Set<SaveJob> saveJobs) {
		this.saveJobs = saveJobs;
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



	/**
	 * @return the verificationToken
	 */
	public String getVerificationToken() {
		return verificationToken;
	}



	/**
	 * @param verificationToken the verificationToken to set
	 */
	public void setVerificationToken(String verificationToken) {
		this.verificationToken = verificationToken;
	}
	
	
	
	
//	@Override
//	public String toString() {
//		return "User [id=" + id + ", address=" + address + ", description=" + description + ", email=" + email
//				+ ", fullName=" + fullName + ", image=" + image + ", password=" + password + ", phoneNumber="
//				+ phoneNumber + ", status=" + status + ", role=" + role + ", cvs=" + cvs + "]";
//	}
//	
	
}
