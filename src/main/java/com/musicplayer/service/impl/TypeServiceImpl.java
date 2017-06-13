package com.musicplayer.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musicplayer.dao.TypeDao;
import com.musicplayer.entity.SongType;
import com.musicplayer.service.TypeService;
@Service(value="typeService")
public class TypeServiceImpl implements TypeService{

	@Autowired
	private TypeDao typeDao;
	
	public List<SongType> showType() {
		// TODO Auto-generated method stub
		return typeDao.findAllType();
	}

	public List<SongType> showOneType(int id) {
		// TODO Auto-generated method stub
		return typeDao.findByTypeId(id);
	}

	public void delType(int id) {
		// TODO Auto-generated method stub
		typeDao.deleByTypeId(id);
	}

	public void chaType(SongType songType) {
		// TODO Auto-generated method stub
		typeDao.chaByTypeId(songType);
	}

	public void addType(String type) {
		// TODO Auto-generated method stub
		typeDao.insertType(type);
	}

	

}
