package com.musicplayer.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.musicplayer.entity.Song;
import com.musicplayer.entity.SongExt;
import com.musicplayer.entity.Wrapper;
import com.musicplayer.util.Page;

@Repository(value="songDao")
public interface SongDao {
	
	List<Song> findAll();
	List<Song> findAllByPage(Page page);
	void updateByLyric(Song song);
	void delBySongId(int id);
	List<Song> findBySingerName(String singer);
	List<Song> findByName(String name);
	void insertSong(Song song);
	List<Song> findonlysong(int id);
	void updateOnlySong(Song song);
	int totalCount();
	//List<Song> findAllNew();
	List<SongExt> clickMany();
	//List<Data> downLoadMany();
	List<SongExt> downLoadMany();
	List<SongExt> findByType(Wrapper wrapper);
	int totalByType(Wrapper wrapper);
	List<Song> findonlysongDetail(int id);
}
