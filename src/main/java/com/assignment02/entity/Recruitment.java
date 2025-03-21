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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "recruitment")
public class Recruitment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	@Column(name = "address")
	private String address;
	@Column(name = "created_at")
	private String createdAt;
	@Column(name = "description")
	private String description;
	@Column(name = "experience")
	private String experience;
	@Column(name = "quantity")
	private int quantity;
	@Column(name = "rank_value")
	private String rankValue;
	@Column(name = "salary")
	private String salary;
	@Column(name = "status")
	private int status;
	@Column(name = "title")
	private String title;
	@Column(name = "type")
	private String type;
	@Column(name = "view")
	private int view;
	@Column(name = "deadline")
	private String deadLine;
	@ManyToOne
	@JoinColumn(name = "category_id")
	private Category category; // Một Recruitment thuộc về một Category

	@ManyToOne
	@JoinColumn(name = "company_id")
	private Company company; // Một Recruitment thuộc về một Company

	@OneToMany(mappedBy = "recruitment", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Set<SaveJob> saveJobs = new HashSet<>();
	@OneToMany(mappedBy = "recruitment")
	private List<ApplyJob> applyPosts;

	public Recruitment() {

	}

	

	public Recruitment(String address, String createdAt, String description, String experience, int quantity,
			String rankValue, String salary, int status, String title, String type, int view, String deadLine,
			Category category, Company company, Set<SaveJob> saveJobs, List<ApplyJob> applyPosts) {
		super();
		this.address = address;
		this.createdAt = createdAt;
		this.description = description;
		this.experience = experience;
		this.quantity = quantity;
		this.rankValue = rankValue;
		this.salary = salary;
		this.status = status;
		this.title = title;
		this.type = type;
		this.view = view;
		this.deadLine = deadLine;
		this.category = category;
		this.company = company;
		this.saveJobs = saveJobs;
		this.applyPosts = applyPosts;
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
	 * @return the deadLine
	 */
	public String getDeadLine() {
		return deadLine;
	}

	/**
	 * @param deadLine the deadLine to set
	 */
	public void setDeadLine(String deadLine) {
		this.deadLine = deadLine;
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
	 * @return the applyPosts
	 */
	public List<ApplyJob> getApplyPosts() {
		return applyPosts;
	}



	/**
	 * @param applyPosts the applyPosts to set
	 */
	public void setApplyPosts(List<ApplyJob> applyPosts) {
		this.applyPosts = applyPosts;
	}
	
}
