package com.musicplayer.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.musicplayer.entity.Singer;
import com.musicplayer.entity.SingerExt;
import com.musicplayer.util.Page;

@Repository(value="singerDao")
public interface SingerDao {

	List<Singer> findAllSingers(Page page);
	void delSinger(int id);
	int findbysingerId(int id);
	void delComment(int id);
	List<Singer> findOneById(int id);
	void delSong(int id);
	void updSinger(Singer ss);
	void insertSinger(Singer singer);
	List<Singer> findOneByName(String name);
	int findCount();
	List<Singer> findAllSingers1();
	List<SingerExt> singerAllSong(String singerName);
}
