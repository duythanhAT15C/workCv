package com.assignment02.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.assignment02.dto.FollowCompanyDTO;

public interface FollowCompanyService {
	public void saveFollowCompany(FollowCompanyDTO followCompanyDTO);
	public boolean checkExistFollowCompany(int userId, int companyId);
	public void deleteFollowCompany(int userId, int companyId);
	public Page<FollowCompanyDTO> getAllFollowCompanyByCompany(int companyId, Pageable pageable);
	public Page<FollowCompanyDTO> getAllFollowCompanyByUser(int userId, Pageable pageable);
}
