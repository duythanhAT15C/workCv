package com.assignment02.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.assignment02.config.MyUserDetails;
import com.assignment02.dto.RecruitmentDTO;
import com.assignment02.entity.Recruitment;

public interface RecruitmentService {
	public void saveRecruitment(RecruitmentDTO recruitmentDTO, MyUserDetails myUserDetails, int recruitmentId);

	public Page<RecruitmentDTO> getAllRecruitmentsByCompany(int companyId, Pageable pageable);

	public Page<RecruitmentDTO> getAllRecruitmentsByCategory(int categoryId, Pageable pageable);

	public RecruitmentDTO getRecruitmentDTO(int recruitmentId);

	public Recruitment getRecruitment(int recruitmentId);

	public RecruitmentDTO getRecruitmentByCompanyId(int companyId);

	public void deleteRecruitment(int recruitmentId);

	public List<RecruitmentDTO> getAllRecruitmentByCategoryId(int categoryId);

	public List<RecruitmentDTO> getMostAppliedJobs();
	public Page<RecruitmentDTO> getRecruitmentsDTOByTitle(String recruitmentTitle, Pageable pageable);
	public Page<RecruitmentDTO> getRecruitmentsDTOByNameCompany(String nameCompany, Pageable pageable);
	public Page<RecruitmentDTO> getRecruitmentsDTOByAddress(String address, Pageable pageable);
	public Page<RecruitmentDTO> searchRecruitments(String title, String type, String address, Pageable pageable);

}
