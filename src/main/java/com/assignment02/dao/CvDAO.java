package com.assignment02.dao;

import com.assignment02.config.MyUserDetails;
import com.assignment02.entity.Cv;

public interface CvDAO {
	public Cv getCv(int idCv);
	public void saveCv(Cv cv, MyUserDetails currentUser);
	public void deleteCv(int idCv, MyUserDetails myUserDetails);
	public Cv getCvByUserId(int userId);
}
