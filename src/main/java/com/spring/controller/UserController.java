package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.entity.Job;
import com.spring.entity.User;
import com.spring.serviceImpl.JobServiceImpl;
import com.spring.serviceImpl.UserServiceImpl;

@Controller
public class UserController {

	@Autowired
	private JobServiceImpl jobService;

	@Autowired
	private UserServiceImpl userService;

	@RequestMapping("/exploreJobs")
	public String exploreJobs(Model m) {

		List<Job> jobs = this.jobService.viewJobs();

		if (jobs != null) {
			m.addAttribute("jobs", jobs);
		} else {
			m.addAttribute("msg","Jobs are not available");
		}

		return "exploreJobs";
	}

	@RequestMapping("/searchJobs")
	public String searchJobs(@RequestParam String location, @RequestParam String category, Model m) {

		List<Job> jobs = this.jobService.searchJobs(location, category);

		m.addAttribute("jobs", jobs);

		return "searchJobs";
	}

	@RequestMapping("/jobView")
	public String jobView(@RequestParam int id, Model m) {

		Job job = this.jobService.getJobById(id);

		m.addAttribute("job", job);

		return "jobView";

	}
	
	@RequestMapping("/editProfile")
	public String editProfile() {
		
		return "editProfile";
	}
	
	@RequestMapping("/updateProfile")
	public String updateProfile(@ModelAttribute("u") User u,Model m,HttpSession session) {
		
		User user=this.userService.editUser(u);
		
		session.setAttribute("user", user);
		
		m.addAttribute("msg","Updated Successfully");
		
		return "editProfile";
	}

}
