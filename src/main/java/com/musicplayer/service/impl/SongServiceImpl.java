package com.musicplayer.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musicplayer.dao.SongDao;
import com.musicplayer.entity.Song;
import com.musicplayer.entity.SongExt;
import com.musicplayer.entity.Wrapper;
import com.musicplayer.service.SongService;
import com.musicplayer.util.Page;

@Service(value="songService")
public class SongServiceImpl implements SongService{

	@Autowired
	private SongDao songDao;

	public List<Song> showSong() {
		// TODO Auto-generated method stub
		return songDao.findAll();
	}

	public void upLoadLyric(Song song) {
		// TODO Auto-generated method stub
		songDao.updateByLyric(song);
	}

	public void delSong(int id) {
		// TODO Auto-generated method stub
		songDao.delBySongId(id);
	}

	public List<Song> showAlbumName(String str) {
		// TODO Auto-generated method stub
		return songDao.findBySingerName(str);
	}

	public List<Song> showMes(String name) {
		// TODO Auto-generated method stub
		return songDao.findByName(name);
	}

	public void addSong(Song song) {
		// TODO Auto-generated method stub
		songDao.insertSong(song);
	}

	public List<Song> showSingleSong(int id) {
		// TODO Auto-generated method stub
		return songDao.findonlysong(id);
	}

	public void songChange(Song song) {
		// TODO Auto-generated method stub
		songDao.updateOnlySong(song);
	}

	public int getTotalCount() {
		// TODO Auto-generated method stub
		return songDao.totalCount();
	}

	public List<Song> showSongByPage(Page page) {
		// TODO Auto-generated method stub
		return songDao.findAllByPage(page);
	}

	public List<SongExt> clickMany() {
		// TODO Auto-generated method stub
		return songDao.clickMany();
	}

	public List<SongExt> downLoadMany() {
		// TODO Auto-generated method stub
		return songDao.downLoadMany();
	}

	public List<SongExt> showSongByType(Wrapper wrapper) {
		// TODO Auto-generated method stub
		return songDao.findByType(wrapper);
	}

	public int showCountByType(Wrapper wrapper) {
		// TODO Auto-generated method stub
		return songDao.totalByType(wrapper);
	}

	public List<Song> showSongDetail(int id) {
		// TODO Auto-generated method stub
		return songDao.findonlysongDetail(id);
	}

	
	

}
