package com.musicplayer.service;

import java.util.List;

import com.musicplayer.entity.Data;
import com.musicplayer.entity.Song;
import com.musicplayer.util.Page;

public interface ClickService {

	List<Data> showClick(Page page);
	List<Data> showByName(String name);
	List<Song> hotMusic();
	List<Song> downLoadMany();
	//List<Song> downLoadMany();
	int isClick(int id);
	void updDownload(int id);
	void updClick(int id);
	void insertData(Data data);
	int allClickCount();
	List<Data> findClicks();
	
}
