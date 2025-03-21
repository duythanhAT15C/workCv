package com.assignment02.service.impl;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.stereotype.Service;

import com.assignment02.config.MyUserDetails;
import com.assignment02.dao.RecruitmentDAO;
import com.assignment02.dto.RecruitmentDTO;
import com.assignment02.entity.Category;
import com.assignment02.entity.Company;
import com.assignment02.entity.Recruitment;
import com.assignment02.entity.User;
import com.assignment02.repository.UserRepository;
import com.assignment02.service.CategoryService;
import com.assignment02.service.CompanyService;
import com.assignment02.service.RecruitmentService;

@Service
public class RecruitmentServiceImpl implements RecruitmentService {
	@Autowired
	private RecruitmentDAO recruitmentDAO;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private CompanyService companyService;
	@Autowired
	private UserRepository userRepository;

	@Override
	public void saveRecruitment(RecruitmentDTO recruitmentDTO, MyUserDetails myUserDetails, int recruitmentId) {
		// TODO Auto-generated method stub
		Recruitment recruitment = convertToEntity(recruitmentDTO, myUserDetails);
		recruitmentDAO.saveRecruitment(recruitment, myUserDetails, recruitmentId);
	}

	public Recruitment convertToEntity(RecruitmentDTO recruitmentDTO, MyUserDetails currentUser) {
		if (recruitmentDTO == null) {
			return null;
		}

//		    User user = userDAO.getUser(userDTO.getId());
		Recruitment recruitment = new Recruitment();
		recruitment.setId(recruitmentDTO.getId());
		recruitment.setAddress(recruitmentDTO.getAddress());
		DateTimeFormatter dbFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate nowDate = LocalDate.now();
		String startDate = nowDate.format(dbFormatter);
		recruitment.setCreatedAt(startDate);
		recruitment.setDescription(recruitmentDTO.getDescription());
		recruitment.setExperience(recruitmentDTO.getExperience());
		recruitment.setQuantity(recruitmentDTO.getQuantity());
		recruitment.setRankValue(recruitmentDTO.getRankValue());
		recruitment.setSalary(recruitmentDTO.getSalary());
		if (recruitmentDTO.getStatus() == 0) {
			recruitment.setStatus(1);
		} else {
			recruitment.setStatus(recruitmentDTO.getStatus());
		}
		recruitment.setTitle(recruitmentDTO.getTitle());
		recruitment.setType(recruitmentDTO.getType());
		recruitment.setView(recruitmentDTO.getView());
		Category category = categoryService.getCategory(recruitmentDTO.getCategoryId());
		recruitment.setCategory(category);
		User existingUser = userRepository.findByEmail(currentUser.getUsername());
		Company company = companyService.getCompanyByUserId(existingUser.getId());
		recruitment.setCompany(company);
		recruitment.setDeadLine(recruitmentDTO.getDeadline());
		return recruitment;
	}

	public RecruitmentDTO convertToDTO(Recruitment recruitment) {
		if (recruitment == null) {
			return null;
		}

//		    User user = userDAO.getUser(userDTO.getId());
		RecruitmentDTO recruitmentDTO = new RecruitmentDTO();
		recruitmentDTO.setId(recruitment.getId());
		recruitmentDTO.setAddress(recruitment.getAddress());
		DateTimeFormatter dbFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter displayFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDate createAtDb = LocalDate.parse(recruitment.getCreatedAt(), dbFormatter);
		LocalDate deadLineDb = LocalDate.parse(recruitment.getDeadLine(), dbFormatter);
		String createAt = createAtDb.format(displayFormatter);
		String deadLine = deadLineDb.format(displayFormatter);
		recruitmentDTO.setCreatedAt(recruitment.getCreatedAt());
		recruitmentDTO.setDeadline(recruitment.getDeadLine());
		recruitmentDTO.setFormatCreateAt(createAt);
		recruitmentDTO.setFormatDeadLine(deadLine);
		recruitmentDTO.setDescription(recruitment.getDescription());
		recruitmentDTO.setExperience(recruitment.getExperience());
		recruitmentDTO.setQuantity(recruitment.getQuantity());
		recruitmentDTO.setRankValue(recruitment.getRankValue());
		recruitmentDTO.setSalary(recruitment.getSalary());
		if (recruitmentDTO.getStatus() == 0) {
			recruitmentDTO.setStatus(1);
		} else {
			recruitmentDTO.setStatus(recruitment.getStatus());
		}
		recruitmentDTO.setTitle(recruitment.getTitle());
		recruitmentDTO.setType(recruitment.getType());
		recruitmentDTO.setView(recruitment.getView());
		Company company = recruitment.getCompany();
		recruitmentDTO.setCompany(company);
		Category category = recruitment.getCategory();
		recruitmentDTO.setCategory(category);
		return recruitmentDTO;
	}

	@Override
	public Page<RecruitmentDTO> getAllRecruitmentsByCompany(int companyId,
			Pageable pageable) {
		// Lấy danh sách các bài tuyển dụng từ repository
		Page<Recruitment> recruitments = recruitmentDAO.getAllRecruitmentsByCompany(companyId, pageable);

		// Tạo danh sách mới để chứa các DTO
		List<RecruitmentDTO> recruitmentDTOs = new ArrayList<>();

		// Duyệt qua từng Recruitment và chuyển đổi thủ công
		for (Recruitment recruitment : recruitments) {
			RecruitmentDTO recruitmentDTO = convertToDTO(recruitment);
			recruitmentDTOs.add(recruitmentDTO);
		}

		// Trả về Page<RecruitmentDTO>
		return new PageImpl<>(recruitmentDTOs, pageable, recruitments.getTotalElements());
	}

