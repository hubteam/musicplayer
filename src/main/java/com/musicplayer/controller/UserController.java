package com.musicplayer.controller;

import org.springframework.beans.factory.annotation.Autowired;

import com.musicplayer.service.UserService;

public class UserController {
	
	@Autowired
	private UserService userService;

}
