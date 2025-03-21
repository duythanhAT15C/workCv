package com.assignment02.dao.impl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.assignment02.config.MyUserDetails;
import com.assignment02.dao.CvDAO;
import com.assignment02.dao.UserDAO;
import com.assignment02.entity.Cv;
import com.assignment02.entity.User;
import com.assignment02.repository.CvRepository;
import com.assignment02.repository.RepositoryCustom;

@Repository
public class CvDAOImpl implements CvDAO {
	@Autowired
	private CvRepository cvRepository;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private RepositoryCustom repositoryCustom;

	@Override
	public Cv getCv(int idCv) {
		return cvRepository.findCvById(idCv);
	}

	@Override
	public void saveCv(Cv cv, MyUserDetails currentUser) {
		// TODO Auto-generated method stub
		User user = userDAO.getUserById(cv.getUser().getId());
		cv.setUser(user);
		Cv savedCv = cvRepository.save(cv);
		user.setCv(savedCv);
		userDAO.saveUser(user, currentUser);
	}

	@Override
	public void deleteCv(int idCv, MyUserDetails myUserDetails) {
		User user = userDAO.getUserByCvId(idCv);
		user.setCv(null);
		userDAO.saveUser(user, myUserDetails);
		Cv cv = cvRepository.findCvById(idCv);
		String filePath = "src/main/webapp/" + cv.getFileName();
		if (filePath != null && !filePath.isEmpty()) {
			try {
				Path path = Paths.get(filePath); // Tạo đối tượng Path từ đường dẫn file
				Files.delete(path); // Xóa file từ thư mục
			} catch (IOException e) {
				e.printStackTrace();
				throw new RuntimeException("Error deleting file: " + filePath);
			}
		}
		long count = cvRepository.count();
		cvRepository.deleteById(idCv);
		if (count == 1) {
			repositoryCustom.resetAutoIncrementCv();
		}
	}

	@Override
	public Cv getCvByUserId(int userId) {
		// TODO Auto-generated method stub
		return cvRepository.findByUserId(userId);
	}

}
