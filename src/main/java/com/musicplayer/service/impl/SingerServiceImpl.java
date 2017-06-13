package com.musicplayer.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musicplayer.dao.SingerDao;
import com.musicplayer.entity.Singer;
import com.musicplayer.entity.SingerExt;
import com.musicplayer.service.SingerService;
import com.musicplayer.util.Page;

@Service(value="singerService")
public class SingerServiceImpl implements SingerService{

	@Autowired
	private SingerDao singerDao;
	
	public List<Singer> showSinger(Page page) {
		// TODO Auto-generated method stub
		//int count = singerDao.findCount();
		return singerDao.findAllSingers(page);
	}
	
	public int totalCount(){
		return singerDao.findCount();
		
	}

	public void delSinger(int id) {
		// TODO Auto-generated method stub
		singerDao.delSinger(id);
	}

	public int findComId(int id) {
		// TODO Auto-generated method stub
		return singerDao.findbysingerId(id);
	}

	public void delComment(int id) {
		// TODO Auto-generated method stub
		singerDao.delComment(id);
	}

	public List<Singer> showSingerById(int id) {
		// TODO Auto-generated method stub
		return singerDao.findOneById(id);
	}

	public void delSong(int id) {
		// TODO Auto-generated method stub
		singerDao.delSong(id);
	}

	public void updSinger(Singer ss) {
		// TODO Auto-generated method stub
		singerDao.updSinger(ss);
	}

	public void addSinger(Singer singer) {
		// TODO Auto-generated method stub
		singerDao.insertSinger(singer);
	}

	public List<Singer> showSingerByName(String name) {
		// TODO Auto-generated method stub
		return singerDao.findOneByName(name);
	}

	public List<Singer> showSinger() {
		// TODO Auto-generated method stub
		return singerDao.findAllSingers1();
	}

	public List<SingerExt> showSingerMes(String singerName) {
		// TODO Auto-generated method stub
		return singerDao.singerAllSong(singerName);
	}



}
