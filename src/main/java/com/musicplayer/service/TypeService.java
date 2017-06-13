package com.musicplayer.service;

import java.util.List;

import com.musicplayer.entity.SongType;

public interface TypeService {

	List<SongType> showType();
	List<SongType> showOneType(int id);
	void delType(int id);
	void chaType(SongType songType);
	void addType(String type);
}
