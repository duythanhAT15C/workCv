package com.assignment02.dto;

import org.springframework.web.multipart.MultipartFile;

import com.assignment02.entity.User;

public class CompanyDTO {
	private int id;
	private String address;
	private String description;
	private String email;
	private String logo;
	private String nameCompany;
	private String phoneNumber;
	private int status;
	private User user;
	private MultipartFile imageFile;

	public CompanyDTO() {

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
	 * @return the imageFile
	 */
	public MultipartFile getImageFile() {
		return imageFile;
	}

	/**
	 * @param imageFile the imageFile to set
	 */
	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}

	@Override
	public String toString() {
		return "CompanyDTO [id=" + id + ", address=" + address + ", description=" + description + ", email=" + email
				+ ", logo=" + logo + ", nameCompany=" + nameCompany + ", phoneNumber=" + phoneNumber + ", status="
				+ status + ", user=" + user + ", imageFile=" + imageFile + "]";
	}

}
