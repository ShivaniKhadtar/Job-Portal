package com.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.entity.User;
import com.spring.serviceImpl.UserServiceImpl;

@Controller
public class HomeController {

	@Autowired
	private UserServiceImpl userService;

	@RequestMapping("/demoPage")
	public String demo() {

		return "demo";
	}

	@RequestMapping("/")
	public String home() {

		return "home";
	}

	@RequestMapping("/home")
	public String homePage() {

		return "home";
	}

	@RequestMapping("/signUp")
	public String signUp() {

		return "signUp";
	}

	@RequestMapping("/registerServlet")
	public String registerServlet(@ModelAttribute User user, Model m) {

		String msg = this.userService.registerUser(user);

		m.addAttribute("msg", msg);

		return "signUp";
	}

	@RequestMapping("/login")
	public String login() {

		return "login";
	}

	@RequestMapping("/loginServlet")
	public String loginServlet(@RequestParam String email, @RequestParam String password, Model m,
			HttpSession session) {

		User user = this.userService.login(email, password);

		if (user != null) {
			session.setAttribute("user", user);
			if (user.getRole() == "admin") {
				return "forward:/admin";
			} else {
				return "forward:/exploreJobs";
			}
		} else {
			String msg = "Wrong credentials";
			m.addAttribute("msg", msg);
			return "login";
		}
	}
	
	@RequestMapping("/logOut")
	public String logOut(HttpSession session) {
		
		session.removeAttribute("user");
		
		return "login";
	}

}
