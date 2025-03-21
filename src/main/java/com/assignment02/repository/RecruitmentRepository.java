package com.assignment02.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.assignment02.entity.Recruitment;

@Repository
public interface RecruitmentRepository extends JpaRepository<Recruitment, Integer> {
	Page<Recruitment> findByCompanyId(int companyId, Pageable pageable);

	Page<Recruitment> findByCategoryId(int categoryId, Pageable pageable);

	Recruitment findByCompanyId(int companyId);

	long count();

	List<Recruitment> findByCategoryId(int categoryId);

	// Tìm công việc có số lượng ứng tuyển cao nhất
	@Query("SELECT r FROM Recruitment r LEFT JOIN r.applyPosts a GROUP BY r.id HAVING COUNT(a) = (SELECT MAX(r2.applyPosts.size) FROM Recruitment r2)")
	List<Recruitment> findMostAppliedJobs();

	@Query("SELECT r FROM Recruitment r WHERE LOWER(r.title) LIKE LOWER(CONCAT('%', :recruitmentTitle, '%'))")
	Page<Recruitment> searchByTitle(@Param("recruitmentTitle") String recruitmentTitle, Pageable pageable);

	@Query("SELECT r FROM Recruitment r WHERE LOWER(r.company.nameCompany) LIKE LOWER(CONCAT('%', :nameCompany, '%'))")
	Page<Recruitment> searchByCompanyName(@Param("nameCompany") String nameCompany, Pageable pageable);

	@Query("SELECT r FROM Recruitment r WHERE r.address = :address")
	Page<Recruitment> searchByAddress(@Param("address") String address, Pageable pageable);

	@Query("SELECT r FROM Recruitment r WHERE " + "(:title IS NULL OR :title = '' OR r.title LIKE %:title%) AND "
			+ "(:type IS NULL OR :type = '' OR r.type LIKE %:type%) AND "
			+ "(:address IS NULL OR :address = '' OR r.address LIKE %:address%)")
	Page<Recruitment> searchRecruitments(@Param("title") String title, @Param("type") String type,
			@Param("address") String address, Pageable pageable);

}
