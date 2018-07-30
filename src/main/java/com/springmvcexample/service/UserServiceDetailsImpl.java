package com.springmvcexample.service;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.springmvcexample.jpa.UserRepository;
import com.springmvcexample.model.Users;

@Service
public class UserServiceDetailsImpl implements UserDetailsService {

	@Autowired
	private UserRepository userRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Users users = userRepository.findByUserName(username);
		if (users == null) {
			throw new UsernameNotFoundException(username);

		}
		GrantedAuthority authority = new SimpleGrantedAuthority(users.getRole());
		UserDetails userDetails = (UserDetails) new User(users.getUserName(), users.getPassword(), Arrays.asList(authority));
		return userDetails;

	}

}
