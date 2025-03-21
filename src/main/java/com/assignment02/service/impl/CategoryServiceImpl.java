package com.assignment02.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.assignment02.dao.CategoryDAO;
import com.assignment02.dto.CategoryDTO;
import com.assignment02.entity.Category;
import com.assignment02.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDAO categoryDAO;

	@Override
	public List<CategoryDTO> listCategories() {
		List<Category> category = categoryDAO.listCategories();
		return converListToDTO(category);
	}
	
	public List<CategoryDTO> converListToDTO(List<Category> listCategories){
		List<CategoryDTO> listCategoryDTOs = new ArrayList<>();
		for(Category category : listCategories) {
			CategoryDTO categoryDTO = new CategoryDTO();
			categoryDTO.setId(category.getId());
			categoryDTO.setName(category.getName());
			categoryDTO.setNumberChoose(category.getNumberChoose());
			listCategoryDTOs.add(categoryDTO);
		}
		return listCategoryDTOs;
	}

	public CategoryDTO converToDTO(Category category){
		CategoryDTO categoryDTO = new CategoryDTO();
		categoryDTO.setId(category.getId());
		categoryDTO.setName(category.getName());
		categoryDTO.setNumberChoose(category.getNumberChoose());
		return categoryDTO;
	}

	@Override
	public CategoryDTO getCategoryDTO(int categoryId) {
		// TODO Auto-generated method stub
		Category category = categoryDAO.getCategory(categoryId);
		return converToDTO(category);
	}

	@Override
	public Category getCategory(int categoryId) {
		// TODO Auto-generated method stub
		return categoryDAO.getCategory(categoryId);
	}

	@Override
	public List<CategoryDTO> getTopCategories() {
		// TODO Auto-generated method stub
		Pageable pageable = PageRequest.of(0, 4);
		List<Category> category = categoryDAO.getTopCategories(pageable);
		return converListToDTO(category);
	}
}
