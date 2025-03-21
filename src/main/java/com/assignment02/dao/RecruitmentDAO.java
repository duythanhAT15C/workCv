package com.assignment02.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.assignment02.config.MyUserDetails;
import com.assignment02.entity.Recruitment;

public interface RecruitmentDAO {
	public void saveRecruitment(Recruitment recruitment, MyUserDetails myUserDetails, int recruitmentId);
	public Recruitment getRecruitment(int recruitmentId);
	public Page<Recruitment> getAllRecruitmentsByCompany(int companyId, Pageable pageable);
	public Page<Recruitment> getAllRecruitmentsByCategory(int categoryId, Pageable pageable);
	public Recruitment getRecruitmentByCompanyId(int companyId);
	public void deleteRecruitment(int recruitmentId);
	public List<Recruitment> getAllRecruitmentByCategoryId(int categoryId);
	public List<Recruitment> getMostAppliedJobs();
	public Page<Recruitment> getRecruitmentsByTitle(String recruitmentTitle, Pageable pageable);
	public Page<Recruitment> getRecruitmentsByNameCompany(String nameCompany, Pageable pageable);
	public Page<Recruitment> getRecruitmentsByAddress(String address, Pageable pageable);
	public Page<Recruitment> searchRecruitments(String title, String type, String address, Pageable pageable);
}
