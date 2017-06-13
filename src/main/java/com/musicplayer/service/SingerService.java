package com.musicplayer.service;

import java.util.List;

import com.musicplayer.entity.Singer;
import com.musicplayer.entity.SingerExt;
import com.musicplayer.util.Page;

public interface SingerService {

	List<Singer> showSinger(Page page);
	void delSinger(int id);
	int findComId(int id);
	void delComment(int id);
	List<Singer> showSingerById(int id);
	void delSong(int id);
	void updSinger(Singer ss);
	void addSinger(Singer singer);
	List<Singer> showSingerByName(String name);
	int totalCount();
	List<Singer> showSinger();
	List<SingerExt> showSingerMes(String singerName);
	
}
