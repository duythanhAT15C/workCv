package com.assignment02.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import com.assignment02.config.MyUserDetails;
import com.assignment02.dao.RecruitmentDAO;
import com.assignment02.entity.Category;
import com.assignment02.entity.Company;
import com.assignment02.entity.Recruitment;
import com.assignment02.entity.SaveJob;
import com.assignment02.entity.User;
import com.assignment02.repository.CategoryRepository;
import com.assignment02.repository.CompanyRepository;
import com.assignment02.repository.RecruitmentRepository;
import com.assignment02.repository.RepositoryCustom;
import com.assignment02.repository.SaveJobRepository;
import com.assignment02.repository.UserRepository;

@Repository
public class RecruitmentDAOImpl implements RecruitmentDAO {
	@Autowired
	private RecruitmentRepository recruitmentRepository;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private CompanyRepository companyRepository;
	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired
	private RepositoryCustom repositoryCustom;
	@Autowired
	private SaveJobRepository saveJobRepository;

	@Override
	public void saveRecruitment(Recruitment recruitment, MyUserDetails myUserDetails, int recruitmentId) {
		if (myUserDetails != null) {
			String email = myUserDetails.getUsername(); // Lấy email từ MyUserDetails (hoặc các thông tin khác)

			User existingUser = userRepository.findByEmail(email);
			Company company = companyRepository.findByUserId(existingUser.getId());
			Category category = categoryRepository.findById(recruitment.getCategory().getId());
			recruitment.setCategory(category);
			if (recruitmentId == 0) {
				recruitment.setCompany(company);
				recruitmentRepository.save(recruitment);
			} else {
				Recruitment updaRecruitment = recruitmentRepository.findById(recruitmentId).orElse(new Recruitment());
				recruitmentRepository.save(updateRecruitment(updaRecruitment, recruitment, company));
			}

//			
//			
//			if (existingUser != null) {
//				// Cập nhật thông tin người dùng
//				existingUser.setFullName(user.getFullName());
//				existingUser.setEmail(user.getEmail());
//				existingUser.setAddress(user.getAddress());
//				existingUser.setPhoneNumber(user.getPhoneNumber());
//				existingUser.setDescription(user.getDescription());
//
//				userRepository.save(existingUser);
//			} else {
//				// Tạo mới người dùng nếu chưa tồn tại
//				user.setPassword(passwordEncoder.encode(user.getPassword()));
//				userRepository.save(user);
//			}
		} else {
			// Tạo mới người dùng nếu chưa tồn tại
//			user.setPassword(passwordEncoder.encode(user.getPassword()));
//			userRepository.save(user);
		}

	}

	@Override
	public Recruitment getRecruitment(int recruitmentId) {
		// TODO Auto-generated method stub
		return recruitmentRepository.findById(recruitmentId).orElse(new Recruitment());
	}

	public Recruitment updateRecruitment(Recruitment updaRecruitment, Recruitment recruitment, Company company) {
		updaRecruitment.setId(recruitment.getId());
		updaRecruitment.setAddress(recruitment.getAddress());
		updaRecruitment.setCreatedAt(recruitment.getCreatedAt());
		updaRecruitment.setDescription(recruitment.getDescription());
		updaRecruitment.setExperience(recruitment.getExperience());
		updaRecruitment.setQuantity(recruitment.getQuantity());
		updaRecruitment.setRankValue(recruitment.getRankValue());
		updaRecruitment.setSalary(recruitment.getSalary());
		updaRecruitment.setStatus(recruitment.getStatus());
		updaRecruitment.setTitle(recruitment.getTitle());
		updaRecruitment.setType(recruitment.getType());
		updaRecruitment.setView(recruitment.getView());
		updaRecruitment.setCategory(recruitment.getCategory());
		recruitment.setCompany(company);
		return updaRecruitment;
	}

	@Override
	public Page<Recruitment> getAllRecruitmentsByCompany(int companyId, Pageable pageable) {
		// TODO Auto-generated method stub
		return recruitmentRepository.findByCompanyId(companyId, pageable);
	}

	@Override
	public Page<Recruitment> getAllRecruitmentsByCategory(int categoryId, Pageable pageable) {
		// TODO Auto-generated method stub
		return recruitmentRepository.findByCategoryId(categoryId, pageable);
	}

	@Override
	public Recruitment getRecruitmentByCompanyId(int companyId) {
		// TODO Auto-generated method stub
		return recruitmentRepository.findByCompanyId(companyId);
	}

	@Override
	public void deleteRecruitment(int recruitmentId) {
		// TODO Auto-generated method stub

		long count = recruitmentRepository.count();
		List<SaveJob> saveJobs = saveJobRepository.findByRecruitmentId(recruitmentId);
		if (saveJobs != null && !saveJobs.isEmpty()) {
			saveJobRepository.deleteAllInBatch(saveJobs);
		}
		recruitmentRepository.deleteById(recruitmentId);
		if (count == 1) {
			repositoryCustom.resetAutoIncrementRecruitment();
		}
	}

	@Override
	public List<Recruitment> getAllRecruitmentByCategoryId(int categoryId) {
		// TODO Auto-generated method stub
		return recruitmentRepository.findByCategoryId(categoryId);
	}

	@Override
	public List<Recruitment> getMostAppliedJobs() {
		// TODO Auto-generated method stub
		return recruitmentRepository.findMostAppliedJobs();
	}

	@Override
	public Page<Recruitment> getRecruitmentsByTitle(String recruitmentTitle, Pageable pageable) {
		// TODO Auto-generated method stub
		return recruitmentRepository.searchByTitle(recruitmentTitle, pageable);
	}

	@Override
	public Page<Recruitment> getRecruitmentsByNameCompany(String nameCompany, Pageable pageable) {
		// TODO Auto-generated method stub
		return recruitmentRepository.searchByCompanyName(nameCompany, pageable);
	}

	@Override
	public Page<Recruitment> getRecruitmentsByAddress(String address, Pageable pageable) {
		// TODO Auto-generated method stub
		return recruitmentRepository.searchByAddress(address, pageable);
	}

	@Override
	public Page<Recruitment> searchRecruitments(String title, String type, String address, Pageable pageable) {
		// Kiểm tra xem có bất kỳ tham số nào khác null hay rỗng
		if ((title != null && !title.isEmpty()) || (type != null && !type.isEmpty())
				|| (address != null && !address.isEmpty())) {
			// Nếu có ít nhất một tham số không null hoặc rỗng, gọi searchRecruitments
			return recruitmentRepository.searchRecruitments(title, type, address, pageable);
		} else {
			// Nếu tất cả tham số đều null hoặc rỗng, trả về tất cả bản ghi
			return recruitmentRepository.findAll(pageable);
		}
	}

}
