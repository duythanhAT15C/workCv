package com.assignment02.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.assignment02.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer> {
	Category findById(int categoryId);

	@Query("SELECT c FROM Category c ORDER BY c.numberChoose DESC")
	List<Category> findTopCategories(Pageable pageable);
}
