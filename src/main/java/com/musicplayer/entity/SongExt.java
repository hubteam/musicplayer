package com.musicplayer.entity;

import java.util.List;

public class SongExt extends Song{

	private Data data;
	
	private SongType songtype;
    private List<Singer> singers;
    
   
    
	public SongType getSongtype() {
		return songtype;
	}
	public void setSongtype(SongType songtype) {
		this.songtype = songtype;
	}
	public List<Singer> getSingers() {
		return singers;
	}
	public void setSingers(List<Singer> singers) {
		this.singers = singers;
	}
	public Data getData() {
		return data;
	}
	public void setData(Data data) {
		this.data = data;
	}
    
	
	
}
