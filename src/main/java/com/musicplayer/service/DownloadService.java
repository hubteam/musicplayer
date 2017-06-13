package com.musicplayer.service;

import java.util.List;

import com.musicplayer.entity.Download;
import com.musicplayer.entity.Song;

public interface DownloadService {

	int isDownLoad(Download download);
	void addDownLoad(Download download);
	void updDownTime(Download download);
	List<Song> showAllDown(String name);
	void deleteDown(Download download);
}
