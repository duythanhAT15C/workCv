package com.assignment02.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.assignment02.dto.ApplyJobDTO;
import com.assignment02.entity.ApplyJob;

public interface ApplyJobService {
	public void saveApplyJob(ApplyJobDTO applyJobDTO);
	public List<ApplyJobDTO> getApplyJobs();
	public List<ApplyJobDTO> getApplyJobsDTOByUserIdAndRecruitmentId(int userId, int recruitmentId);
	public Page<ApplyJobDTO> getAllApplyJobByRecruitmentId(int recruitmentId, Pageable pageable
			);

	public Page<ApplyJobDTO> getAllApplyJobByUserId(int userId, Pageable pageable
			);
	public ApplyJobDTO getApplyJobDTOById(int applyJobId);
	public List<ApplyJobDTO> getAllApplyJobsByRecruitmentId(int recruitmentId);
	public void deleteApplyJob(int applyJobId);
	public Page<ApplyJob> getAllApplyJobByStatus(int status, Pageable pageable);
}
