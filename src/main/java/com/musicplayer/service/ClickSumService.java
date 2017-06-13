package com.musicplayer.service;

import java.util.List;

import com.musicplayer.entity.Click;
import com.musicplayer.entity.Song;

public interface ClickSumService {

	int isListen(Click click);
	void insertClick(Click click);
	void updCTime(Click click);
	List<Song> selectClick(String name);
	void delClickCount(Click click);
}
