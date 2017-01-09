package com.musicplayer.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.musicplayer.dao.UserDao;
import com.musicplayer.entity.User;
import com.musicplayer.service.UserService;

@Service(value = "userService")
@Transactional
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	
	public void add(User user) {
		// TODO Auto-generated method stub
		userDao.add(user);
		
	}

	public void update(User user) {
		// TODO Auto-generated method stub
		userDao.update(user);
	}

}
