package com.musicplayer.entity;

import java.util.List;

public class SingerExt extends Singer{

	private List<Song> song;

	public List<Song> getSong() {
		return song;
	}

	public void setSong(List<Song> song) {
		this.song = song;
	}
}
