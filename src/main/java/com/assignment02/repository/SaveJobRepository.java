package com.assignment02.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.assignment02.entity.SaveJob;

public interface SaveJobRepository extends JpaRepository<SaveJob, Integer> {
	// Kiểm tra xem có bản ghi nào với user_id và recruitment_id không
	@Query("SELECT CASE WHEN COUNT(s) > 0 THEN true ELSE false END FROM SaveJob s WHERE s.user.id = :userId AND s.recruitment.id = :recruitmentId")
	boolean existsByUserIdAndRecruitmentId(@Param("userId") int userId, @Param("recruitmentId") int recruitmentId);

	// Xóa bản ghi SaveJob theo userId và recruitmentId
	@Modifying
	@Transactional
	@Query("DELETE FROM SaveJob s WHERE s.user.id = :userId AND s.recruitment.id = :recruitmentId")
	void deleteByUserIdAndRecruitmentId(@Param("userId") int userId, @Param("recruitmentId") int recruitmentId);

	long count();

	@Query("SELECT s FROM SaveJob s WHERE s.recruitment.id = :recruitmentId")
	List<SaveJob> findByRecruitmentId(@Param("recruitmentId") int recruitmentId);

	Page<SaveJob> findByRecruitmentId(int recruitmentId, Pageable pageable);

	Page<SaveJob> findByUserId(int userId, Pageable pageable);
}
