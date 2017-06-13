package com.musicplayer.dao;

import org.springframework.stereotype.Repository;

import com.musicplayer.entity.Admin;

@Repository(value = "adminDao")
public interface AdminDao {

	int find(Admin admin);
}
