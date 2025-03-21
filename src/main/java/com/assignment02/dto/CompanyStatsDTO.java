package com.assignment02.dto;

import com.assignment02.entity.Company;

public class CompanyStatsDTO {

	private Company company;
	private Long applicationCount;

	public CompanyStatsDTO() {
	}

	public CompanyStatsDTO(Company company, Long applicationCount) {
		this.company = company;
		this.applicationCount = applicationCount;
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
	 * @return the applicationCount
	 */
	public Long getApplicationCount() {
		return applicationCount;
	}

	/**
	 * @param applicationCount the applicationCount to set
	 */
	public void setApplicationCount(Long applicationCount) {
		this.applicationCount = applicationCount;
	}
	
	
}
