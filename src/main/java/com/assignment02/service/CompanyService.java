package com.assignment02.service;

import java.util.List;

import com.assignment02.config.MyUserDetails;
import com.assignment02.dto.CompanyDTO;
import com.assignment02.dto.CompanyStatsDTO;
import com.assignment02.entity.Company;

public interface CompanyService {
	public void saveCompany(CompanyDTO companyDTO, MyUserDetails myUserDetails);
	public CompanyDTO getCompanyDTOByUserId(int userId);
	public Company getCompanyByUserId(int userId);
	public CompanyDTO getCompanyDTOById(int companyId);
	public Company getCompanyById(int companyId);
	public List<CompanyStatsDTO> getTopCompaniesByApplyJob();
}
