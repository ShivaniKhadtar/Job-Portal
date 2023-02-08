package com.spring.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.spring.entity.User;

@Component("userDao")
public class UserDaoImpl {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Transactional
	public int saveUser(User user) {
		
		int id=(Integer) this.hibernateTemplate.save(user);
		
		return id;
		
	}
	
	public User selectUser(String email, String password) {
		
		DetachedCriteria detachedCriteria= DetachedCriteria.forClass(User.class);
		detachedCriteria.add(Restrictions.eq("email", email));
		detachedCriteria.add(Restrictions.eq("password", password));
		
		List<User> users= (List<User>) this.hibernateTemplate.findByCriteria(detachedCriteria);
		
		if(users!=null && users.size()>0) {
			return users.get(0);
		}else {
			return null;
		}
		
	}
	
	public User selectUserByid(int id) {
		
		User user=this.hibernateTemplate.get(User.class, id);
		
		return user;
	}
	
	@Transactional
	public void updateuser(User u) {
		
		this.hibernateTemplate.update(u);
		
	}
	
	
}
