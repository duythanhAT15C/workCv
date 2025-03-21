package com.assignment02.service.impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.assignment02.config.MyUserDetails;
import com.assignment02.dao.CvDAO;
import com.assignment02.dao.UserDAO;
import com.assignment02.dto.CvDTO;
import com.assignment02.entity.Cv;
import com.assignment02.entity.User;
import com.assignment02.service.CvService;

@Service
public class CvServiceImpl implements CvService {
	@Autowired
	private CvDAO cvDAO;
	@Autowired
	private UserDAO userDAO;

	@Override
	@Transactional
	public CvDTO getCv(int idCv) {
		// TODO Auto-generated method stub
		Cv cv = cvDAO.getCv(idCv);
		return convertToDTO(cv);
	}

	@Override
	@Transactional
	public void saveCv(CvDTO cvDTO, MyUserDetails currentUser) {
		// TODO Auto-generated method stub
		Cv cv = convertToEntity(cvDTO, currentUser);
		cvDAO.saveCv(cv, currentUser);
	}
	
	public CvDTO convertToDTO(Cv cv) {
		if(cv == null) {
			return null;
		}
		CvDTO cvDTO = new CvDTO();
		cvDTO.setId(cv.getId());
		cvDTO.setFileName(cv.getFileName());
		return cvDTO;
	}
	public Cv convertToEntity(CvDTO cvDTO, MyUserDetails currentUser) {
		if(cvDTO == null) {
			return null;
		}
		Cv cv = new Cv();
		cv.setId(cvDTO.getId());
		String email = currentUser.getUsername();
		cv.setFileName(cvDTO.getFileName());
		User user = userDAO.getUserByEmail(email);
		cv.setUser(user);
		return cv;
	}

	@Override
	@Transactional
	public void deleteCv(int idCv, MyUserDetails myUserDetails) {
		// TODO Auto-generated method stub
		cvDAO.deleteCv(idCv, myUserDetails);
	}

	@Override
	public CvDTO getCvDTOByUserId(int userId) {
		// TODO Auto-generated method stub
		Cv cv = cvDAO.getCvByUserId(userId);
		return convertToDTO(cv);
	}
}
