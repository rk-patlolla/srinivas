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

import com.springmvcexample.model.Users;
import com.springmvcexample.service.UserService;

@Controller
public class UserController {

	public static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;
	@Autowired
	private MessageSource msgSource;

	@RequestMapping("/getUserForm/{groupId}")
	public String getUserForm(@ModelAttribute("userObj") Users userObj, @PathVariable Integer groupId, Model model) {
		logger.debug("Cheking for GroupId:" + groupId);
		model.addAttribute("groupId", groupId);
		return "user/userForm";
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String saveUser(@ModelAttribute("userObj") @Valid Users userObj, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "user/userForm";
		}

		Users addUser = userService.addUser(userObj);
		if (addUser != null) {
			model.addAttribute("Msg", msgSource.getMessage("message.saveMsg", null,Locale.US));
		} else {
			model.addAttribute("Msg", msgSource.getMessage("message.errorMsg", null,Locale.US));
		}

		return "user/userList";
	}

	@RequestMapping("/getUsers")
	public String getUsers(Model model) {
		List<Users> listUsers = userService.listUsers();
		if (listUsers.size() > 0)
			model.addAttribute("usersList", listUsers);
		else
			model.addAttribute("Msg", "No Users Found...");
		return "user/userList";
	}

	@RequestMapping(value = "/editUser/{userId}")
	public String editUser(@ModelAttribute("userObj") Users userObj, @PathVariable Integer userId, Model model) {
		Users editUser = userService.editUser(userId);
		model.addAttribute("usersList", editUser);
		return "user/userEditPage";

	}

	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public String updateGroup(@ModelAttribute("userObj") @Valid Users userObj, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "user/userForm";
		}
		Users updateUser = userService.updateUser(userObj);
		if (updateUser != null) {
			model.addAttribute("Msg", msgSource.getMessage("message.updateMsg", null,Locale.US));
		} else {
			model.addAttribute("Msg", msgSource.getMessage("message.errorMsg", null,Locale.US));
		}
		return "user/userList";
	}
	// @RequestMapping(value = "/deleteUser/{userId}")
	@DeleteMapping(value = "/deleteUser/{userId}")
	public String removeGroup(@PathVariable Integer userId, Model model) {

		boolean flag = userService.deleteUser(userId);
		if (flag)
			model.addAttribute("Msg", msgSource.getMessage("message.deleteMsg", null,Locale.US));
		else
			model.addAttribute("Msg", msgSource.getMessage("message.errorMsg", null,Locale.US));
		return "user/userList";

	}

	@RequestMapping(value = "/checkNameOrMobileOrEmail")
	public void searchByName(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String res = userService.checkNameorMobileOrEmail(request.getParameter("name"));
		if (res != null) {
			response.setContentType("text/html");
			response.getWriter().print("available");
			PrintWriter out = response.getWriter();
			out.flush();
		}
	}

}
