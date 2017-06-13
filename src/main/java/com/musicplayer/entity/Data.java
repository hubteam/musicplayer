package com.musicplayer.entity;

public class Data {

	private int dataId;

	public Song getSong() {
		return song;
	}
	public void setSong(Song song) {
		this.song = song;
	}
	private Song song;
	private int click;
	private int download;
	private int songId;
	
	public int getSongId() {
		return songId;
	}
	public void setSongId(int songId) {
		this.songId = songId;
	}
	public int getDataId() {
		return dataId;
	}
	public void setDataId(int dataId) {
		this.dataId = dataId;
	}

	public int getClick() {
		return click;
	}
	public void setClick(int click) {
		this.click = click;
	}
	public int getDownload() {
		return download;
	}
	public void setDownload(int download) {
		this.download = download;
	}
}
