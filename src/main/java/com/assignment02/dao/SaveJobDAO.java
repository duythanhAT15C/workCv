package com.assignment02.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.assignment02.entity.SaveJob;

public interface SaveJobDAO {
	public void saveJob(SaveJob saveJob);
	public boolean checkExistSaveJob(int userId, int recruitmentId);
	public void deleteSaveJob(int userId, int recruitmentId);
	public Page<SaveJob> getAllSaveJobDTOByRecruitmentId(int recruitmentId, Pageable pageable);
	public Page<SaveJob> getAllSaveJobDTOByUserId(int userId, Pageable pageable);
}
