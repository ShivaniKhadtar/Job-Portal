package com.spring.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import com.spring.daoImpl.JobDaoImpl;
import com.spring.entity.Job;

@Component("jobService")
public class JobServiceImpl {

	@Autowired
	private JobDaoImpl jobDao;

	public String postJobs(Job job) {

		int id = this.jobDao.saveJob(job);

		if (id > 0) {
			return "Posted successfully";
		} else {
			return "Something went wrong";
		}

	}

	public List<Job> viewJobs() {

		List<Job> jobs = this.jobDao.selectJobs();

		return jobs;

	}

	public Job getJobById(int id) {

		Job job = this.jobDao.selectJobById(id);

		return job;
	}

	public List<Job> searchJobs(String location, String category) {

		List<Job> jobs = null;
		String msg;

		if (location == null || category == null) {
			jobs = this.jobDao.selectJobBySingleValue(location, category);
		} else {
			jobs = this.jobDao.selectJobByBothValue(location, category);
		}

		return jobs;
	}

	public void updateJob(Job job) {

		this.jobDao.updateJob(job);
	}

	public void deleteJob(int id) {

		this.jobDao.deleteJob(id);
	}

}
