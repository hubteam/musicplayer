package com.musicplayer.service;

import java.util.List;

import com.musicplayer.entity.Song;
import com.musicplayer.entity.SongExt;
import com.musicplayer.entity.Wrapper;
import com.musicplayer.util.Page;

public interface SongService {

	List<Song> showSong();
	void upLoadLyric(Song song);
	void delSong(int id);
	List<Song> showAlbumName(String str);
	List<Song> showMes(String name);
	void addSong(Song song);
	List<Song> showSingleSong(int id);
	void songChange(Song song);
	int getTotalCount();
	List<Song> showSongByPage(Page page);
	List<SongExt> clickMany();
	//List<Data> downLoadMany();
	List<SongExt> downLoadMany();
	//List<Song> showSongByType(Wrapper wrapper);
	int showCountByType(Wrapper wrapper);
	List<SongExt> showSongByType(Wrapper wrapper);
	List<Song> showSongDetail(int id);
	
}
