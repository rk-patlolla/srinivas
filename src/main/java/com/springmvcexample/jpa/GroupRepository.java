package com.springmvcexample.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.springmvcexample.model.Group;

public interface GroupRepository extends JpaRepository<Group, Integer> {
	
    @Query("SELECT g.groupName FROM Group g where g.groupName = ?1")
	public String findByName(String groupName);
	
}

