package com.assignment02.dao;

import java.util.List;

import com.assignment02.config.MyUserDetails;
import com.assignment02.dto.CompanyStatsDTO;
import com.assignment02.entity.Company;

public interface CompanyDAO {
	public void saveCompany(Company company, MyUserDetails myUserDetails);
	public Company getCompanyByUserId(int userId);
	public Company getCompanyById(int companyId);
	public List<CompanyStatsDTO> getTopCompaniesByApplyJob();
}
