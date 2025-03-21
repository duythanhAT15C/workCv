package com.assignment02.config;

import org.springframework.data.repository.CrudRepository;
import com.assignment02.entity.Company;
public interface CompanyRepository extends CrudRepository<Company, Long>{
	
}
