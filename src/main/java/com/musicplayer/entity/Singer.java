package com.musicplayer.entity;

public class Singer {

	private int singerId;
	private String singerPictureAddr;
	private String singerName;
	
	private String singerType;
	private String singerIntro;
	public int getSingerId() {
		return singerId;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return singerName;
	}
	public void setSingerId(int singerId) {
		this.singerId = singerId;
	}
	public String getSingerPictureAddr() {
		return singerPictureAddr;
	}
	public void setSingerPictureAddr(String singerPictureAddr) {
		this.singerPictureAddr = singerPictureAddr;
	}
	public String getSingerName() {
		return singerName;
	}
	public void setSingerName(String singerName) {
		this.singerName = singerName;
	}
	
	public String getSingerType() {
		return singerType;
	}
	public void setSingerType(String singerType) {
		this.singerType = singerType;
	}
	public String getSingerIntro() {
		return singerIntro;
	}
	public void setSingerIntro(String singerIntro) {
		this.singerIntro = singerIntro;
	}
}
