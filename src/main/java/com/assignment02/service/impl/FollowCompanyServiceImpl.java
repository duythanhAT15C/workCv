package com.assignment02.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.assignment02.dao.FollowCompanyDAO;
import com.assignment02.dto.FollowCompanyDTO;
import com.assignment02.entity.FollowCompany;
import com.assignment02.service.FollowCompanyService;

@Service
public class FollowCompanyServiceImpl implements FollowCompanyService {
	@Autowired
	private FollowCompanyDAO followCompanyDAO;

	@Override
	public void saveFollowCompany(FollowCompanyDTO followCompanyDTO) {
		// TODO Auto-generated method stub
		FollowCompany followCompany = convertToEntity(followCompanyDTO);
		followCompanyDAO.saveFollowCompany(followCompany);
	}

	public FollowCompany convertToEntity(FollowCompanyDTO followCompanyDTO) {
		if (followCompanyDTO == null) {
			return null;
		}
		FollowCompany followCompany = new FollowCompany();
		followCompany.setUser(followCompanyDTO.getUser());
		followCompany.setCompany(followCompanyDTO.getCompany());
		return followCompany;
	}

	public FollowCompanyDTO convertToDTO(FollowCompany followCompany) {
		if (followCompany == null) {
			return null;
		}
		FollowCompanyDTO followCompanyDTO = new FollowCompanyDTO();
		followCompanyDTO.setId(followCompany.getId());
		followCompanyDTO.setUser(followCompany.getUser());
		followCompanyDTO.setCompany(followCompany.getCompany());
		return followCompanyDTO;
	}

	@Override
	public boolean checkExistFollowCompany(int userId, int companyId) {
		// TODO Auto-generated method stub
		return followCompanyDAO.checkExistFollowCompany(userId, companyId);
	}

	@Override
	public void deleteFollowCompany(int userId, int companyId) {
		// TODO Auto-generated method stub
		followCompanyDAO.deleteFollowCompany(userId, companyId);
	}

	@Override
	public Page<FollowCompanyDTO> getAllFollowCompanyByCompany(int companyId, Pageable pageable) {
		// TODO Auto-generated method stub
		// Lấy danh sách các bài tuyển dụng từ repository
		Page<FollowCompany> followCompanyPage = followCompanyDAO.getAllFollowCompanyByCompany(companyId, pageable);

		// Tạo danh sách mới để chứa các DTO
		List<FollowCompanyDTO> followCompanyDTOs = new ArrayList<>();

		// Duyệt qua từng Recruitment và chuyển đổi thủ công
		for (FollowCompany followCompany : followCompanyPage) {
			FollowCompanyDTO followCompanyDTO = convertToDTO(followCompany);
			followCompanyDTOs.add(followCompanyDTO);
		}

		// Trả về Page<RecruitmentDTO>
		return new PageImpl<>(followCompanyDTOs, pageable, followCompanyPage.getTotalElements());
	}

	@Override
	public Page<FollowCompanyDTO> getAllFollowCompanyByUser(int userId, Pageable pageable) {
		// TODO Auto-generated method stub
		// Lấy danh sách các bài tuyển dụng từ repository
		Page<FollowCompany> followCompanyPage = followCompanyDAO.getAllFollowCompanyByUser(userId, pageable);

		// Tạo danh sách mới để chứa các DTO
		List<FollowCompanyDTO> followCompanyDTOs = new ArrayList<>();

		// Duyệt qua từng Recruitment và chuyển đổi thủ công
		for (FollowCompany followCompany : followCompanyPage) {
			FollowCompanyDTO followCompanyDTO = convertToDTO(followCompany);
			followCompanyDTOs.add(followCompanyDTO);
		}

		// Trả về Page<RecruitmentDTO>
		return new PageImpl<>(followCompanyDTOs, pageable, followCompanyPage.getTotalElements());
	}
}
