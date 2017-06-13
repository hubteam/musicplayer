package com.musicplayer.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musicplayer.dao.ClickDao;
import com.musicplayer.entity.Data;
import com.musicplayer.entity.Song;
import com.musicplayer.service.ClickService;
import com.musicplayer.util.Page;
@Service(value="/clickService")
public class ClickSerciceImpl implements ClickService{

	@Autowired
	private ClickDao clickDao;
	public List<Data> showClick(Page page) {
		// TODO Auto-generated method stub
		return clickDao.findAllClick(page);
	}
	public List<Data> showByName(String name) {
		// TODO Auto-generated method stub
		return clickDao.findClickByName(name);
	}
	public List<Song> hotMusic() {
		// TODO Auto-generated method stub
		return clickDao.clickMany();
	}
	public List<Song> downLoadMany() {
		// TODO Auto-generated method stub
		return clickDao.downLoadMany();
	}
	public int isClick(int id) {
		// TODO Auto-generated method stub
		return clickDao.clickFlag(id);
	}
	public void updDownload(int id) {
		// TODO Auto-generated method stub
		clickDao.updDownload(id);
	}
	public void updClick(int id) {
		// TODO Auto-generated method stub
		clickDao.updClick(id);
	}
	public void insertData(Data data) {
		// TODO Auto-generated method stub
		clickDao.insertData(data);
	}
	public int allClickCount() {
		// TODO Auto-generated method stub
		return clickDao.allClickCount();
	}
	public List<Data> findClicks() {
		// TODO Auto-generated method stub
		return clickDao.findClicks();
	}

}
