package com.musicplayer.dao;

import org.springframework.stereotype.Repository;

import com.musicplayer.entity.User;

@Repository(value = "userDao")
public interface UserDao {

	/**
     * 此方法对应于数据库中的表 ,user
     * 新写入数据库记录
     *
     * @param record
     */
	void add(User user);
	 /**
     * 此方法对应于数据库中的表 ,user
     * 根据主键来更新符合条件的数据库记录
     *
     * @param record
     */
	void update(User user);
}
