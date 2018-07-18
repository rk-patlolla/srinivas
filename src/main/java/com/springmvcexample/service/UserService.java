package com.springmvcexample.service;

import java.util.List;

import com.springmvcexample.model.Users;

public interface UserService {
	
	public Users addUser(Users userObj);
	public List<Users> listUsers();
	public Users editUser(Integer userId);
	public Users updateUser (Users userObj);
	public boolean deleteUser(Integer userId);
	public String checkNameorMobileOrEmail(String nameOrMobileOrMail);
		
	}


