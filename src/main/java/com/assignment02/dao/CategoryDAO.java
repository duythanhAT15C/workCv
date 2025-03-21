package com.assignment02.dao;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.assignment02.entity.Category;

public interface CategoryDAO {
	public List<Category> listCategories();
	public Category getCategory(int categoryId);
	public List<Category> getTopCategories(Pageable pageable);
}
