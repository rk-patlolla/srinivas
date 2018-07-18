package com.springmvcexample.service;

import java.util.List;

import com.springmvcexample.model.Group;

public interface GroupService {

	public Group addGroup(Group groupObj);
	public List<Group> listGroups();
	public boolean deleteGroup(Integer groupId);
	public Group editGroup(Integer groupId);
	public Group updateGroup (Group groupObj);
	public String searchByName(String groupName);
}
