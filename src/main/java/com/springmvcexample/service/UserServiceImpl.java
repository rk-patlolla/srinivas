package com.springmvcexample.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.springmvcexample.controller.UserController;
import com.springmvcexample.jpa.UserRepository;
import com.springmvcexample.model.Users;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private UserRepository userRepository;
	public static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Override
	public Users addUser(Users userObj) {
		//userObj.setCreatedDate(new Date());
		userObj.setStatus(true);
		logger.debug("Encypted Password : "+passwordEncoder.encode(userObj.getPassword()));
		userObj.setPassword(passwordEncoder.encode(userObj.getPassword()));
		return userRepository.save(userObj);
	}

	@Override
	public List<Users> listUsers() {
		return userRepository.findAll();
	}

	@Override
	public Users editUser(Integer userId) {
		return userRepository.findById(userId).get();

	}

	@Override
	public Users updateUser(Users userObj) {
		//userObj.setUpdatedDate(new Date());
		userObj.setStatus(true);
		return userRepository.save(userObj);

	}

	@Override
	public boolean deleteUser(Integer userId) {
		try {
			userRepository.deleteById(userId);
			return true;
		} catch (Exception ex) {
			logger.error("Exception"+ex);
			return false;
		}

	}

	@Override
	public String checkNameorMobileOrEmail(String nameOrMobileOrMail) {
		return userRepository.checkNameOrMobileOrEmail(nameOrMobileOrMail);
	}

}
