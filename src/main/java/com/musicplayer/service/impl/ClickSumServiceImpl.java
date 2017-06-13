package com.musicplayer.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musicplayer.dao.ClickSumDao;
import com.musicplayer.entity.Click;
import com.musicplayer.entity.Song;
import com.musicplayer.service.ClickSumService;
@Service(value="clickSumService")
public class ClickSumServiceImpl implements ClickSumService{

	@Autowired
	private ClickSumDao clickSumDao;
	public int isListen(Click click) {
		// TODO Auto-generated method stub
		return clickSumDao.isListen(click);
	}

	public void insertClick(Click click) {
		// TODO Auto-generated method stub
		clickSumDao.insertClick(click);
	}

	public void updCTime(Click click) {
		// TODO Auto-generated method stub
		clickSumDao.updCTime(click);
	}

	public List<Song> selectClick(String name) {
		// TODO Auto-generated method stub
		return clickSumDao.selectClick(name);
	}

	public void delClickCount(Click click) {
		// TODO Auto-generated method stub
		clickSumDao.deleteClick(click);
	}

}
