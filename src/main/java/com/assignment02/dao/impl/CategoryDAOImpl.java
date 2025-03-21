package com.assignment02.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import com.assignment02.dao.CategoryDAO;
import com.assignment02.entity.Category;
import com.assignment02.repository.CategoryRepository;

@Repository
public class CategoryDAOImpl implements CategoryDAO {
	@Autowired
	private CategoryRepository categoryRepository;
	@Override
	public List<Category> listCategories() {
		// TODO Auto-generated method stub
		return categoryRepository.findAll();
	}
	@Override
	public Category getCategory(int categoryId) {
		// TODO Auto-generated method stub
		return categoryRepository.findById(categoryId);
	}
	@Override
	public List<Category> getTopCategories(Pageable pageable) {
		// TODO Auto-generated method stub
		return categoryRepository.findTopCategories(pageable);
	}

}
