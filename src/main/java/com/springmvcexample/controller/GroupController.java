package com.springmvcexample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springmvcexample.model.Group;
import com.springmvcexample.service.GroupService;

@Controller
public class GroupController {

	public static final Logger logger = LoggerFactory.getLogger(GroupController.class);

	@Autowired
	private GroupService groupService;

	@Autowired
	private MessageSource msgSource;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("errorMsg", "Invalid Credentials");

        if (logout != null)
            model.addAttribute("msg", "You have been logged out successfully.");

        return "group/index";
    }
	@RequestMapping("/adminHome")
	public String adminHome(Model model) {
		return "group/adminPage";
	}

	@RequestMapping(value = "/getGroups")
	public String adminLogin(Model model) {
		List<Group> listGroups = groupService.listGroups();
		model.addAttribute("groupList", listGroups);
		if (listGroups == null || listGroups.isEmpty())
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
			logger.debug("Cheking for Message from Message Properties file:*" + msgSource.getMessage("message.saveMsg", null,Locale.US));
			model.addAttribute("Msg", msgSource.getMessage("message.saveMsg", null,Locale.US));
		} else {
			logger.debug("Cheking for Message from Message Properties file:*" +  msgSource.getMessage("message.errMsg", null,Locale.US));
			model.addAttribute("Msg", msgSource.getMessage("message.errorMsg", null,Locale.US));
		}
		return "group/adminPage";
	}

	// @RequestMapping(value = "/deleteGroup/{groupId}")
	@DeleteMapping(value="/deleteGroup/{groupId}")
	public String removeGroup(@PathVariable Integer groupId, Model model) {
		boolean flag = groupService.deleteGroup(groupId);
		if (flag)
			model.addAttribute("Msg",  msgSource.getMessage("message.deleteMsg", null,Locale.US));
		else
			model.addAttribute("Msg",  msgSource.getMessage("message.errorMsg", null,Locale.US));
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
	// @PutMapping("/updateGroup")
	public String updateGroup(@ModelAttribute("groupObj") @Valid Group groupObj, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "group/groupForm";
		}
		Group updateGroup = groupService.updateGroup(groupObj);
		if (updateGroup != null) {
			model.addAttribute("Msg",  msgSource.getMessage("message.updateMsg", null,Locale.US));
		} else {
			model.addAttribute("Msg",  msgSource.getMessage("message.errorMsg", null,Locale.US));
		}
		return "group/adminPage";
	}
	@RequestMapping(value = "/checkGroupName")
	public void searchByName(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String res = groupService.searchByName(request.getParameter("name"));
		if (res != null) {
			response.setContentType("text/html");
			response.getWriter().print("available");
			PrintWriter out = response.getWriter();
			out.flush();
		}
	}

}
