package com.musicplayer.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.musicplayer.entity.User;

@Repository(value = "userDao")
public interface UserDao {

	
	void addUser(User user);
	 
	void updateUser(User user);
	
	int selectUser(User user);
	
	int checkUser(String name);
	
	List<User> selectOneUser(String name);
	
	void updateUserPass(User user);
}