	@Override
	public RecruitmentDTO getRecruitmentDTO(int recruitmentId) {
		// TODO Auto-generated method stub
		Recruitment recruitment = recruitmentDAO.getRecruitment(recruitmentId);
		return convertToDTO(recruitment);
	}

	@Override
	public Page<RecruitmentDTO> getAllRecruitmentsByCategory(int categoryId,
			Pageable pageable) {
		// Lấy danh sách các bài tuyển dụng từ repository
		Page<Recruitment> recruitments = recruitmentDAO.getAllRecruitmentsByCategory(categoryId, pageable);

		// Tạo danh sách mới để chứa các DTO
		List<RecruitmentDTO> recruitmentDTOs = new ArrayList<>();

		// Duyệt qua từng Recruitment và chuyển đổi thủ công
		for (Recruitment recruitment : recruitments) {
			RecruitmentDTO recruitmentDTO = convertToDTO(recruitment);
			recruitmentDTOs.add(recruitmentDTO);
		}

		// Trả về Page<RecruitmentDTO>
		return new PageImpl<>(recruitmentDTOs, pageable, recruitments.getTotalElements());
	}

	@Override
	public RecruitmentDTO getRecruitmentByCompanyId(int companyId) {
		// TODO Auto-generated method stub
		Recruitment recruitment = recruitmentDAO.getRecruitmentByCompanyId(companyId);
		return convertToDTO(recruitment);
	}

	@Override
	public void deleteRecruitment(int recruitmentId) {
		// TODO Auto-generated method stub
		recruitmentDAO.deleteRecruitment(recruitmentId);
	}

	@Override
	public Recruitment getRecruitment(int recruitmentId) {
		// TODO Auto-generated method stub
		return recruitmentDAO.getRecruitment(recruitmentId);
	}

	@Override
	public List<RecruitmentDTO> getAllRecruitmentByCategoryId(int categoryId) {
		// TODO Auto-generated method stub
		List<RecruitmentDTO> recruitmentDTOs = new ArrayList<>();
		for(Recruitment recruitment : recruitmentDAO.getAllRecruitmentByCategoryId(categoryId)) {
			recruitmentDTOs.add(convertToDTO(recruitment));
		}
		return recruitmentDTOs;
	}

	@Override
	public List<RecruitmentDTO> getMostAppliedJobs() {
		// TODO Auto-generated method stub
		List<RecruitmentDTO> recruitmentDTOs = new ArrayList<>();
		for(Recruitment recruitment : recruitmentDAO.getMostAppliedJobs()) {
			recruitmentDTOs.add(convertToDTO(recruitment));
		}
		return recruitmentDTOs;
	}

	@Override
	public Page<RecruitmentDTO> getRecruitmentsDTOByTitle(String recruitmentTitle,
			Pageable pageable) {
		// TODO Auto-generated method stub
		Page<Recruitment> recruitmentPage = recruitmentDAO.getRecruitmentsByTitle(recruitmentTitle, pageable);
		List<RecruitmentDTO> recruitmentDTOs = new ArrayList<>();
		for(Recruitment recruitment : recruitmentPage) {
			recruitmentDTOs.add(convertToDTO(recruitment));
		}
		return new PageImpl<>(recruitmentDTOs, pageable, recruitmentPage.getTotalElements());
	}
	@Override
	public Page<RecruitmentDTO> getRecruitmentsDTOByNameCompany(String nameCompany, Pageable pageable) {
		// TODO Auto-generated method stub
		Page<Recruitment> recruitmentPage = recruitmentDAO.getRecruitmentsByNameCompany(nameCompany, pageable);
		List<RecruitmentDTO> recruitmentDTOs = new ArrayList<>();
		for(Recruitment recruitment : recruitmentPage) {
			recruitmentDTOs.add(convertToDTO(recruitment));
		}
		return new PageImpl<>(recruitmentDTOs, pageable, recruitmentPage.getTotalElements());
	}

	@Override
	public Page<RecruitmentDTO> getRecruitmentsDTOByAddress(String address, Pageable pageable) {
		// TODO Auto-generated method stub
		Page<Recruitment> recruitmentPage = recruitmentDAO.getRecruitmentsByAddress(address, pageable);
		List<RecruitmentDTO> recruitmentDTOs = new ArrayList<>();
		for(Recruitment recruitment : recruitmentPage) {
			recruitmentDTOs.add(convertToDTO(recruitment));
		}
		return new PageImpl<>(recruitmentDTOs, pageable, recruitmentPage.getTotalElements());
	}

	@Override
	public Page<RecruitmentDTO> searchRecruitments(String title, String type, String address, Pageable pageable) {
		// TODO Auto-generated method stub
		Page<Recruitment> recruitmentPage = recruitmentDAO.searchRecruitments(title, type, address, pageable);
		List<RecruitmentDTO> recruitmentDTOs = new ArrayList<>();
		for(Recruitment recruitment : recruitmentPage) {
			recruitmentDTOs.add(convertToDTO(recruitment));
		}
		return new PageImpl<>(recruitmentDTOs, pageable, recruitmentPage.getTotalElements());
	}

}
