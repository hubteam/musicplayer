package com.musicplayer.service;

import java.util.List;

import com.musicplayer.entity.Like;
import com.musicplayer.entity.Song;

public interface LikeService {

	int isLike(Like like);
	void insertLike(Like like);
	void deleteLike(Like like);
	List<Song> selectClick(String name);
}
