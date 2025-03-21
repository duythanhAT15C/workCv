package com.assignment02.service;

import java.util.List;
import com.assignment02.dto.CategoryDTO;
import com.assignment02.entity.Category;

public interface CategoryService {
	public List<CategoryDTO> listCategories();
	public CategoryDTO getCategoryDTO(int categoryId);
	public Category getCategory(int categoryId);
	public List<CategoryDTO> getTopCategories();
}

