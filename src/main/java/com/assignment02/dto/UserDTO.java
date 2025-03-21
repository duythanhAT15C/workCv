package com.assignment02.dto;

import java.util.Set;

import org.springframework.web.multipart.MultipartFile;

import com.assignment02.entity.Role;

public class UserDTO {
	private int id;
	private String address;
	private String description;
	private String email;
	private String fullName;
	private String image;
	private String password;
	private String phoneNumber;
	private int status;
	private int cvId;
	private int roleId;
	private Set<Role> roles;
	private String rePassword;
	private MultipartFile imageFile;
	private String verificationToken;
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
	/**
	 * @return the cvId
	 */
	public int getCvId() {
		return cvId;
	}
	/**
	 * @param cvId the cvId to set
	 */
	public void setCvId(int cvId) {
		this.cvId = cvId;
	}
	
	
	/**
	 * @return the roleId
	 */
	public int getRoleId() {
		return roleId;
	}
	/**
	 * @param roleId the roleId to set
	 */
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	/**
	 * @return the rePassword
	 */
	public String getRePassword() {
		return rePassword;
	}
	/**
	 * @param rePassword the rePassword to set
	 */
	public void setRePassword(String rePassword) {
		this.rePassword = rePassword;
	}
	

	/**
	 * @return the roles
	 */
	public Set<Role> getRoles() {
		return roles;
	}
	/**
	 * @param roles the roles to set
	 */
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
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
	@Override
	public String toString() {
		return "UserDTO [id=" + id + ", address=" + address + ", description=" + description + ", email=" + email
				+ ", fullName=" + fullName + ", image=" + image + ", password=" + password + ", phoneNumber="
				+ phoneNumber + ", status=" + status + ", cvId=" + cvId + ", roleId=" + roleId + ", roles=" + roles
				+ ", rePassword=" + rePassword + ", imageFile=" + imageFile + "]";
	}
	

	
	
	
	
}
