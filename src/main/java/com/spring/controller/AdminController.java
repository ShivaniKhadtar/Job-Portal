package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.entity.Job;
import com.spring.serviceImpl.JobServiceImpl;

@Controller
public class AdminController {

	@Autowired
	private JobServiceImpl jobService;
	
	@RequestMapping("/admin")
	public String admin() {
		System.out.println("admin");
		
		return "admin";
	}

	@RequestMapping("/postJobs")
	public String postJobs() {

		return "postJobs";
	}

	@RequestMapping("/addJobs")
	public String addJobs(@ModelAttribute Job job, Model m) {

		String msg = this.jobService.postJobs(job);

		m.addAttribute("msg", msg);

		return "postJobs";
	}

	@RequestMapping("/viewJobs")
	public String viewJobs(Model m) {

		List<Job> jobs = this.jobService.viewJobs();

		m.addAttribute("jobs", jobs);

		return "viewJobs";
	}

	@RequestMapping("/editJob")
	public String editJob(@RequestParam int id, Model m) {

		Job job = this.jobService.getJobById(id);

		m.addAttribute("job", job);

		return "editJob";
	}

	@RequestMapping("/updateJob")
	public String updateJob(@ModelAttribute Job job, Model m) {

		this.jobService.updateJob(job);
		m.addAttribute("msg", "Updated Successfully");

		return "editJob";
	}

	@RequestMapping("/deleteJob")
	public String deleteJob(@RequestParam int id) {

		this.jobService.deleteJob(id);

		return "forward:/viewJobs";
	}

}
