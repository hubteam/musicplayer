package com.musicplayer.dao;

import java.util.List;


import org.springframework.stereotype.Repository;

import com.musicplayer.entity.SongType;

@Repository(value="typeDao")
public interface TypeDao {

	List<SongType> findAllType();
	List<SongType> findByTypeId(int id);
	void deleByTypeId(int id);
	void chaByTypeId(SongType songType);
	void insertType(String type);
}
