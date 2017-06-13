package com.musicplayer.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musicplayer.dao.AdminDao;
import com.musicplayer.entity.Admin;
import com.musicplayer.service.AdminService;

@Service(value = "adminService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao adminDao;

	public int login(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.find(admin);
	}

}
