package com.musicplayer.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.musicplayer.entity.Click;
import com.musicplayer.entity.Song;

@Repository(value="clickSumDao")
public interface ClickSumDao {

	int isListen(Click click);
	void insertClick(Click click);
	void updCTime(Click click);
	List<Song> selectClick(String name);
	void deleteClick(Click click);
}
