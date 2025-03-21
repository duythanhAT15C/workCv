package com.assignment02.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.assignment02.config.MyUserDetails;
import com.assignment02.dto.SaveJobDTO;

public interface SaveJobService {
	public void saveJob(SaveJobDTO saJobDTO);
	public boolean checkExistSaveJob(int userId, int recruitmentId);
	public void deleteSaveJob(int userId, int recruitmentId);
	public Page<SaveJobDTO> getAllSaveJobDTOByRecruitmentId(int recruitmentId, Pageable pageable,
			MyUserDetails currentUser);

	public Page<SaveJobDTO> getAllSaveJobDTOByUserId(int userId, Pageable pageable,
			MyUserDetails currentUser);
}
