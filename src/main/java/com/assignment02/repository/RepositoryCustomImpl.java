package com.assignment02.repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

@Repository
public class RepositoryCustomImpl implements RepositoryCustom {
	@PersistenceContext
	private EntityManager entityManager;
	
	
	@Override
	@Transactional
	public void resetAutoIncrementCv() {
		// TODO Auto-generated method stub
		entityManager.createNativeQuery("ALTER TABLE Cv AUTO_INCREMENT = 1").executeUpdate();
	}

	@Override
	@Transactional
	public void resetAutoIncrementRecruitment() {
		// TODO Auto-generated method stub
		entityManager.createNativeQuery("ALTER TABLE recruitment AUTO_INCREMENT = 1").executeUpdate();
	}

	@Override
	@Transactional
	public void resetAutoIncrementSaveJob() {
		// TODO Auto-generated method stub
		entityManager.createNativeQuery("ALTER TABLE save_job AUTO_INCREMENT = 1").executeUpdate();
	}

	@Override
	@Transactional
	public void resetAutoIncrementFollowCompany() {
		// TODO Auto-generated method stub
		entityManager.createNativeQuery("ALTER TABLE follow_company AUTO_INCREMENT = 1").executeUpdate();
	}

	@Override
	@Transactional
	public void resetAutoIncrementApplyJob() {
		// TODO Auto-generated method stub
		entityManager.createNativeQuery("ALTER TABLE apply_post AUTO_INCREMENT = 1").executeUpdate();
	}

	

}
