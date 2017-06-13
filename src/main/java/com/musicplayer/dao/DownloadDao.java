package com.musicplayer.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.musicplayer.entity.Download;
import com.musicplayer.entity.Song;

@Repository(value="downloadDao")
public interface DownloadDao {

	int isDownLoad(Download download);
	void insertDownLoad(Download download);
	void updTime(Download download);
	List<Song> selectDown(String name);
	void deleteDown(Download download);
}
