package com.musicplayer.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.musicplayer.entity.Like;
import com.musicplayer.entity.Song;
@Repository(value="likeDao")
public interface LikeDao {

	int isLike(Like like);
	void insertLike(Like like);
	void deleteLike(Like like);
	List<Song> selectClick(String name);
}
