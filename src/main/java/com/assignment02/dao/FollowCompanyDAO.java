package com.assignment02.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.assignment02.entity.FollowCompany;

public interface FollowCompanyDAO {
	public void saveFollowCompany(FollowCompany followCompany);
	public boolean checkExistFollowCompany(int userId, int companyId);
	public void deleteFollowCompany(int userId, int companyId);
	public Page<FollowCompany> getAllFollowCompanyByCompany(int companyId, Pageable pageable);
	public Page<FollowCompany> getAllFollowCompanyByUser(int userId, Pageable pageable);
}
