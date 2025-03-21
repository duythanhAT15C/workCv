package com.assignment02.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.assignment02.entity.Cv;

public interface CvRepository extends JpaRepository<Cv, Integer> {
	Cv findCvById(int cvId);

	long count();

	Cv findByUserId(int userId);

}
