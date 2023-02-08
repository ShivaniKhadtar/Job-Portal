package com.spring.entity;

import java.sql.Timestamp;

import javax.persistence.*;

import org.hibernate.annotations.UpdateTimestamp;

@Entity
public class Job {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String title;
	private String description;
	private String location;
	private String category;
	private String status;
	@UpdateTimestamp
	private Timestamp pdate;
	
	public Job() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Job(int id, String title, String description, String location, String category, String status,
			Timestamp pdate) {
		super();
		this.title = title;
		this.description = description;
		this.location = location;
		this.category = category;
		this.status = status;
		this.pdate = pdate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Timestamp getPdate() {
		return pdate;
	}

	public void setPdate(Timestamp pdate) {
		this.pdate = pdate;
	}
	
	
	
}
