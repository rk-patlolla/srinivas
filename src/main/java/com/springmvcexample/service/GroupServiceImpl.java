package com.springmvcexample.service;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvcexample.controller.GroupController;
import com.springmvcexample.jpa.GroupRepository;
import com.springmvcexample.model.Group;
import com.springmvcexample.utils.ResourceNotFoundException;

@Service
public class GroupServiceImpl implements GroupService {

	public static final Logger logger = LoggerFactory.getLogger(GroupController.class);

	@Autowired
	private GroupRepository groupRepository;

	@Override
	public Group addGroup(Group groupObj) {

		groupObj.setCreatedDate(new Date());
		groupObj.setStatus(true);

		return groupRepository.save(groupObj);
	}

	@Override
	public List<Group> listGroups() {
		return groupRepository.findAll();
	}

	@Override
	public boolean deleteGroup(Integer groupId) {
		try {
			Group groupObj = groupRepository.findById(groupId)
					.orElseThrow(() -> new ResourceNotFoundException("groupId", "groupId", groupId));
			groupRepository.delete(groupObj);
			return true;
		} catch (Exception ex) {
			logger.error("Exception" + ex);
			return false;
		}

	}

	@Override
	public Group editGroup(Integer groupId) {
		return groupRepository.findById(groupId)
				.orElseThrow(() -> new ResourceNotFoundException("groupId", "groupId", groupId));
	}

	@Override
	public Group updateGroup(Group groupObj) {
		groupObj.setUpdatedDate(new Date());
		return groupRepository.save(groupObj);

	}

	@Override
	public String searchByName(String groupName) {
		return groupRepository.findByName(groupName);
	}

}
