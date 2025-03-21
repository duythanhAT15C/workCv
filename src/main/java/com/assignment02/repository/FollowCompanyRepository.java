package com.assignment02.repository;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.assignment02.entity.FollowCompany;

public interface FollowCompanyRepository extends JpaRepository<FollowCompany, Integer> {
	// Kiểm tra xem có bản ghi nào với user_id và recruitment_id không
	@Query("SELECT CASE WHEN COUNT(f) > 0 THEN true ELSE false END FROM FollowCompany f WHERE f.user.id = :userId AND f.company.id = :companyId")
	boolean existsByUserIdAndCompanyId(@Param("userId") int userId, @Param("companyId") int companyId);

	// Xóa bản ghi SaveJob theo userId và recruitmentId
	@Modifying
	@Transactional
	@Query("DELETE FROM FollowCompany f WHERE f.user.id = :userId AND f.company.id = :companyId")
	void deleteByUserIdAndCompanyId(@Param("userId") int userId, @Param("companyId") int companyId);

	long count();

	Page<FollowCompany> findByCompanyId(int companyId, Pageable pageable);

	Page<FollowCompany> findByUserId(int userId, Pageable pageable);

}
