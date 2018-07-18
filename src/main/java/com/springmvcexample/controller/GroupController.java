package com.springmvcexample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springmvcexample.model.Group;
import com.springmvcexample.service.GroupService;
import com.springmvcexample.utils.MessagesProperties;

import ch.qos.logback.core.Context;

@Controller
//@RequestMapping("/group")
public class GroupController {

	public static final Logger logger = LoggerFactory.getLogger(GroupController.class);

	@Autowired
	private GroupService groupService;

	@Autowired
	private MessagesProperties msgProp;

	@RequestMapping("/homePage")
	public String homePage() {
		return "group/index";
	}

	@RequestMapping("/adminHome")
	public String adminHome(Model model) {
		
		logger.debug("Cheking Interceptor is Completed");
		return "group/adminPage";
	}

	@RequestMapping(value = "/getGroups")
	public String adminLogin(@ModelAttribute("group")Group group,Model model) {
		List<Group> listGroups = groupService.listGroups();
		model.addAttribute("groupList", listGroups);
		if (listGroups == null)
			model.addAttribute("Msg", "No Records Found");
		return "group/adminPage";
	}

	@RequestMapping(value = "/getGroupForm")
	public String getGroupForm(@ModelAttribute("groupObj") Group groupObj) {
		return "group/groupForm";
	}

	@RequestMapping(value = "/addGroup", method = RequestMethod.POST)
	public String saveGroup(@ModelAttribute("groupObj") @Valid Group groupObj, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "group/groupForm";
		}

		logger.debug("Group Name" + groupObj.getGroupName());
		Group addGroup = groupService.addGroup(groupObj);
		if (addGroup != null) {
			logger.debug("Cheking for Message from Message Properties file:*" + msgProp.getSaveSuccessMsg());
			model.addAttribute("Msg", msgProp.getSaveSuccessMsg());
		} else {
			logger.debug("Cheking for Message from Message Properties file:*" + msgProp.getSaveErrorMsg());
			model.addAttribute("Msg", msgProp.getSaveErrorMsg());
		}
		return "group/adminPage";
	}

	//@RequestMapping(value = "/deleteGroup/{groupId}", method=RequestMethod.DELETE)
	@DeleteMapping("/deleteGroup/{groupId}")
	public String removeGroup(@PathVariable Integer groupId, Model model) {

		boolean flag = groupService.deleteGroup(groupId);
		if (flag)
			model.addAttribute("Msg", msgProp.getDeleteSuccessMsg());
		else
			model.addAttribute("Msg", msgProp.getDeleteErrorMsg());
		return "group/adminPage";

	}

	@RequestMapping(value = "/getByGroupId/{groupId}")
	public String editGroup(@ModelAttribute("groupObj") Group groupObj, @PathVariable Integer groupId, Model model) {

		Group editGroup = groupService.editGroup(groupId);
		model.addAttribute("editGroupObj", editGroup);
		if (editGroup == null) {
			model.addAttribute("errMsg", "No Records Available");
		}
		return "group/editPage";

	}

	@RequestMapping(value = "/updateGroup")
	//@PutMapping("/updateGroup")
	public String updateGroup(@ModelAttribute("groupBean") @Valid Group groupObj, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "group/groupForm";
		}

		Group updateGroup = groupService.updateGroup(groupObj);
		if (updateGroup != null) {
			model.addAttribute("Msg", msgProp.getUpdateSuccessMsg());
		} else {
			model.addAttribute("Msg", msgProp.getUpdateErrorMsg());
		}
		return "group/adminPage";
	}
	
	@RequestMapping(value = "/checkGroupName")
	public void searchByName(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String res = groupService.searchByName(request.getParameter("name"));
		if(res!=null) {
		response.setContentType("text/html");
		response.getWriter().print("available");
		PrintWriter out = response.getWriter();
		out.flush();
		}
	}

}
