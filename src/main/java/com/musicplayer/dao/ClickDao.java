package com.musicplayer.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.musicplayer.entity.Data;
import com.musicplayer.entity.Song;
import com.musicplayer.util.Page;

@Repository(value="clickDao")
public interface ClickDao {

	List<Data> findAllClick(Page page);
	List<Data> findClickByName(String name);
	//List<Data> clickMany();
	List<Song> clickMany();
	//List<Data> downLoadMany();
	List<Song> downLoadMany();
	int clickFlag(int id);
	void updDownload(int id);
	void updClick(int id);
	void insertData(Data data);
	int allClickCount();
	List<Data> findClicks();
	
}
