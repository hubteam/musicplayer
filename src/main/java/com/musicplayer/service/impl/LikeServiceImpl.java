package com.musicplayer.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musicplayer.dao.LikeDao;
import com.musicplayer.entity.Like;
import com.musicplayer.entity.Song;
import com.musicplayer.service.LikeService;
@Service(value="likeService")
public class LikeServiceImpl implements LikeService{

	@Autowired
	private LikeDao likeDao;
	public int isLike(Like like) {
		// TODO Auto-generated method stub
		return likeDao.isLike(like);
	}

	public void insertLike(Like like) {
		// TODO Auto-generated method stub
		likeDao.insertLike(like);
	}

	public void deleteLike(Like like) {
		// TODO Auto-generated method stub
		likeDao.deleteLike(like);
	}

	public List<Song> selectClick(String name) {
		// TODO Auto-generated method stub
		return likeDao.selectClick(name);
	}

}
