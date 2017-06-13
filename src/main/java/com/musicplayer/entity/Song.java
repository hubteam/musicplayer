package com.musicplayer.entity;

import java.util.Date;

public class Song {

	private int songId;
	private String lyricAddr;
	private Data data;
    private int singerId;
    private Download down;
    private Click click;
    private Like like;
	
	
	public Like getLike() {
		return like;
	}
	public void setLike(Like like) {
		this.like = like;
	}
	public Click getClick() {
		return click;
	}
	public void setClick(Click click) {
		this.click = click;
	}
	public Download getDown() {
		return down;
	}
	public void setDown(Download down) {
		this.down = down;
	}
	public int getSingerId() {
		return singerId;
	}
	public void setSingerId(int singerId) {
		this.singerId = singerId;
	}
	private Singer singer;
	private int commentId;
	private int dataId;
	private int songTypeId;
	private String songName;
	private Date songTime;
	private String songAddr;
	private String songType;
	
	public String getSongType() {
		return songType;
	}
	public void setSongType(String songType) {
		this.songType = songType;
	}
	
	public int getSongId() {
		return songId;
	}
	public void setSongId(int songId) {
		this.songId = songId;
	}
	public String getLyricAddr() {
		return lyricAddr;
	}
	public void setLyricAddr(String lyricAddr) {
		this.lyricAddr = lyricAddr;
	}
	public Singer getSinger() {
		return singer;
	}
	public void setSinger(Singer singer) {
		this.singer = singer;
	}
	public Data getData() {
		return data;
	}
	public void setData(Data data) {
		this.data = data;
	}
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public int getDataId() {
		return dataId;
	}
	public void setDataId(int dataId) {
		this.dataId = dataId;
	}
	public int getSongTypeId() {
		return songTypeId;
	}
	public void setSongTypeId(int songTypeId) {
		this.songTypeId = songTypeId;
	}
	public String getSongName() {
		return songName;
	}
	public void setSongName(String songName) {
		this.songName = songName;
	}
	public Date getSongTime() {
		return songTime;
	}
	public void setSongTime(Date songTime) {
		this.songTime = songTime;
	}
	public String getSongAddr() {
		return songAddr;
	}
	public void setSongAddr(String songAddr) {
		this.songAddr = songAddr;
	}
	
}
