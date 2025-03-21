package com.assignment02.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.assignment02.dto.CompanyStatsDTO;
import com.assignment02.entity.Company;

public interface CompanyRepository extends JpaRepository<Company, Integer> {
	Company findByUserId(int userId);
	// trả về danh sách công ty có số lượng ứng tuyển cao nhất
	@Query("SELECT new com.assignment02.dto.CompanyStatsDTO(c, COUNT(a.id)) " + "FROM Company c "
			+ "LEFT JOIN c.recruitments r " + "LEFT JOIN r.applyPosts a " + "GROUP BY c " + "ORDER BY COUNT(a.id) DESC")
	List<CompanyStatsDTO> findTopCompaniesWithApplicationCount();

}
