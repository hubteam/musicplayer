package com.musicplayer.service;

import java.util.List;

import com.musicplayer.entity.User;

public interface UserService {

	public void register(User user);
	public int login(User user);
	public void changeRes(User user);
	public int checkUserName(String name);
	public List<User> showOneUser(String name);

}
