package com.assignment02.dto;

import com.assignment02.entity.Category;
import com.assignment02.entity.Company;

public class RecruitmentDTO {
	private int id;
	private String address;
	private String createdAt;
	private String description;
	private String experience;
	private int quantity;
	private String rankValue;
	private String salary;
	private int status;
	private String title;
	private String type;
	private int view;
	private String deadline;
	private Category category;
	private int categoryId;
	private Company company;
	private String formatCreateAt;
	private String formatDeadLine;
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
	 * @return the experience
	 */
	public String getExperience() {
		return experience;
	}
	/**
	 * @param experience the experience to set
	 */
	public void setExperience(String experience) {
		this.experience = experience;
	}
	/**
	 * @return the quantity
	 */
	public int getQuantity() {
		return quantity;
	}
	/**
	 * @param quantity the quantity to set
	 */
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	/**
	 * @return the rankValue
	 */
	public String getRankValue() {
		return rankValue;
	}
	/**
	 * @param rankValue the rankValue to set
	 */
	public void setRankValue(String rankValue) {
		this.rankValue = rankValue;
	}
	/**
	 * @return the salary
	 */
	public String getSalary() {
		return salary;
	}
	/**
	 * @param salary the salary to set
	 */
	public void setSalary(String salary) {
		this.salary = salary;
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
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}
	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}
	/**
	 * @return the view
	 */
	public int getView() {
		return view;
	}
	/**
	 * @param view the view to set
	 */
	public void setView(int view) {
		this.view = view;
	}
	
	/**
	 * @return the deadline
	 */
	public String getDeadline() {
		return deadline;
	}
	/**
	 * @param deadline the deadline to set
	 */
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	/**
	 * @return the category
	 */
	public Category getCategory() {
		return category;
	}
	/**
	 * @param category the category to set
	 */
	public void setCategory(Category category) {
		this.category = category;
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
	 * @return the formatCreateAt
	 */
	public String getFormatCreateAt() {
		return formatCreateAt;
	}
	/**
	 * @param formatCreateAt the formatCreateAt to set
	 */
	public void setFormatCreateAt(String formatCreateAt) {
		this.formatCreateAt = formatCreateAt;
	}
	/**
	 * @return the formatDeadLine
	 */
	public String getFormatDeadLine() {
		return formatDeadLine;
	}
	/**
	 * @param formatDeadLine the formatDeadLine to set
	 */
	public void setFormatDeadLine(String formatDeadLine) {
		this.formatDeadLine = formatDeadLine;
	}
	
	/**
	 * @return the categoryId
	 */
	public int getCategoryId() {
		return categoryId;
	}
	/**
	 * @param categoryId the categoryId to set
	 */
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	@Override
	public String toString() {
		return "RecruitmentDTO [id=" + id + ", address=" + address + ", createdAt=" + createdAt + ", description="
				+ description + ", experience=" + experience + ", quantity=" + quantity + ", rankValue=" + rankValue
				+ ", salary=" + salary + ", status=" + status + ", title=" + title + ", type=" + type + ", view=" + view
				+ ", deadline=" + deadline + ", category=" + category + ", categoryId=" + categoryId + ", company="
				+ company + ", formatCreateAt=" + formatCreateAt + ", formatDeadLine=" + formatDeadLine + "]";
	}
	
	
}
