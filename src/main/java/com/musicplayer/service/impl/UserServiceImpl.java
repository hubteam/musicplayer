package com.musicplayer.service.impl;

import java.util.List;

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

	public void register(User user) {
		// TODO Auto-generated method stub
		userDao.addUser(user);
	}

	public int login(User user) {
		// TODO Auto-generated method stub
		return userDao.selectUser(user);
	}

	public void changeRes(User user) {
		// TODO Auto-generated method stub
		userDao.updateUser(user);
	}

	public int checkUserName(String name) {
		// TODO Auto-generated method stub
		return userDao.checkUser(name);
	}

	public List<User> showOneUser(String name) {
		// TODO Auto-generated method stub
		return userDao.selectOneUser(name);
	}

	public void findUserPass(User user) {
		// TODO Auto-generated method stub
		userDao.updateUserPass(user);
	}

}
