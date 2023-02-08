package com.spring.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.spring.daoImpl.UserDaoImpl;
import com.spring.entity.User;

@Component("userService")
public class UserServiceImpl {

	@Autowired
	private UserDaoImpl userDao;

	public String registerUser(User user) {

		int id = this.userDao.saveUser(user);

		if (id > 0) {
			return "Registered successfully";
		} else {
			return "Something went wrong";
		}

	}

	public User login(String email, String password) {

		User user = new User();

		if (email.equals("admin@gmail.com") && password.equals("Admin@123")) {
			user.setRole("admin");
		} else {
			user = this.userDao.selectUser(email, password);
			if(user!=null) {
				user.setRole("user");
			}
		}
		
		return user;
	}

	public User editUser(User u) {
		
		this.userDao.updateuser(u);
		
		User user=this.userDao.selectUserByid(u.getId());
		user.setRole("user");
		
		return user;
	}
	
}
