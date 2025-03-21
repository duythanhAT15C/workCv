package com.assignment02.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.assignment02.config.MyUserDetails;
import com.assignment02.dao.CompanyDAO;
import com.assignment02.dto.CompanyDTO;
import com.assignment02.dto.CompanyStatsDTO;
import com.assignment02.entity.Company;
import com.assignment02.entity.User;
import com.assignment02.service.CompanyService;

@Service
public class CompanyServiceImpl implements CompanyService {
	@Autowired
	private CompanyDAO companyDAO;

	@Override
	@Transactional
	public CompanyDTO getCompanyDTOByUserId(int userId) {
		// TODO Auto-generated method stub
		Company company = companyDAO.getCompanyByUserId(userId);
		CompanyDTO companyDTO = convertToDTO(company);
		return companyDTO;
	}

	// Hàm chuyển từ DTO sang entity
	public Company convertToEntity(CompanyDTO companyDTO) {
		if (companyDTO == null) {
			return null;
		}

//			    User user = userDAO.getUser(userDTO.getId());
		Company company = new Company();
		company.setId(companyDTO.getId());
		company.setAddress(companyDTO.getAddress());
		company.setDescription(companyDTO.getDescription());
		company.setEmail(companyDTO.getEmail());
		company.setLogo(companyDTO.getLogo());
		company.setNameCompany(companyDTO.getNameCompany());
		company.setPhoneNumber(companyDTO.getPhoneNumber());
		if (companyDTO.getStatus() == 0) {
			company.setStatus(1);
		} else {
			company.setStatus(companyDTO.getStatus());
		}
		return company;
	}

	// Hàm chuyển từ entity sang DTO
	private CompanyDTO convertToDTO(Company company) {
		if (company == null) {
			return null;
		}

//				    User user = userDAO.getUser(userDTO.getId());
		CompanyDTO companyDTO = new CompanyDTO();
		companyDTO.setId(company.getId());
		companyDTO.setAddress(company.getAddress());
		companyDTO.setDescription(company.getDescription());
		companyDTO.setEmail(company.getEmail());
		companyDTO.setLogo(company.getLogo());
		companyDTO.setNameCompany(company.getNameCompany());
		companyDTO.setPhoneNumber(company.getPhoneNumber());
		if (company.getStatus() == 0) {
			companyDTO.setStatus(1);
		} else {
			companyDTO.setStatus(company.getStatus());
		}
//				userDTO.setRoleId(user.getRole().getId());
		User user = new User();
		user.setId(company.getUserId());
		companyDTO.setUser(user);
		return companyDTO;
	}

	@Override
	public void saveCompany(CompanyDTO companyDTO, MyUserDetails myUserDetails) {
		Company company = convertToEntity(companyDTO);
		companyDAO.saveCompany(company, myUserDetails);
	}

	@Override
	public Company getCompanyByUserId(int userId) {
		// TODO Auto-generated method stub
		return companyDAO.getCompanyByUserId(userId);
	}

	@Override
	public CompanyDTO getCompanyDTOById(int companyId) {
		// TODO Auto-generated method stub
		Company company = companyDAO.getCompanyById(companyId);
		return convertToDTO(company);
	}

	@Override
	public Company getCompanyById(int companyId) {
		// TODO Auto-generated method stub
		return companyDAO.getCompanyById(companyId);
	}

	@Override
	public List<CompanyStatsDTO> getTopCompaniesByApplyJob() {
		// TODO Auto-generated method stub
		return companyDAO.getTopCompaniesByApplyJob();
	}


}
