package com.assignment02.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import com.assignment02.dao.ApplyJobDAO;
import com.assignment02.entity.ApplyJob;
import com.assignment02.repository.ApplyJobRepository;
import com.assignment02.repository.RepositoryCustom;
@Repository
public class ApplyJobDAOImpl implements ApplyJobDAO {
	@Autowired
	private ApplyJobRepository applyJobRepository;
	@Autowired
	private RepositoryCustom repositoryCustom;
	@Override
	public void saveApplyJob(ApplyJob applyJob) {
		// TODO Auto-generated method stub
		applyJobRepository.save(applyJob);
	}
	@Override
	public List<ApplyJob> getApplyJobsByUserIdAndRecruitmentId(int userId, int recruitmentId) {
		// TODO Auto-generated method stub
		return applyJobRepository.findByUserIdAndRecruitmentId(userId, recruitmentId);
	}
	@Override
	public Page<ApplyJob> getAllApplyJobByRecruitmentId(int recruitmentId, Pageable pageable) {
		// TODO Auto-generated method stub
		return applyJobRepository.findByRecruitmentId(recruitmentId, pageable);
	}
	@Override
	public Page<ApplyJob> getAllApplyJobByUserId(int userId, Pageable pageable) {
		// TODO Auto-generated method stub
		return applyJobRepository.findByUserId(userId, pageable);
	}
	@Override
	public ApplyJob getApplyJobById(int applyJobId) {
		// TODO Auto-generated method stub
		return applyJobRepository.findById(applyJobId).orElse(new ApplyJob());
	}
	@Override
	public List<ApplyJob> getAllApplyJobsByRecruitmentId(int recruitmentId) {
		// TODO Auto-generated method stub
		return applyJobRepository.findByRecruitmentId(recruitmentId);
	}
	@Override
	public void deleteApplyJob(int applyJobId) {
		// TODO Auto-generated method stub
		long count = applyJobRepository.count();
		applyJobRepository.deleteByApplyJobId(applyJobId);
		
		if (count == 1) {
			repositoryCustom.resetAutoIncrementApplyJob();
		}
	}
	@Override
	public List<ApplyJob> getApplyJobs() {
		// TODO Auto-generated method stub
		return applyJobRepository.findAll();
	}
	@Override
	public Page<ApplyJob> getAllApplyJobByStatus(int status, Pageable pageable) {
		// TODO Auto-generated method stub
		return applyJobRepository.findByStatus(status, pageable);
	}

}
