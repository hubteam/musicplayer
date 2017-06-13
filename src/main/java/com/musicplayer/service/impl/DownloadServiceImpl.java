package com.musicplayer.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musicplayer.dao.DownloadDao;
import com.musicplayer.entity.Download;
import com.musicplayer.entity.Song;
import com.musicplayer.service.DownloadService;

@Service(value="downloadService")
public class DownloadServiceImpl implements DownloadService{

	@Autowired
	private DownloadDao downloadDao;

	public int isDownLoad(Download download) {
		// TODO Auto-generated method stub
		return downloadDao.isDownLoad(download);
	}

	public void addDownLoad(Download download) {
		// TODO Auto-generated method stub
		downloadDao.insertDownLoad(download);
	}

	public void updDownTime(Download download) {
		// TODO Auto-generated method stub
		downloadDao.updTime(download);
	}

	public List<Song> showAllDown(String name) {
		// TODO Auto-generated method stub
		return downloadDao.selectDown(name);
	}

	public void deleteDown(Download download) {
		// TODO Auto-generated method stub
		downloadDao.deleteDown(download);
	}

}
