package com.assignment02.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.assignment02.entity.ApplyJob;

public interface ApplyJobDAO {
	public void saveApplyJob(ApplyJob applyJob);
	public List<ApplyJob> getApplyJobs();
	public List<ApplyJob> getApplyJobsByUserIdAndRecruitmentId(int userId, int recruitmentId);
	public Page<ApplyJob> getAllApplyJobByRecruitmentId(int recruitmentId, Pageable pageable);
	public Page<ApplyJob> getAllApplyJobByUserId(int userId, Pageable pageable);
	public ApplyJob getApplyJobById(int applyJobId);
	public List<ApplyJob> getAllApplyJobsByRecruitmentId(int recruitmentId);
	public void deleteApplyJob(int applyJobId);
	public Page<ApplyJob> getAllApplyJobByStatus(int status, Pageable pageable);
}
