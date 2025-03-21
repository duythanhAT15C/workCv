package com.assignment02.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.assignment02.config.MyUserDetails;
import com.assignment02.dao.CompanyDAO;
import com.assignment02.dto.CompanyStatsDTO;
import com.assignment02.entity.Company;
import com.assignment02.entity.User;
import com.assignment02.repository.CompanyRepository;
import com.assignment02.repository.UserRepository;

@Repository
public class CompanyDAOImpl implements CompanyDAO {
	@Autowired
	private CompanyRepository companyRepository;
	@Autowired
	private UserRepository userRepository;

	@Override
	public Company getCompanyByUserId(int userId) {
		// TODO Auto-generated method stub
		return companyRepository.findByUserId(userId);
	}

	@Override
	public void saveCompany(Company company, MyUserDetails currentUser) {
		// TODO Auto-generated method stub
		if (currentUser != null) {
			String email = currentUser.getUsername(); // Lấy email từ MyUserDetails (hoặc các thông tin khác)

			User existingUser = userRepository.findByEmail(email);
			Company existingCompany = companyRepository.findByUserId(existingUser.getId());
			if (existingCompany != null) {
				// Cập nhật thông tin người dùng
				existingCompany.setNameCompany(company.getNameCompany().toUpperCase());
				existingCompany.setEmail(company.getEmail());
				existingCompany.setAddress(company.getAddress());
				existingCompany.setPhoneNumber(company.getPhoneNumber());
				existingCompany.setDescription(company.getDescription());
				existingCompany.setLogo(company.getLogo());
				companyRepository.save(existingCompany);
			} else {
				// Tạo mới người dùng nếu chưa tồn tại
				company.setUserId(existingUser.getId());
				companyRepository.save(company);
			}
		} else {
			// Tạo mới người dùng nếu chưa tồn tại
			companyRepository.save(company);
		}
	}

	@Override
	public Company getCompanyById(int companyId) {
		// TODO Auto-generated method stub
		return companyRepository.findById(companyId).orElse(new Company());
	}

	@Override
	public List<CompanyStatsDTO> getTopCompaniesByApplyJob() {
		// TODO Auto-generated method stub
		return companyRepository.findTopCompaniesWithApplicationCount();
	}


}
