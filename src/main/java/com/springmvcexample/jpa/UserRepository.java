package com.springmvcexample.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.springmvcexample.model.Users;

public interface UserRepository extends JpaRepository<Users, Integer> {
	
	@Query("SELECT u.userName,u.userEmail,u.userMobile FROM Users u where u.userName = :name or u.userEmail=:name or u.userMobile=:name ")
	public String checkNameOrMobileOrEmail(@Param("name") String nameOrMobileOrMail);
}
