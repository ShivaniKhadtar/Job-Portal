package com.spring.daoImpl;

import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.*;

import com.spring.entity.Job;

@Component("jobDao")
public class JobDaoImpl {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Transactional
	public int saveJob(Job job) {

		int id = (Integer) this.hibernateTemplate.save(job);

		return id;
	}

	public List<Job> selectJobs() {

		List<Job> jobs = this.hibernateTemplate.loadAll(Job.class);

		return jobs;
	}

	public Job selectJobById(int id) {

		Job job = this.hibernateTemplate.get(Job.class, id);

		return job;
	}

	@Transactional
	public List<Job> selectJobBySingleValue(String location, String category) {

		String qry = "from Job j where j.location=?0 or j.category=?1 order by j.id DESC";

		Query query = this.hibernateTemplate.getSessionFactory().getCurrentSession().createQuery(qry);
		query.setParameter(0, location);
		query.setParameter(1, category);
		List<Job> jobs = query.getResultList();

		for (Job j : jobs) {
			System.out.println(j.getTitle());
		}

		return jobs;
	}

	@Transactional
	public List<Job> selectJobByBothValue(String location, String category) {

		String qry = "from Job j where j.location=?0 and j.category=?1 order by j.id DESC";

		Query query = this.hibernateTemplate.getSessionFactory().getCurrentSession().createQuery(qry);
		query.setParameter(0, location);
		query.setParameter(1, category);
		List<Job> jobs = query.getResultList();

		for (Job j : jobs) {
			System.out.println(j.getTitle());
		}

		return jobs;
	}

	@Transactional
	public void updateJob(Job job) {

		this.hibernateTemplate.update(job);

	}

	@Transactional
	public void deleteJob(int id) {

		this.hibernateTemplate.delete(this.hibernateTemplate.load(Job.class, id));

	}

}
