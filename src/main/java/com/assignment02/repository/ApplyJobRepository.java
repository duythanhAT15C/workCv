package com.assignment02.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.assignment02.entity.ApplyJob;

public interface ApplyJobRepository extends JpaRepository<ApplyJob, Integer> {
	// tìm danh sách apply job theo userid và recruitmentid
	List<ApplyJob> findByUserIdAndRecruitmentId(int userId, int recruitmentId);
	// tìm danh sách apply job theo recruitmentid và phân trang
	Page<ApplyJob> findByRecruitmentId(int recruitmentId, Pageable pageable);
	// tìm danh sách apply job theo userid và phân trang
	Page<ApplyJob> findByUserId(int userId, Pageable pageable);
	// tìm danh sách apply job theo recruitmentid
	List<ApplyJob> findByRecruitmentId(int recruitmentId);

	long count();

	// Xóa bản ghi SaveJob theo userId và recruitmentId
	@Modifying
	@Transactional
	@Query("DELETE FROM ApplyJob a WHERE a.id = :applyJobId")
	void deleteByApplyJobId(@Param("applyJobId") int applyJobId);
	Page<ApplyJob> findByStatus(int status, Pageable pageable);
}
