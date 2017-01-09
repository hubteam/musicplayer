package com.musicplayer.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.musicplayer.entity.User;

public interface UserService {

public void add(User user);
	
	public void update(User user);
}
