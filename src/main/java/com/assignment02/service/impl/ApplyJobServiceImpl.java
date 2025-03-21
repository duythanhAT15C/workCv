package com.assignment02.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.assignment02.dao.ApplyJobDAO;
import com.assignment02.dto.ApplyJobDTO;
import com.assignment02.entity.ApplyJob;
import com.assignment02.service.ApplyJobService;

@Service
public class ApplyJobServiceImpl implements ApplyJobService {
	@Autowired
	private ApplyJobDAO applyJobDAO;

	@Override
	public void saveApplyJob(ApplyJobDTO applyJobDTO) {
		// TODO Auto-generated method stub
		ApplyJob applyJob = convertToEntity(applyJobDTO);
		applyJobDAO.saveApplyJob(applyJob);
	}
	// convert từ dto sang entity
	public ApplyJob convertToEntity(ApplyJobDTO applyJobDTO) {
		if (applyJobDTO == null) {
			return null;
		}
		ApplyJob applyJob = new ApplyJob();
		applyJob.setId(applyJobDTO.getId());
		applyJob.setCreatedAt(applyJobDTO.getCreatedAt());
		applyJob.setNameCv(applyJobDTO.getNameCv());
		applyJob.setRecruitment(applyJobDTO.getRecruitment());
		applyJob.setStatus(applyJobDTO.getStatus());
		applyJob.setText(applyJobDTO.getText());
		applyJob.setUser(applyJobDTO.getUser());
		return applyJob;
	}
	// convert từ entity sang dto
	public ApplyJobDTO convertToDTO(ApplyJob applyJob) {
		if (applyJob == null) {
			return null;
		}
		ApplyJobDTO applyJobDTO = new ApplyJobDTO();
		applyJobDTO.setId(applyJob.getId());
		applyJobDTO.setCreatedAt(applyJob.getCreatedAt());
		applyJobDTO.setNameCv(applyJob.getNameCv());
		applyJobDTO.setRecruitment(applyJob.getRecruitment());
		applyJobDTO.setStatus(applyJob.getStatus());
		applyJobDTO.setText(applyJob.getText());
		applyJobDTO.setUser(applyJob.getUser());
		return applyJobDTO;
	}

	@Override
	public List<ApplyJobDTO> getApplyJobsDTOByUserIdAndRecruitmentId(int userId, int recruitmentId) {
		// TODO Auto-generated method stub
		List<ApplyJob> listApplyJobs = applyJobDAO.getApplyJobsByUserIdAndRecruitmentId(userId, recruitmentId);
		List<ApplyJobDTO> lisApplyJobDTOs = new ArrayList<>();
		for (ApplyJob applyJob : listApplyJobs) {
			lisApplyJobDTOs.add(convertToDTO(applyJob));
		}
		return lisApplyJobDTOs;
	}

	@Override
	public Page<ApplyJobDTO> getAllApplyJobByRecruitmentId(int recruitmentId, Pageable pageable) {
		// TODO Auto-generated method stub
		// Lấy danh sách các bài tuyển dụng từ repository
		Page<ApplyJob> applyJobs = applyJobDAO.getAllApplyJobByRecruitmentId(recruitmentId, pageable);

		// Tạo danh sách mới để chứa các DTO
		List<ApplyJobDTO> applyJobDTOs = new ArrayList<>();

		// Duyệt qua từng Recruitment và chuyển đổi thủ công
		for (ApplyJob applyJob : applyJobs) {
			ApplyJobDTO applyJobDTO = convertToDTO(applyJob);
			applyJobDTOs.add(applyJobDTO);
		}

		// Trả về Page<RecruitmentDTO>
		return new PageImpl<>(applyJobDTOs, pageable, applyJobs.getTotalElements());
	}

	@Override
	public Page<ApplyJobDTO> getAllApplyJobByUserId(int userId, Pageable pageable) {
		// TODO Auto-generated method stub
		// Lấy danh sách các bài tuyển dụng từ repository
		Page<ApplyJob> applyJobs = applyJobDAO.getAllApplyJobByUserId(userId, pageable);

		// Tạo danh sách mới để chứa các DTO
		List<ApplyJobDTO> applyJobDTOs = new ArrayList<>();

		// Duyệt qua từng Recruitment và chuyển đổi thủ công
		for (ApplyJob applyJob : applyJobs) {
			ApplyJobDTO applyJobDTO = convertToDTO(applyJob);
			applyJobDTOs.add(applyJobDTO);
		}

		// Trả về Page<RecruitmentDTO>
		return new PageImpl<>(applyJobDTOs, pageable, applyJobs.getTotalElements());
	}

	@Override
	public ApplyJobDTO getApplyJobDTOById(int applyJobId) {
		// TODO Auto-generated method stub
		ApplyJob applyJob = applyJobDAO.getApplyJobById(applyJobId);
		return convertToDTO(applyJob);
	}

	@Override
	public List<ApplyJobDTO> getAllApplyJobsByRecruitmentId(int recruitmentId) {
		// TODO Auto-generated method stub
		List<ApplyJob> applyJobs = applyJobDAO.getAllApplyJobsByRecruitmentId(recruitmentId);
		List<ApplyJobDTO> applyJobDTOs = new ArrayList<>();
		for(ApplyJob applyJob : applyJobs) {
			ApplyJobDTO applyJobDTO = convertToDTO(applyJob);
			applyJobDTOs.add(applyJobDTO);
		}
		return applyJobDTOs;
	}

	@Override
	public void deleteApplyJob(int applyJobId) {
		// TODO Auto-generated method stub
		applyJobDAO.deleteApplyJob(applyJobId);
	}

	@Override
	public List<ApplyJobDTO> getApplyJobs() {
		// TODO Auto-generated method stub
		List<ApplyJobDTO> applyJobDTOs = new ArrayList<>();
		for(ApplyJob applyJob : applyJobDAO.getApplyJobs()) {
			ApplyJobDTO applyJobDTO = convertToDTO(applyJob);
			applyJobDTOs.add(applyJobDTO);
		}
		return applyJobDTOs;
	}

	@Override
	public Page<ApplyJob> getAllApplyJobByStatus(int status, Pageable pageable) {
		// TODO Auto-generated method stub
		return applyJobDAO.getAllApplyJobByStatus(status, pageable);
	}
}
