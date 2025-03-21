package com.assignment02.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import com.assignment02.dao.SaveJobDAO;
import com.assignment02.entity.SaveJob;
import com.assignment02.repository.RepositoryCustom;
import com.assignment02.repository.SaveJobRepository;
@Repository
public class SaveJobDAOImpl implements SaveJobDAO {
	@Autowired
	private SaveJobRepository saveJobRepository;
	@Autowired
	private RepositoryCustom repositoryCustom;
	@Override
	public void saveJob(SaveJob saveJob) {
		// TODO Auto-generated method stub
		saveJobRepository.save(saveJob);
	}
	@Override
	public boolean checkExistSaveJob(int userId, int recruitmentId) {
		// TODO Auto-generated method stub
		return saveJobRepository.existsByUserIdAndRecruitmentId(userId, recruitmentId);
	}
	@Override
	public void deleteSaveJob(int userId, int recruitmentId) {
		// TODO Auto-generated method stub
		// biến count đếm trong db có còn bản ghi nào không
		long count = saveJobRepository.count();
		saveJobRepository.deleteByUserIdAndRecruitmentId(userId, recruitmentId);
		
		if (count == 1) { // nếu trong db còn 1 bản ghi thì reset stt về 1
			repositoryCustom.resetAutoIncrementSaveJob();
		}
	}
	@Override
	public Page<SaveJob> getAllSaveJobDTOByRecruitmentId(int recruitmentId, Pageable pageable) {
		// TODO Auto-generated method stub
		return saveJobRepository.findByRecruitmentId(recruitmentId, pageable);
	}
	@Override
	public Page<SaveJob> getAllSaveJobDTOByUserId(int userId, Pageable pageable) {
		// TODO Auto-generated method stub
		return saveJobRepository.findByUserId(userId, pageable);
	}

}
