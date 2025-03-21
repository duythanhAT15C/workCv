package com.assignment02.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.assignment02.config.MyUserDetails;
import com.assignment02.dao.SaveJobDAO;
import com.assignment02.dto.SaveJobDTO;
import com.assignment02.entity.SaveJob;
import com.assignment02.service.SaveJobService;

@Service
public class SaveJobServiceImpl implements SaveJobService {
	@Autowired
	private SaveJobDAO saveJobDAO;

	@Override
	public void saveJob(SaveJobDTO saveJobDTO) {
		// TODO Auto-generated method stub
		SaveJob saveJob = convertToEntity(saveJobDTO);
		saveJobDAO.saveJob(saveJob);
	}

	public SaveJob convertToEntity(SaveJobDTO saveJobDTO) {
		if (saveJobDTO == null) {
			return null;
		}
		SaveJob saveJob = new SaveJob();
		saveJob.setUser(saveJobDTO.getUser());
		saveJob.setRecruitment(saveJobDTO.getRecruitment());
		return saveJob;
	}

	public SaveJobDTO convertToDTO(SaveJob saveJob) {
		if (saveJob == null) {
			return null;
		}
		SaveJobDTO saveJobDTO = new SaveJobDTO();
		saveJobDTO.setId(saveJob.getId());
		saveJobDTO.setUser(saveJob.getUser());
		saveJobDTO.setRecruitment(saveJob.getRecruitment());
		return saveJobDTO;
	}

	@Override
	public boolean checkExistSaveJob(int userId, int recruitmentId) {
		// TODO Auto-generated method stub
		return saveJobDAO.checkExistSaveJob(userId, recruitmentId);
	}

	@Override
	public void deleteSaveJob(int userId, int recruitmentId) {
		// TODO Auto-generated method stub
		saveJobDAO.deleteSaveJob(userId, recruitmentId);
	}

	@Override
	public Page<SaveJobDTO> getAllSaveJobDTOByRecruitmentId(int recruitmentId, Pageable pageable,
			MyUserDetails currentUser) {
		// TODO Auto-generated method stub
		// Lấy danh sách các bài tuyển dụng từ repository
		Page<SaveJob> saveJobPage = saveJobDAO.getAllSaveJobDTOByRecruitmentId(recruitmentId, pageable);

		// Tạo danh sách mới để chứa các DTO
		List<SaveJobDTO> saveJobDTOs = new ArrayList<>();

		// Duyệt qua từng Recruitment và chuyển đổi thủ công
		for (SaveJob saveJob : saveJobPage) {
			SaveJobDTO saveJobDTO = convertToDTO(saveJob);
			saveJobDTOs.add(saveJobDTO);
		}

		// Trả về Page<RecruitmentDTO>
		return new PageImpl<>(saveJobDTOs, pageable, saveJobPage.getTotalElements());
	}

	@Override
	public Page<SaveJobDTO> getAllSaveJobDTOByUserId(int userId, Pageable pageable, MyUserDetails currentUser) {
		// TODO Auto-generated method stub
		// Lấy danh sách các bài tuyển dụng từ repository
		Page<SaveJob> saveJobPage = saveJobDAO.getAllSaveJobDTOByUserId(userId, pageable);

		// Tạo danh sách mới để chứa các DTO
		List<SaveJobDTO> saveJobDTOs = new ArrayList<>();

		// Duyệt qua từng Recruitment và chuyển đổi thủ công
		for (SaveJob saveJob : saveJobPage) {
			SaveJobDTO saveJobDTO = convertToDTO(saveJob);
			saveJobDTOs.add(saveJobDTO);
		}

		// Trả về Page<RecruitmentDTO>
		return new PageImpl<>(saveJobDTOs, pageable, saveJobPage.getTotalElements());
	}
}
