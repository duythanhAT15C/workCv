package com.assignment02.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import com.assignment02.dao.FollowCompanyDAO;
import com.assignment02.entity.FollowCompany;
import com.assignment02.repository.FollowCompanyRepository;
import com.assignment02.repository.RepositoryCustom;
@Repository
public class FollowCompanyDAOImpl implements FollowCompanyDAO {
	@Autowired
	private FollowCompanyRepository followCompanyRepository;
	@Autowired
	private RepositoryCustom repositoryCustom;

	@Override
	public void saveFollowCompany(FollowCompany followCompany) {
		// TODO Auto-generated method stub
		followCompanyRepository.save(followCompany);
	}
	@Override
	public boolean checkExistFollowCompany(int userId, int companyId) {
		// TODO Auto-generated method stub
		return followCompanyRepository.existsByUserIdAndCompanyId(userId, companyId);
	}
	@Override
	public void deleteFollowCompany(int userId, int companyId) {
		// TODO Auto-generated method stub
		long count = followCompanyRepository.count();
		followCompanyRepository.deleteByUserIdAndCompanyId(userId, companyId);
		if(count == 1) {
			repositoryCustom.resetAutoIncrementFollowCompany();
		}
	}
	@Override
	public Page<FollowCompany> getAllFollowCompanyByCompany(int companyId, Pageable pageable) {
		// TODO Auto-generated method stub
		return followCompanyRepository.findByCompanyId(companyId, pageable);
	}
	@Override
	public Page<FollowCompany> getAllFollowCompanyByUser(int userId, Pageable pageable) {
		// TODO Auto-generated method stub
		return followCompanyRepository.findByUserId(userId, pageable);
	}

}
