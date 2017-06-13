package com.musicplayer.entity;

import java.util.Date;

public class Click {

	private int clickId;
	private int songId;
	private String userName;
	private Date clickTime;
	public int getClickId() {
		return clickId;
	}
	public void setClickId(int clickId) {
		this.clickId = clickId;
	}
	public int getSongId() {
		return songId;
	}
	public void setSongId(int songId) {
		this.songId = songId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Date getClickTime() {
		return clickTime;
	}
	public void setClickTime(Date clickTime) {
		this.clickTime = clickTime;
	}
	
	
}
