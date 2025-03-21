package com.assignment02.service;

import com.assignment02.config.MyUserDetails;
import com.assignment02.dto.CvDTO;

public interface CvService {
	public CvDTO getCv(int idCv);
	public void saveCv(CvDTO cvDTO, MyUserDetails currentUser);
	public void deleteCv(int idCv, MyUserDetails myUserDetails);
	public CvDTO getCvDTOByUserId(int userId);
}
